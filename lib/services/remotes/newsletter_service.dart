import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:workout_zone/models/newsletter__model.dart';

import '../../utils/urls/url.dart';
import 'dio_error_handler.dart';

class NewsletterService {
  final Dio dio;
  NewsletterService({required this.dio}) {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
  Future<NewsletterModel> getAllNewsletter() async {
    try {
      final Response response = await dio.get(
        urls.getAllNewsletter(),
      );
      final NewsletterModel newsletters =
          NewsletterModel.fromJson(response.data);
      return newsletters;
    } on DioError catch (e) {
      throw (dioErrorHandler(e));
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ('server error');
    }
  }

  Future<NewsletterModel> getNewsletterById(String id) async {
    try {
      final Response response = await dio.get(urls.getNewsletterById(id));
      final NewsletterModel newsletter =
          NewsletterModel.fromJson(response.data);
      return newsletter;
    } on DioError catch (e) {
      throw (dioErrorHandler(e));
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw ('server error');
    }
  }
}
