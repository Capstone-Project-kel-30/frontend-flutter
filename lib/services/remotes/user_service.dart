import 'package:dio/dio.dart';

import '../../models/user_model.dart';
import '../../utils/urls/url.dart';
import 'dio.dart';

class UserService {
  UserService() {
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
      if (e.response != null) {
        throw (e.response!.data['errors'][0]);
      } else if (e.type == DioErrorType.connectTimeout) {
        throw ('request timeout, please check your connection');
      } else {
        throw ('server error');
      }
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
