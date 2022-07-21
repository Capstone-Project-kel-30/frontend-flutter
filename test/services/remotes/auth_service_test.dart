import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:workout_zone/models/user_model.dart';
import 'package:workout_zone/services/remotes/auth_service.dart';
import 'package:workout_zone/utils/urls/url.dart';

import '../../dummy/dummy_data.dart';

void main() {
  late AuthService authService;
  late Dio dio;
  late DioAdapter dioAdapter;
  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    authService = AuthService(dio: dio);
  });
  group('register', () {
    const Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
    const response = {
      "status": true,
      "message": "User created successfully",
      "errors": null,
      "data": {
        "id": 28,
        "name": "test",
        "email": "rdadani120901@gmail.com",
        "phone": "081121332100",
        "member_expired": "",
        "member_type": "",
        "token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMCIsImV4cCI6MTY4OTkyODcwNywiaWF0IjoxNjU4MzkyNzA3LCJpc3MiOiJhZG1pbiJ9.6lkhcqTjXM-VCGOW56yAXwzwnZNJ-hTGQEsfGd4EdHY",
        "totp": "185795"
      }
    };
    test(
      'should return correct user model',
      () async {
        // arrange
        dioAdapter.onPost(
          urls.userRegister(),
          (server) {
            server.reply(200, response);
          },
          data: data,
        );
        // act
        final actual = await authService.register(
          name: name,
          email: email,
          phone: phone,
          password: password,
        );

        // assert
        expect(actual, UserModel.fromJson(response));
      },
    );
  });
  group('login', () {
    final Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };
    const response = {
      "status": true,
      "message": "User logged in successfully",
      "errors": null,
      "data": {
        "id": 28,
        "name": "test",
        "email": "rdadani120901@gmail.com",
        "phone": "081121332100",
        "member_expired": "",
        "member_type": "",
        "token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMjgiLCJleHAiOjE2ODk5MzAxODEsImlhdCI6MTY1ODM5NDE4MSwiaXNzIjoiYWRtaW4ifQ.ocNi4-njf_F3IExR1VQ6SwXnVF7WNG8ju2olRZW60Ik"
      }
    };
    test('should return correct user model', () async {
      // arrange
      dioAdapter.onPost(
        urls.userLogin(),
        (server) {
          server.reply(200, response);
        },
        data: data,
      );

      // act
      final actual = await authService.login(email: email, password: password);

      // assert
      expect(actual, UserModel.fromJson(response));
    });
  });
  group('verify email', () {
    final Map<String, dynamic> data = {
      'email': email,
    };
    const response = {
      "status": true,
      "message": "User verified successfully",
      "errors": null,
      "data": {
        "id": 28,
        "name": "test",
        "email": "rdadani120901@gmail.com",
        "phone": "081121332100",
        "member_expired": "",
        "member_type": "",
        "totp": "509832"
      }
    };
    test(
      'should return correct user model',
      () async {
        // arrange
        dioAdapter.onPost(
          urls.verifyUserEmail(),
          (server) {
            server.reply(200, response);
          },
          data: data,
        );

        // act
        final actual = await authService.verifyEmail(email: email);

        // assert
        expect(actual, UserModel.fromJson(response));
      },
    );
  });
  group('reset password', () {
    final Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };
    const response = {
      "status": true,
      "message": "User Password reset successfully",
      "errors": null,
      "data": {
        "id": 28,
        "name": "test",
        "email": "rdadani120901@gmail.com",
        "phone": "081121332100",
        "member_expired": "",
        "member_type": ""
      }
    };
    test(
      'should return correct user model',
      () async {
        // arrange
        dioAdapter.onPost(
          urls.userResetPassword(),
          (server) {
            server.reply(200, response);
          },
          data: data,
        );

        // act
        final actual = await authService.resetPassword(
          email: email,
          password: password,
        );

        // assert
        expect(actual, UserModel.fromJson(response));
      },
    );
  });
}
