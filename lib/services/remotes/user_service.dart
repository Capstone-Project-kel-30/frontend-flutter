import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../models/user_model.dart';
import '../../utils/urls/url.dart';
import 'dio_error_handler.dart';

class UserService {
  final Dio dio;
  UserService({required this.dio}) {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
  Future<UserModel> getUserProfile(String authorization) async {
    final Map<String, String> header = {
      'Authorization': authorization,
    };
    try {
      final Response response = await dio.get(
        urls.userProfile(),
        options: Options(headers: header),
      );
      final UserModel user = UserModel.fromJson(response.data);
      return user;
    } on DioError catch (e) {
      throw (dioErrorHandler(e));
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ('server error');
    }
  }

  Future<UserModel> updateUserProfile({
    required String authorization,
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    final Map<String, String> header = {
      'Authorization': authorization,
    };
    final Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
    try {
      final Response response = await dio.put(
        urls.updateUserProfile(),
        data: data,
        options: Options(headers: header),
      );
      final UserModel user = UserModel.fromJson(response.data);
      return user;
    } on DioError catch (e) {
      throw (dioErrorHandler(e));
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ('server error');
    }
  }
}
