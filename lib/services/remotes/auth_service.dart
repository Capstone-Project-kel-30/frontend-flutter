import 'package:dio/dio.dart';

import '../../models/user_model.dart';
import '../../utils/urls/url.dart';

class AuthService {
  final Dio _dio = Dio();
  Future<UserModel> register({
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    final Map<String, String> data = {
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
    };
    try {
      final Response response =
          await _dio.post(urls.userRegister(), data: data);
      final UserModel user = UserModel.fromJson(response.data);
      // if there is an error
      if (user.errors != null) {
        if (user.errors == ['user already exist']) {
          throw ('user already exist, please sign in');
        }
      }
      return user;
    } catch (e) {
      throw ('server error');
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final Map<String, String> data = {
        'email': email,
        'password': password,
      };
      final Response response = await _dio.post(urls.userLogin(), data: data);
      final UserModel user = UserModel.fromJson(response.data);
      if (user.errors != null) {
        if (user.errors == ['invalid credentials']) {
          throw ('invalid credentials');
        }
      }
      return user;
    } catch (e) {
      throw ('server error');
    }
  }

  Future<UserModel> verifyEmail({required String email}) async {
    final Map<String, String> data = {
      'email': email,
    };
    try {
      final Response response = await _dio.post(
        urls.verifyUserEmail(),
        data: data,
      );
      final UserModel user = UserModel.fromJson(response.data);
      return user;
    } catch (e) {
      throw ('server error');
    }
  }

  Future<UserModel> resetPassword({
    required String email,
    required String password,
  }) async {
    final Map<String, String> data = {
      'email': email,
      'password': password,
    };
    try {
      final Response response = await _dio.post(
        urls.userResetPassword(),
        data: data,
      );
      final UserModel user = UserModel.fromJson(response.data);
      return user;
    } catch (e) {
      throw ('server error');
    }
  }
}
