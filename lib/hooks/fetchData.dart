import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Variables ----------------
late Dio dio;

// Инициализация Dio
Future<void> initDio() async {
  // Создайте экземпляр Dio
  dio = Dio();
}

/*
  Хук для запросов ----------------
 */
Future<dynamic> fetchData(
  String url, {
  Map<String, dynamic>? query,
  Map<String, dynamic>? body,
  Map<String, String>? form,
  String method = 'GET',
  BuildContext? context,
}) async {
  // Variables ----------------
  String baseUrl = dotenv.env['API_URL']!;

  // Получаем токен из SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('auth_token');

  // Полный url
  Uri fullUrl = Uri.parse('$baseUrl$url').replace(
      queryParameters: query?.map((key, value) {
    return MapEntry(key, value.toString());
  }));

  // Настройка заголовков
  Options options = Options(headers: {
    'Accept': 'application/json',
  });

  // Если токен есть, добавляем его в заголовки
  if (token != null) {
    options.headers?['Authorization'] = 'Bearer $token';
  }

  try {
    // FormData
    if (method == 'POST' && form != null && form.isNotEmpty) {
      FormData formData = FormData.fromMap(form);
      Response response =
          await dio.post(fullUrl.toString(), data: formData, options: options);

      return response.data;
    }
    // POST-запрос
    else if (method == 'POST') {
      options.headers?['Content-Type'] = 'application/json';
      Response response = await dio.post(fullUrl.toString(),
          data: body != null ? jsonEncode(body) : null, options: options);

      return response.data;
    }
    // GET-запрос
    else {
      Response response = await dio.get(fullUrl.toString(), options: options);

      return response.data;
    }
  } on DioError catch (e) {
    if (e.response != null) {
      return {'status': e.response!.statusCode, 'error': e.response!.data};
    } else {
      // Обработка ошибок Dio, которые не связаны с ответом сервера
      throw 'Error occurred: ${e.message}';
    }
  }
}
