import 'package:flutter_test/flutter_test.dart';
import 'package:workout_zone/models/membership_model.dart';
import 'package:workout_zone/models/membership_payment_model.dart';
import 'package:workout_zone/models/user_model.dart';

void main() {
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
      "membership": {"id": 2, "type": "SILVER", "price": 550000, "duration": 5},
      "amount": 550000,
      "snap_url":
          "https://app.sandbox.midtrans.com/snap/v3/redirection/5caa3f7f-9d20-4526-97a6-ddfe8136bc87"
    }
  };
  const expectedModel = MembershipPaymentModel(
    status: true,
    message: "Payment Created",
    data: MembershipPayment(
      id: 14,
      user: User(
        id: 2,
        name: "test update lagi",
        email: "test@tested.com",
        phone: "081211903299",
        memberExpired: "2022-12-21",
        memberType: "SILVER",
      ),
      membership: Member(
        id: 2,
        type: "SILVER",
        price: 550000,
        duration: 5,
      ),
      amount: 550000,
      snapUrl:
          "https://app.sandbox.midtrans.com/snap/v3/redirection/5caa3f7f-9d20-4526-97a6-ddfe8136bc87",
    ),
  );
  test('should return correct membership payment model', () {
    final actualModel = MembershipPaymentModel.fromJson(response);
    expect(actualModel, expectedModel);
  });
}
