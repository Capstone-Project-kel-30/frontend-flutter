import 'package:flutter_test/flutter_test.dart';
import 'package:workout_zone/models/membership_model.dart';
import 'package:workout_zone/models/payment_info_model.dart';
import 'package:workout_zone/models/user_model.dart';

void main() {
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
      "membership": {"id": 1, "type": "GOLD", "price": 990000, "duration": 12},
      "amount": 990000
    }
  };
  const expectedModel = PaymentInfoModel(
    status: true,
    message: "Payment found",
    data: PaymentData(
      id: 2,
      user: User(
        id: 2,
        name: "test update lagi",
        email: "test@tested.com",
        phone: "081211903299",
        memberExpired: "2023-07-14",
        memberType: "GOLD",
      ),
      membership: Member(
        id: 1,
        type: "GOLD",
        price: 990000,
        duration: 12,
      ),
      amount: 990000,
    ),
  );
  test('should return correct payment info model', () {
    final actualModel = PaymentInfoModel.fromJson(response);
    expect(actualModel, expectedModel);
  });
}
