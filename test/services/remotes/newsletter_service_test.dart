import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:workout_zone/models/newsletter__model.dart';
import 'package:workout_zone/services/remotes/newsletter_service.dart';
import 'package:workout_zone/utils/urls/url.dart';

void main() {
  late NewsletterService newsletterService;
  late Dio dio;
  late DioAdapter dioAdapter;
  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    newsletterService = NewsletterService(dio: dio);
  });
  group('newsletter', () {
    test(
      'should return correct newsletter model when get all newsletter',
      () async {
        // arrange
        const response = {
          "status": true,
          "message": "All Newsletter found",
          "errors": null,
          "data": [
            {
              "id": 1,
              "title": "yoga",
              "date": "07-07-2022",
              "content": "jhjf",
              "image":
                  "https://i.ibb.co/MRF61vJ/9b6bc04bbb888e1058424911a73bf16b.jpg"
            },
            {
              "id": 2,
              "title": "yoga",
              "date": "07-07-2022",
              "content": "jhjf",
              "image":
                  "https://i.ibb.co/7NS9WMp/9b6bc04bbb888e1058424911a73bf16b.jpg"
            }
          ]
        };
        dioAdapter.onGet(
          urls.getAllNewsletter(),
          (server) {
            server.reply(200, response);
          },
        );

        // act
        final actual = await newsletterService.getAllNewsletter();

        // assert
        expect(actual, NewsletterModel.fromJson(response));
      },
    );
    test(
      'should return correct newsletter model when get newsletter by id',
      () async {
        // arrange
        const response = {
          "status": true,
          "message": "Member found",
          "errors": null,
          "data": {
            "id": 1,
            "title": "yoga",
            "date": "07-07-2022",
            "content": "jhjf",
            "image":
                "https://i.ibb.co/MRF61vJ/9b6bc04bbb888e1058424911a73bf16b.jpg"
          }
        };
        dioAdapter.onGet(
          urls.getNewsletterById("1"),
          (server) {
            server.reply(200, response);
          },
        );

        // act
        final actual = await newsletterService.getNewsletterById("1");

        // assert
        expect(actual, NewsletterModel.fromJson(response));
      },
    );
  });
}
