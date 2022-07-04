import 'package:dio/dio.dart';

import '../../models/class_model.dart';
import '../../utils/urls/url.dart';
import 'dio.dart';

class OnlineClassService {
  OnlineClassService() {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
  Future<ClassModel> getAllOnlineClass() async {
    try {
      final Response response = await dio.get(
        urls.getAllOnlineClass(),
      );
      final ClassModel onlineClass = ClassModel.fromJson(response.data);
      return onlineClass;
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

  Future<ClassModel> getOnlineClassById(String id) async {
    try {
      final Response response = await dio.get(urls.getOnlineClassById(id));
      final ClassModel onlineClass = ClassModel.fromJson(response.data);
      return onlineClass;
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

  searchOnlineClass(String keyword) async {
    final Map<String, String> query = {
      'search': keyword,
    };
    try {
      final Response response = await dio.post(
        urls.searchOnlineClass(),
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
