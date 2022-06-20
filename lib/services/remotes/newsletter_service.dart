import 'package:dio/dio.dart';

import '../../utils/urls/url.dart';

class NewsletterService {
  final Dio _dio = Dio();
  getAllNewsletter(String authorization) async {
    final Map<String, String> header = {
      'Authorization': authorization,
    };
    try {
      final Response response = await _dio.post(
        urls.getAllNewsletter(),
        options: Options(headers: header),
      );
    } catch (e) {
      throw ('Server Error');
    }
  }

  getNewsletterById(String id) async {
    try {
      final Response response = await _dio.get(urls.getNewsletterById(id));
    } catch (e) {
      throw ('Server Error');
    }
  }
}
