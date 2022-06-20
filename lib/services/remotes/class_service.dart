import 'package:dio/dio.dart';
import 'package:workout_zone/utils/urls/url.dart';

class ClassService {
  final Dio _dio = Dio();
  getAllClass(String authorization) async {
    final Map<String, String> header = {
      'Authorization': authorization,
    };
    try {
      final Response response = await _dio.post(
        urls.getAllClass(),
        options: Options(headers: header),
      );
    } catch (e) {
      throw ('Server Error');
    }
  }

  getClassById(String id) async {
    try {
      final Response response = await _dio.get(urls.getClassById(id));
    } catch (e) {
      throw ('Server Error');
    }
  }

  searchClass(String keyword) async {
    final Map<String, String> query = {
      'search': keyword,
    };
    try {
      final Response response = await _dio.post(
        urls.searchClass(),
        queryParameters: query,
      );
    } catch (e) {
      throw ('Server Error');
    }
  }
}
