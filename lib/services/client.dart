// ignore_for_file: unnecessary_string_interpolations

import 'dart:io';

import 'package:dio/dio.dart';

import 'helper.dart';

// String url = 'https://lux-api-prod.herokuapp.com/api/';
// String url = 'https://api.medoc.care/api/';
String url = 'http://127.0.0.1:8000/api/'; // this is main url
// String url = 'https://9364-41-237-89-137.ngrok.io/api/';
// String url = 'http://lux-api-staging.herokuapp.com/api/';

Dio dio = Dio(BaseOptions(followRedirects: false));

Future<Response<dynamic>> get(String path) async {
  String token = await getToken();
  // print("==========================");
  // print("$url$path");
  // print("$token");
  // print("==========================");
  return dio
      .get('$url$path',
          options: Options(headers: {
            HttpHeaders.authorizationHeader:
                token.isEmpty ? '' : 'Bearer $token',
          }))
      .then((value) {
    return value;
  }).catchError(handleError);
}

Future<Response<dynamic>> post(String path, {dynamic data}) async {
  String token = await getToken();
  // print("==========================");
  // print("$url$path");
  // print("==========================");
  return dio
      .post('$url$path',
          data: data,
          options: Options(headers: {
            HttpHeaders.authorizationHeader:
                token.isEmpty ? '' : 'Bearer $token',
          }))
      .then((value) {
    return value;
  }).catchError(handleError);
}

Future<Response<dynamic>> put(String path, {dynamic data}) async {
  String token = await getToken();
  // print("==========================");
  // print("$url$path");
  // print("==========================");
  return dio
      .put('$url$path',
          data: data,
          options: Options(headers: {
            HttpHeaders.authorizationHeader:
                token.isEmpty ? '' : 'Bearer $token',
          }))
      .then((value) {
    return value;
  }).catchError(handleError);
}

Future<Response<dynamic>> delete(String path) async {
  String token = await getToken();
  // print("==========================");
  // print("$url$path");
  // print("==========================");
  return dio
      .delete('$url$path',
          options: Options(headers: {
            HttpHeaders.authorizationHeader:
                token.isEmpty ? '' : 'Bearer $token',
          }))
      .then((value) {
    return value;
  }).catchError(handleError);
}
