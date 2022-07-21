import 'package:flutter_test/flutter_test.dart';
import 'package:workout_zone/models/membership_model.dart';

void main() {
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
        "img": "https://i.ibb.co/fthXqcJ/2ad16916a5db5804ce27e46756dc96a8.jpg"
      },
    ]
  };
  const expectedModel = MembershipModel(
    status: true,
    message: "All Membership types",
    data: [
      Member(
        id: 1,
        type: "GOLD",
        price: 990000,
        duration: 12,
        description: "ini description type ",
        image: "https://i.ibb.co/fthXqcJ/2ad16916a5db5804ce27e46756dc96a8.jpg",
      ),
    ],
  );
  test('should return correct membership model', () {
    final actualModel = MembershipModel.fromJson(response);
    expect(actualModel, expectedModel);
  });
}
