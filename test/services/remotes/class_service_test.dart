import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:workout_zone/models/class_model.dart';
import 'package:workout_zone/services/remotes/class_service.dart';
import 'package:workout_zone/utils/urls/url.dart';

void main() {
  late ClassService classService;
  late Dio dio;
  late DioAdapter dioAdapter;
  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    classService = ClassService(dio: dio);
  });
  group(
    'offline class',
    () {
      test(
        'should return correct class model when get all class',
        () async {
          // arrange
          final response = {
            "status": true,
            "message": "All Class found",
            "errors": null,
            "data": [
              {
                "id": 3,
                "classname": "boxing baru 3",
                "status": "Available",
                "capacity": 10,
                "trainer": "ray",
                "date": "05-07-2022",
                "clock": "16:00",
                "clastype": "offline",
                "duration": 90,
                "user_booked": 9,
                "description": "deskripsi boxing",
                "image":
                    "https://i.ibb.co/Ytc9415/47f13ef23feff41d059c824b13394a6c.png"
              },
              {
                "id": 1,
                "classname": "Zumba online Tes 2",
                "status": "Available",
                "capacity": 10,
                "trainer": "koko",
                "date": "09-09-3900",
                "clock": "19:11",
                "clastype": "offline",
                "duration": 120,
                "user_booked": 8,
                "description": "ini deskripsi zumba online",
                "image":
                    "https://i.ibb.co/GcwGM23/2ad16916a5db5804ce27e46756dc96a8.jpg"
              },
            ]
          };
          dioAdapter.onGet(
            urls.getAllOfflineClass(),
            (server) {
              server.reply(200, response);
            },
          );

          // act
          final actual = await classService.getAllOfflineClass();

          // assert
          expect(actual, ClassModel.fromJson(response));
        },
      );
      test(
        'should return correct class model when get class by id',
        () async {
          // arrange
          const response = {
            "status": true,
            "message": "Member found",
            "errors": null,
            "data": {
              "id": 1,
              "classname": "Zumba online Tes 2",
              "status": "Available",
              "capacity": 10,
              "trainer": "koko",
              "date": "09-09-3900",
              "clock": "19:11",
              "clastype": "offline",
              "duration": 120,
              "user_booked": 8,
              "description": "ini deskripsi zumba online",
              "image":
                  "https://i.ibb.co/GcwGM23/2ad16916a5db5804ce27e46756dc96a8.jpg"
            }
          };
          dioAdapter.onGet(
            urls.getOfflineClassById("1"),
            (server) {
              server.reply(200, response);
            },
          );

          // act
          final actual = await classService.getOfflineClassById("1");

          // assert
          expect(actual, ClassModel.fromJson(response));
        },
      );
    },
  );
  group(
    'online class',
    () {
      test(
        'should return correct class model when get all class',
        () async {
          // arrange
          final response = {
            "status": true,
            "message": "All Class found",
            "errors": null,
            "data": [
              {
                "id": 3,
                "classname": "boxing baru 3",
                "status": "Available",
                "capacity": 10,
                "trainer": "ray",
                "date": "05-07-2022",
                "clock": "16:00",
                "clastype": "online",
                "duration": 90,
                "user_booked": 9,
                "description": "deskripsi boxing",
                "image":
                    "https://i.ibb.co/Ytc9415/47f13ef23feff41d059c824b13394a6c.png"
              },
              {
                "id": 1,
                "classname": "Zumba online Tes 2",
                "status": "Available",
                "capacity": 10,
                "trainer": "koko",
                "date": "09-09-3900",
                "clock": "19:11",
                "clastype": "online",
                "duration": 120,
                "user_booked": 8,
                "description": "ini deskripsi zumba online",
                "image":
                    "https://i.ibb.co/GcwGM23/2ad16916a5db5804ce27e46756dc96a8.jpg"
              },
            ]
          };
          dioAdapter.onGet(
            urls.getAllOnlineClass(),
            (server) {
              server.reply(200, response);
            },
          );

          // act
          final actual = await classService.getAllOnlineClass();

          // assert
          expect(actual, ClassModel.fromJson(response));
        },
      );
      test(
        'should return correct class model when get class by id',
        () async {
          // arrange
          const response = {
            "status": true,
            "message": "Member found",
            "errors": null,
            "data": {
              "id": 1,
              "classname": "Zumba online Tes 2",
              "status": "Available",
              "capacity": 10,
              "trainer": "koko",
              "date": "09-09-3900",
              "clock": "19:11",
              "clastype": "online",
              "duration": 120,
              "user_booked": 8,
              "description": "ini deskripsi zumba online",
              "image":
                  "https://i.ibb.co/GcwGM23/2ad16916a5db5804ce27e46756dc96a8.jpg"
            }
          };
          dioAdapter.onGet(
            urls.getOnlineClassById("1"),
            (server) {
              server.reply(200, response);
            },
          );

          // act
          final actual = await classService.getOnlineClassById("1");

          // assert
          expect(actual, ClassModel.fromJson(response));
        },
      );
    },
  );
  group('all class', () {
    test(
      'should return correct class model when get all class',
      () async {
        // arrange
        final response = {
          "status": true,
          "message": "All Class found",
          "errors": null,
          "data": [
            {
              "id": 3,
              "classname": "boxing baru 3",
              "status": "Available",
              "capacity": 10,
              "trainer": "ray",
              "date": "05-07-2022",
              "clock": "16:00",
              "clastype": "online",
              "duration": 90,
              "user_booked": 9,
              "description": "deskripsi boxing",
              "image":
                  "https://i.ibb.co/Ytc9415/47f13ef23feff41d059c824b13394a6c.png"
            },
            {
              "id": 1,
              "classname": "Zumba online Tes 2",
              "status": "Available",
              "capacity": 10,
              "trainer": "koko",
              "date": "09-09-3900",
              "clock": "19:11",
              "clastype": "offline",
              "duration": 120,
              "user_booked": 8,
              "description": "ini deskripsi zumba online",
              "image":
                  "https://i.ibb.co/GcwGM23/2ad16916a5db5804ce27e46756dc96a8.jpg"
            },
          ]
        };
        dioAdapter.onGet(
          urls.getAllClass(),
          (server) {
            server.reply(200, response);
          },
        );

        // act
        final actual = await classService.getAllClass();

        // assert
        expect(actual, ClassModel.fromJson(response));
      },
    );
  });
}
