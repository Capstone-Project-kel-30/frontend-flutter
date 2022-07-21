import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:workout_zone/services/remotes/dio_error_handler.dart';

import '../../dummy/dummy_data.dart';

void main() {
  group(
    'error handler',
    () {
      test(
        'when error is Failed to validate token '
        'should throw Failed to validate token, please re-login',
        () {
          // arrange
          final response = Response(
            requestOptions: RequestOptions(path: ''),
            data: {
              'errors': ['Failed to validate token'],
            },
          );
          final err = DioError(
            requestOptions: RequestOptions(path: ''),
            response: response,
          );
          const expected = 'Failed to validate token, please re-login';

          // act and assert
          expect(() => dioErrorHandler(err), throwsA(expected));
        },
      );
      test(
        'when error is not Failed to validate token '
        'should throws the error',
        () {
          // arrange
          final response = Response(
            requestOptions: RequestOptions(path: ''),
            data: {
              'errors': [errorMsg],
            },
          );
          final err = DioError(
            requestOptions: RequestOptions(path: ''),
            response: response,
          );
          const expected = errorMsg;

          // act and assert
          expect(() => dioErrorHandler(err), throwsA(expected));
        },
      );
      test(
        'when error is connection timeout '
        'should throw request timeout, please check your connection',
        () {
          // arrange
          final err = DioError(
            requestOptions: RequestOptions(path: ''),
            type: DioErrorType.connectTimeout,
          );
          const expected = 'request timeout, please check your connection';

          // act and assert
          expect(() => dioErrorHandler(err), throwsA(expected));
        },
      );
      test(
        'when error is none of above '
        'should throw server error',
        () {
          // arrange
          final err = DioError(
            requestOptions: RequestOptions(path: ''),
            type: DioErrorType.other,
          );
          const expected = 'server error';

          // act and assert
          expect(() => dioErrorHandler(err), throwsA(expected));
        },
      );
    },
  );
}
