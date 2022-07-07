import 'package:dio/dio.dart';

String dioErrorHandler(DioError e) {
  if (e.response != null) {
    if (e.response!.data['errors'][0] == 'Failed to validate token') {
      throw ('Failed to validate token, please re-login');
    }
    throw (e.response!.data['errors'][0]);
  } else if (e.type == DioErrorType.connectTimeout) {
    throw ('request timeout, please check your connection');
  } else {
    throw ('server error');
  }
}
