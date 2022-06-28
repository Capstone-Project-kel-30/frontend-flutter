import 'package:dio/dio.dart';

import '../../models/user_model.dart';
import '../../utils/urls/url.dart';
import 'dio.dart';

class AuthService {
  AuthService() {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

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
      if (e.response!.data['errors'] != null) {
        throw (e.response!.data['errors'][0]);
      } else if (e.type == DioErrorType.connectTimeout) {
        throw ('request timeout, please check your connection');
      } else {
        throw ('server error');
      }
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
      if (e.response != null) {
        throw (e.response!.data['errors'][0]);
      } else if (e.type == DioErrorType.connectTimeout) {
        throw ('request timeout, please check your connection');
      } else {
        throw ('server error');
      }
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
      if (e.response != null) {
        throw (e.response!.data['errors'][0]);
      } else if (e.type == DioErrorType.connectTimeout) {
        throw ('request timeout, please check your connection');
      } else {
        throw ('server error');
      }
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
      if (e.response != null) {
        throw (e.response!.data['errors'][0]);
      } else if (e.type == DioErrorType.connectTimeout) {
        throw ('request timeout, please check your connection');
      } else {
        throw ('server error');
      }
    } catch (e) {
      throw ('server error');
    }
  }
}
