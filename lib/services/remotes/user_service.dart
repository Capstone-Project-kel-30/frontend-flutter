import 'package:dio/dio.dart';

import '../../models/user_model.dart';
import '../../utils/urls/url.dart';

class UserService {
  final Dio _dio = Dio();

  Future<UserModel> getUserProfile(String authorization) async {
    final Map<String, String> header = {
      'Authorization': authorization,
    };
    try {
      final Response response = await _dio.get(
        urls.userProfile(),
        options: Options(headers: header),
      );
      final UserModel user = UserModel.fromJson(response.data);
      return user;
    } catch (e) {
      throw ('Server Error');
    }
  }

  Future<UserModel> updateUserProfile({
    required String authorization,
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {
    final Map<String, String> header = {
      'Authorization': authorization,
    };
    final Map<String, dynamic> data = {
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
    };
    try {
      final Response response = await _dio.put(
        urls.updateUserProfile(),
        data: data,
        options: Options(headers: header),
      );
      final UserModel user = UserModel.fromJson(response.data);
      return user;
    } catch (e) {
      throw ('Server Error');
    }
  }
}
