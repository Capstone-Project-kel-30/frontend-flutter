import 'package:flutter_test/flutter_test.dart';
import 'package:workout_zone/models/user_model.dart';

void main() {
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
  const expectedModel = UserModel(
    status: true,
    message: "User found",
    data: User(
      id: 2,
      name: "test update lagi",
      email: "test@tested.com",
      phone: "081211903299",
      memberExpired: "2022-12-21",
      memberType: "SILVER",
    ),
  );
  test('should return correct user model', () {
    final actualModel = UserModel.fromJson(response);
    expect(actualModel, expectedModel);
  });
}
