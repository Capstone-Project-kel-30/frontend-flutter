import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:workout_zone/services/remotes/dio_error_handler.dart';

import '../../models/user_model.dart';
import '../../utils/urls/url.dart';

class AuthService {
  AuthService({required this.dio}) {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
  final Dio dio;

  Future<UserModel> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    final Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
    try {
      final Response response = await dio.post(urls.userRegister(), data: data);
      final UserModel user = UserModel.fromJson(response.data);
      return user;
    } on DioError catch (e) {
      throw (dioErrorHandler(e));
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ('server error');
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> data = {
        'email': email,
        'password': password,
      };
      final Response response = await dio.post(urls.userLogin(), data: data);
      final UserModel user = UserModel.fromJson(response.data);
      return user;
    } on DioError catch (e) {
      throw (dioErrorHandler(e));
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ('server error');
    }
  }

  Future<UserModel> verifyEmail({required String email}) async {
    final Map<String, dynamic> data = {
      'email': email,
    };
    try {
      final Response response = await dio.post(
        urls.verifyUserEmail(),
        data: data,
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

  Future<UserModel> resetPassword({
    required String email,
    required String password,
  }) async {
    final Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };
    try {
      final Response response = await dio.post(
        urls.userResetPassword(),
        data: data,
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
