import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../models/class_model.dart';
import '../../utils/urls/url.dart';
import 'dio.dart';
import 'dio_error_handler.dart';

class ClassService {
  ClassService() {
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
      throw (dioErrorHandler(e));
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ('server error');
    }
  }

  Future<ClassModel> getOfflineClassById(String id) async {
    try {
      final Response response = await dio.get(urls.getOfflineClassById(id));
      final ClassModel offlineClass = ClassModel.fromJson(response.data);
      return offlineClass;
    } on DioError catch (e) {
      throw (dioErrorHandler(e));
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ('server error');
    }
  }

  Future<ClassModel> getAllOnlineClass() async {
    try {
      final Response response = await dio.get(
        urls.getAllOnlineClass(),
      );
      final ClassModel onlineClass = ClassModel.fromJson(response.data);
      return onlineClass;
    } on DioError catch (e) {
      throw (dioErrorHandler(e));
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ('server error');
    }
  }

  Future<ClassModel> getOnlineClassById(String id) async {
    try {
      final Response response = await dio.get(urls.getOnlineClassById(id));
      final ClassModel onlineClass = ClassModel.fromJson(response.data);
      return onlineClass;
    } on DioError catch (e) {
      throw (dioErrorHandler(e));
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ('server error');
    }
  }

  Future<ClassModel> getAllClass() async {
    try {
      final Response response = await dio.get(urls.getAllClass());
      final ClassModel classes = ClassModel.fromJson(response.data);
      return classes;
    } on DioError catch (e) {
      throw (dioErrorHandler(e));
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ('server error');
    }
  }

  searchClass(String keyword) async {
    final Map<String, String> query = {
      'search': keyword,
    };
    try {
      await dio.get(
        urls.searchClass(),
        queryParameters: query,
      );
    } on DioError catch (e) {
      throw (dioErrorHandler(e));
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ('server error');
    }
  }
}
