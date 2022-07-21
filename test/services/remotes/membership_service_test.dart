import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:workout_zone/models/book_info_model.dart';
import 'package:workout_zone/models/membership_model.dart';
import 'package:workout_zone/models/membership_payment_model.dart';
import 'package:workout_zone/models/schedule_info_model.dart';
import 'package:workout_zone/services/remotes/membership_service.dart';
import 'package:workout_zone/utils/urls/url.dart';

import '../../dummy/dummy_data.dart';

void main() {
  late MembershipService membershipService;
  late Dio dio;
  late DioAdapter dioAdapter;
  const Map<String, dynamic> header = {
    "Authorization": authorization,
  };
  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    membershipService = MembershipService(dio: dio);
  });
  group(
    'register',
    () {
      final Map<String, dynamic> data = {
        "membership_id": membershipId,
      };
      const response = {
        "status": true,
        "message": "Payment Created",
        "errors": null,
        "data": {
          "id": 14,
          "user": {
            "id": 2,
            "name": "test update lagi",
            "email": "test@tested.com",
            "phone": "081211903299",
            "member_expired": "2022-12-21",
            "member_type": "SILVER"
          },
          "membership": {
            "id": 2,
            "type": "SILVER",
            "price": 550000,
            "duration": 5
          },
          "amount": 550000,
          "snap_url":
              "https://app.sandbox.midtrans.com/snap/v3/redirection/5caa3f7f-9d20-4526-97a6-ddfe8136bc87"
        }
      };
      test(
        'should return correct membership payment model',
        () async {
          // arrange
          dioAdapter.onPost(
            urls.userRegisterMembership(),
            (server) {
              server.reply(200, response);
            },
            data: data,
            headers: header,
          );

          // act
          final actual = await membershipService.membershipRegister(
            membershipId: membershipId,
            authorization: authorization,
          );

          // assert
          expect(actual, MembershipPaymentModel.fromJson(response));
        },
      );
    },
  );
  group('payment info', () {
    const response = {
      "status": true,
      "message": "Payment found",
      "errors": null,
      "data": {
        "id": 2,
        "user": {
          "id": 2,
          "name": "test update lagi",
          "email": "test@tested.com",
          "phone": "081211903299",
          "member_expired": "2023-07-14",
          "member_type": "GOLD"
        },
        "membership": {
          "id": 1,
          "type": "GOLD",
          "price": 990000,
          "duration": 12
        },
        "amount": 990000
      }
    };
    test(
      'should return correct membership payment model',
      () async {
        // arrange
        dioAdapter.onGet(
          urls.userMembershipPaymentInfo(),
          (server) {
            server.reply(200, response);
          },
          headers: header,
        );

        // act
        final actual =
            await membershipService.membershipPaymentInfo(authorization);

        // assert
        expect(actual, MembershipPaymentModel.fromJson(response));
      },
    );
  });
  group('membership list', () {
    test(
      'should return correct membership model when get all membership',
      () async {
        // arrange
        const response = {
          "status": true,
          "message": "All Membership types",
          "errors": null,
          "data": [
            {
              "id": 1,
              "type": "GOLD",
              "price": 990000,
              "duration": 12,
              "description": "ini description type ",
              "img":
                  "https://i.ibb.co/fthXqcJ/2ad16916a5db5804ce27e46756dc96a8.jpg"
            },
            {
              "id": 3,
              "type": "BRONZE",
              "price": 290000,
              "duration": 1,
              "description": "ini description type ",
              "img":
                  "https://i.ibb.co/GTL7HNV/b9336ae423a74eb6d2a20915cd088150.png"
            },
            {
              "id": 2,
              "type": "SILVER",
              "price": 550000,
              "duration": 5,
              "description": "ini deskripsi",
              "img":
                  "https://i.ibb.co/ccqSCNB/5f67208832ee8ebeb9c87690b4411ea7.png"
            }
          ]
        };
        dioAdapter.onGet(
          urls.membershipDetails(),
          (server) {
            server.reply(200, response);
          },
        );

        // act
        final actual = await membershipService.getMembershipDetails();

        // assert
        expect(actual, MembershipModel.fromJson(response));
      },
    );
    test(
      'should return correct memberhip model when get membership by id',
      () async {
        // arrange
        const response = {
          "status": true,
          "message": "Member found",
          "errors": null,
          "data": {
            "id": 1,
            "type": "GOLD",
            "price": 990000,
            "duration": 12,
            "description": "ini description type ",
            "img":
                "https://i.ibb.co/fthXqcJ/2ad16916a5db5804ce27e46756dc96a8.jpg"
          }
        };
        dioAdapter.onGet(
          urls.membershipDetailById("1"),
          (server) {
            server.reply(200, response);
          },
        );

        // act
        final actual = await membershipService.getMembershipById("1");

        // assert
        expect(actual, MembershipModel.fromJson(response));
      },
    );
  });
  group('booking', () {
    test(
      'should return correct book info model',
      () async {
        // arrange
        const response = {
          "status": true,
          "message": "User Booke Succsessfully",
          "errors": null,
          "data": {
            "user_id": 1,
            "class": {
              "ID": 2,
              "Classname": "Zumba online Tes 233",
              "Trainer": "koko",
              "Date": "09-09-3900",
              "Clock": "19:11",
              "Description": "ini deskripsi zumba online",
              "ClassType": "offline",
              "Capacity": 0,
              "UserBooked": 0,
              "Status": ""
            }
          }
        };
        final Map<String, dynamic> data = {
          'class_id': 2,
        };
        dioAdapter.onPost(
          urls.userBookingClass(),
          (server) {
            server.reply(200, response);
          },
          data: data,
          headers: header,
        );

        // act
        final actual = await membershipService.bookingClass(
          classId: 2,
          authorization: authorization,
        );

        // assert
        expect(actual, BookInfoModel.fromJson(response));
      },
    );
  });
  group(
    'schedule',
    () {
      test(
        'should return correct schedule info model',
        () async {
          // arrange
          const response = {
            "status": true,
            "message": "User Booke Succsessfully",
            "errors": null,
            "data": {
              "user_id": 2,
              "class": [
                {
                  "ID": 2,
                  "Classname": "test 1",
                  "Trainer": "koko",
                  "Date": "09-09-3900",
                  "Clock": "19:11",
                  "Description": "test",
                  "ClassType": "offline",
                  "Capacity": 0,
                  "UserBooked": 0,
                  "Status": ""
                },
                {
                  "ID": 1,
                  "Classname": "test 2",
                  "Trainer": "koko",
                  "Date": "09-09-3900",
                  "Clock": "19:11",
                  "Description": "test",
                  "ClassType": "online",
                  "Capacity": 0,
                  "UserBooked": 0,
                  "Status": ""
                },
              ]
            }
          };
          dioAdapter.onGet(
            urls.userClassSchedule(),
            (server) {
              server.reply(200, response);
            },
            headers: header,
          );

          // act
          final actual =
              await membershipService.userClassSchedule(authorization);

          // assert
          expect(actual, ScheduleInfoModel.fromJson(response));
        },
      );
    },
  );
}
