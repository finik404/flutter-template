import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:talktime/config/variables.dart';
import 'package:talktime/core/models/base.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Variables ----------------
late Dio dio;

// Инициализация Dio
void initDio() async {
  // Создайте экземпляр Dio
  dio = Dio();
}

/*
  Хук для запросов ----------------
 */
Future<TResponse> useFetch(
    String url, {
      Map<String, dynamic>? query,
      Map<String, dynamic>? body,
      Map<String, String>? form,
      String method = 'GET',
    }) async {
  print('request');

  // Variables ----------------
  String baseUrl = Variables.apiUrl;

  // Получаем токен
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('auth_token');

  // Настройка заголовков
  Options options = Options(headers: {
    'Accept': 'application/json',
  });

  // Если токен есть, добавляем его в заголовки
  if (token != null) {
    options.headers?['Authorization'] = 'Bearer $token';
  }

  // Формируем полный URL
  Uri fullUrl = Uri.parse('$baseUrl$url').replace(queryParameters: query?.map((key, value) {
    return MapEntry(key, value.toString());
  }));

  try {
    Response response;

    // POST-запрос с использованием FormData
    if (method == 'POST' && form != null && form.isNotEmpty) {
      // Создаем FormData для отправки файлов
      FormData formData = FormData();

      // Добавляем файлы из формы в FormData
      for (var entry in form.entries) {
        formData.files.add(MapEntry(
          entry.key,
          await MultipartFile.fromFile(entry.value),
        ));
      }

      if (body != null) {
        formData.fields.addAll(body.entries.map((entry) => MapEntry(entry.key, entry.value.toString())));
      }

      response = await dio.post(fullUrl.toString(), data: formData, options: options);
    }
    // POST-запрос
    else if (method == 'POST') {
      options.headers?['Content-Type'] = 'application/json';
      response = await dio.post(fullUrl.toString(), data: body != null ? jsonEncode(body) : null, options: options);
    }
    // GET-запрос
    else {
      response = await dio.get(fullUrl.toString(), options: options);
    }

    return TResponse(status: response.statusCode!, data: response.data?['data'], isError: false);
  } on DioError catch (e) {
    if (e.response != null) {
      // Обработка ошибок Dio, связанные с ответом сервера
      return TResponse(
        status: e.response!.statusCode!,
        errors: e.response?.data,
        message: e.response?.data?['message'],
        isError: e.response!.statusCode != 200 || e.response!.statusCode != 201,
      );
    } else {
      // Обработка ошибок Dio, которые не связаны с ответом сервера
      throw 'Error occurred: ${e.message}';
    }
  }
}
