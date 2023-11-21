import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:template/generated/l10n.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/*
  Хук для запросов ----------------
 */
class Api {
  // Variables ----------------
  String baseUrl = dotenv.env['API_URL']!;

  // Функция для выполнения запроса
  Future<dynamic> fetch(String url,
      {Map<String, dynamic>? query,
      Map<String, dynamic>? body,
      Map<String, String>? form,
      String method = 'GET',
      BuildContext? context}) async {
    Uri fullUrl = Uri.parse('$baseUrl$url').replace(
        queryParameters: query?.map((key, value) {
      return MapEntry(key, value.toString());
    }));
    http.Response? response;

    // Получаем токен из SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');

    // Настройка заголовков
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    // Если токен есть, добавляем его в заголовки
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    // Выполняем запрос в зависимости от выбранного метода
    if (method == 'POST' && form != null && form.isNotEmpty) {
      var request = http.MultipartRequest('POST', fullUrl);
      request.headers.addAll(headers);

      for (var entry in form.entries) {
        request.files.add(await http.MultipartFile.fromPath(
          entry.key,
          entry.value,
        ));
      }

      if (body != null) {
        request.fields
            .addAll(body.map((key, value) => MapEntry(key, value.toString())));
      }

      var streamedResponse = await request.send();

      if (streamedResponse.statusCode == 200) {
        var responseData = await streamedResponse.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        return json.decode(responseString);
      } else {
        // Обработка ошибок для StreamedResponse
        var responseString = await streamedResponse.stream.bytesToString();
        final data = json.decode(responseString);
        // ...
      }
    } else if (method == 'POST') {
      headers['Content-Type'] = 'application/json';
      response =
          await http.post(fullUrl, headers: headers, body: jsonEncode(body));
    } else {
      // GET по умолчанию
      response = await http.get(fullUrl, headers: headers);
    }

    // Проверяем статус ответа
    if (response != null &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      // Если все хорошо, возвращаем данные
      final data = json.decode(response.body);
      return data['data'];
    } else if (response != null) {
      // Если сервер вернул ошибки, обработаем их
      final data = json.decode(response.body);
      List<String> messagesArray = [];
      if (data['messages'] != null && context != null) {
        data['messages'].forEach((key, value) {
          if (value is List) {
            messagesArray.addAll(value.map((e) {
              if (e == 'The email has already been taken.') {
                return S.of(context).errors_auth_email;
              } else if (e == 'The provided credentials are incorrect.') {
                return S.of(context).errors_auth_data;
              } else {
                return e.toString();
              }
            }));
          }
        });

        // Прокидываем ошибки
        throw messagesArray.isNotEmpty
            ? messagesArray[0]
            : 'Unknown error occurred';
      }
    }
  }
}
