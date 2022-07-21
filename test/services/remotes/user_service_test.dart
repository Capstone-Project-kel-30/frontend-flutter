import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:workout_zone/models/user_model.dart';
import 'package:workout_zone/services/remotes/user_service.dart';
import 'package:workout_zone/utils/urls/url.dart';

import '../../dummy/dummy_data.dart';

void main() {
  late UserService userService;
  late Dio dio;
  late DioAdapter dioAdapter;
  const Map<String, dynamic> header = {
    "Authorization": authorization,
  };
  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    userService = UserService(dio: dio);
  });
  group('user profile', () {
    test(
      'should return correct user model when get user profile',
      () async {
        // arrange
        const response = {
          "status": true,
          "message": "User found",
          "errors": null,
          "data": {
            "id": 2,
            "name": "test update lagi",
            "email": "test@tested.com",
            "phone": "081211903299",
            "member_expired": "2022-12-21",
            "member_type": "SILVER"
          }
        };
        dioAdapter.onGet(
          urls.userProfile(),
          (server) {
            server.reply(200, response);
          },
          headers: header,
        );

        // act
        final actual = await userService.getUserProfile(authorization);

        // assert
        expect(actual, UserModel.fromJson(response));
      },
    );
    test(
      'should return correct user model after update',
      () async {
        // arrange
        final Map<String, dynamic> data = {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
        };
        const response = {
          "status": true,
          "message": "User updated",
          "errors": null,
          "data": {
            "id": 2,
            "name": "test update",
            "email": "rdadani120901@gmail.com",
            "phone": "081211903244",
            "member_expired": "2022-12-21",
            "member_type": "SILVER"
          }
        };
        dioAdapter.onPut(
          urls.updateUserProfile(),
          (server) {
            server.reply(200, response);
          },
          data: data,
          headers: header,
        );

        // act
        final actual = await userService.updateUserProfile(
          authorization: authorization,
          name: name,
          email: email,
          password: password,
          phone: phone,
        );

        // assert
        expect(actual, UserModel.fromJson(response));
      },
    );
  });
}
