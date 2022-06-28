import 'package:dio/dio.dart';

import '../../utils/urls/url.dart';
import 'dio.dart';

class OfflineClassService {
  OfflineClassService() {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
  getAllOfflineClass(String authorization) async {
    final Map<String, String> header = {
      'Authorization': authorization,
    };
    try {
      final Response response = await dio.post(
        urls.getAllOfflineClass(),
        options: Options(headers: header),
      );
    } on DioError catch (e) {
      if (e.response != null) {
        throw (e.response!.data['errors'][0]);
      } else if (e.type == DioErrorType.connectTimeout) {
        throw ('request timeout, please check your connection');
      } else {
        throw ('server error');
      }
    }
  }

  getOfflineClassById(String id) async {
    try {
      final Response response = await dio.get(urls.getOfflineClassById(id));
    } on DioError catch (e) {
      if (e.response != null) {
        throw (e.response!.data['errors'][0]);
      } else if (e.type == DioErrorType.connectTimeout) {
        throw ('request timeout, please check your connection');
      } else {
        throw ('server error');
      }
    }
  }

  searchOfflineClass(String keyword) async {
    final Map<String, String> query = {
      'search': keyword,
    };
    try {
      final Response response = await dio.post(
        urls.searchOfflineClass(),
        queryParameters: query,
      );
    } on DioError catch (e) {
      if (e.response != null) {
        throw (e.response!.data['errors'][0]);
      } else if (e.type == DioErrorType.connectTimeout) {
        throw ('request timeout, please check your connection');
      } else {
        throw ('server error');
      }
    }
  }
}
