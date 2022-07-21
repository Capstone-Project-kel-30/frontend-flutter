import 'package:flutter_test/flutter_test.dart';
import 'package:workout_zone/models/newsletter__model.dart';

void main() {
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
        "image": "https://i.ibb.co/MRF61vJ/9b6bc04bbb888e1058424911a73bf16b.jpg"
      },
    ]
  };
  const expectedModel = NewsletterModel(
    status: true,
    message: "All Newsletter found",
    data: [
      Newsletter(
        id: 1,
        title: "yoga",
        date: "07-07-2022",
        content: "jhjf",
        image: "https://i.ibb.co/MRF61vJ/9b6bc04bbb888e1058424911a73bf16b.jpg",
      ),
    ],
  );
  test('should return correct newsletter model', () {
    final actualModel = NewsletterModel.fromJson(response);
    expect(actualModel, expectedModel);
  });
}
