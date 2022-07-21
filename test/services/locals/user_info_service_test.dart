import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_zone/models/user_model.dart';
import 'package:workout_zone/services/locals/user_info_service.dart';

import '../../dummy/dummy_data.dart';

void main() {
  late UserInfoService userInfoService;
  group(
    'get user info',
    () {
      test(
        'should return correct user model',
        () async {
          // arrange
          const data = {
            "token": authorization,
            "name": name,
            "email": email,
            "phone": phone,
            "member_type": memberType,
            "password": password,
          };
          SharedPreferences.setMockInitialValues(data);
          final SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          userInfoService =
              UserInfoService(sharedPreferences: sharedPreferences);
          const expected = UserModel(
            data: User(
              token: authorization,
              name: name,
              email: email,
              phone: phone,
              memberType: memberType,
              password: password,
            ),
          );

          // act
          final actual = userInfoService.getUserInfo();

          // assert
          expect(actual, expected);
        },
      );
    },
  );
  group(
    'update user info',
    () {
      test(
        'should update data in shared preferences',
        () async {
          // arrange
          const data = {
            "token": authorization,
            "name": name,
            "email": email,
            "phone": phone,
            "member_type": memberType,
            "password": password,
          };
          SharedPreferences.setMockInitialValues(data);
          final SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          userInfoService =
              UserInfoService(sharedPreferences: sharedPreferences);
          const newName = 'new';
          const newEmail = 'newEmail@tested.com';
          const newPhone = '08129102135';
          const newMemberType = 'BRONZE';
          const newPassword = 'newPassword1234';
          const newHasLogin = true;
          const newAuthorization = 'asfgsdfasdfasdas';
          const newId = 1203;

          // act
          await userInfoService.updateUserInfo(
            hasLogin: newHasLogin,
            token: newAuthorization,
            id: newId,
            name: newName,
            email: newEmail,
            phone: newPhone,
            memberType: newMemberType,
            password: newPassword,
          );

          // assert
          final hasLoginActual = sharedPreferences.getBool("hasLogin");
          final tokenActual = sharedPreferences.getString("token");
          final idActual = sharedPreferences.getInt("id");
          final nameActual = sharedPreferences.getString("name");
          final emailActual = sharedPreferences.getString("email");
          final phoneActual = sharedPreferences.getString("phone");
          final passwordActual = sharedPreferences.getString("password");
          final memberTypeActual = sharedPreferences.getString("member_type");
          expect(hasLoginActual, newHasLogin);
          expect(tokenActual, newAuthorization);
          expect(idActual, newId);
          expect(nameActual, newName);
          expect(emailActual, newEmail);
          expect(phoneActual, newPhone);
          expect(passwordActual, newPassword);
          expect(memberTypeActual, newMemberType);
        },
      );
    },
  );
  group(
    'reset user info',
    () {
      test(
        'should wipe all the data in shared preferences',
        () async {
          // arrange
          const data = {
            "token": authorization,
            "name": name,
            "email": email,
            "phone": phone,
            "member_type": memberType,
            "password": password,
          };
          SharedPreferences.setMockInitialValues(data);
          final SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          userInfoService =
              UserInfoService(sharedPreferences: sharedPreferences);

          // act
          await userInfoService.resetUserInfo();

          // assert
          final tokenActual = sharedPreferences.getString("token");
          final nameActual = sharedPreferences.getString("name");
          final emailActual = sharedPreferences.getString("email");
          final phoneActual = sharedPreferences.getString("phone");
          final passwordActual = sharedPreferences.getString("password");
          final memberTypeActual = sharedPreferences.getString("member_type");
          expect(tokenActual, null);
          expect(nameActual, null);
          expect(emailActual, null);
          expect(phoneActual, null);
          expect(passwordActual, null);
          expect(memberTypeActual, null);
        },
      );
    },
  );
}
