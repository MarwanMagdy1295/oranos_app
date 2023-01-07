// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:dio/dio.dart';

Future<String> getToken() async {
  String token = '';
  return token;
}

String flattenError(data) {
  String error = '';
  if (data is List) {
    for (var element in data) {
      error = error + element.toString();
    }
  } else {
    try {
      data.entries.forEach((entry) {
        error = error +
            '${entry.value is String ? entry.value : entry.value.join(',')}\n';
        error = error.replaceAll('[', '').replaceAll(']', '');
      });
    } catch (e) {}
  }

  return error.isEmpty ? "Something went wrong!" : error;
}

Future<Response<dynamic>> handleError(error) {
  // print("=========================");
  // print(error);
  // print("=========================");
  String errorMsg = '';
  if (error is Exception) {
    try {
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.cancel:
            errorMsg = "Request Cancelled";
            break;
          case DioErrorType.connectTimeout:
            errorMsg =
                "Looks like the server is taking to long to respond, this can be caused by either poor connectivity or an error with our servers. Please try again in a while";
            break;
          case DioErrorType.other:
            errorMsg = "No internet connection";
            break;
          case DioErrorType.receiveTimeout:
            errorMsg =
                "Looks like the server is taking to long to respond, this can be caused by either poor connectivity or an error with our servers. Please try again in a while";
            break;
          case DioErrorType.sendTimeout:
            errorMsg =
                "Looks like the server is taking to long to respond, this can be caused by either poor connectivity or an error with our servers. Please try again in a while";
            break;
          case DioErrorType.response:
            switch (error.response?.statusCode) {
              case 400:
                errorMsg = flattenError(error.response?.data);
                break;
              case 401:
                errorMsg = flattenError(error.response?.data);
                break;
              case 403:
                errorMsg = flattenError(error.response?.data);
                break;
              case 404:
                errorMsg = "Not found";
                break;
              case 500:
                errorMsg = "Internal Server Error";
                break;
              case 503:
                errorMsg = "Service unavailable";
                break;
              default:
                errorMsg = "Something went wrong!";
            }
            break;
        }
      } else if (error is SocketException) {
        errorMsg = "No internet connection";
      } else {
        errorMsg = "Something went wrong!";
      }
    } catch (_) {
      errorMsg = "Something went wrong!";
    }
  } else {
    if (error.toString().contains("is not a subtype of")) {
      errorMsg = "Unable to process the data";
    } else {
      errorMsg = "Something went wrong!";
    }
  }
  if (errorMsg == "Something went wrong!") {}
  throw errorMsg;
}
