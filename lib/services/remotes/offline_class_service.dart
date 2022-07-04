import 'package:dio/dio.dart';

import '../../models/class_model.dart';
import '../../utils/urls/url.dart';
import 'dio.dart';

class OfflineClassService {
  OfflineClassService() {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
  Future<ClassModel> getAllOfflineClass() async {
    try {
      final Response response = await dio.get(
        urls.getAllOfflineClass(),
      );
      final ClassModel offlineClass = ClassModel.fromJson(response.data);
      return offlineClass;
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

  Future<ClassModel> getOfflineClassById(String id) async {
    try {
      final Response response = await dio.get(urls.getOfflineClassById(id));
      final ClassModel offlineClass = ClassModel.fromJson(response.data);
      return offlineClass;
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
