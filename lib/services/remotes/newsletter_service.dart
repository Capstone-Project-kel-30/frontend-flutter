import 'package:dio/dio.dart';

import '../../utils/urls/url.dart';
import 'dio.dart';

class NewsletterService {
  NewsletterService() {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
  getAllNewsletter(String authorization) async {
    final Map<String, String> header = {
      'Authorization': authorization,
    };
    try {
      final Response response = await dio.post(
        urls.getAllNewsletter(),
        options: Options(headers: header),
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

  getNewsletterById(String id) async {
    try {
      final Response response = await dio.get(urls.getNewsletterById(id));
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
