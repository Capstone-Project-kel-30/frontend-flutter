import 'package:dio/dio.dart';

BaseOptions options = BaseOptions(
  connectTimeout: 5000,
);
final Dio dio = Dio(options);
