import 'membership_model.dart';
import 'user_model.dart';

class PaymentInfoModel {
  bool? status;
  String? message;
  List<String>? errors;
  PaymentData? data;

  PaymentInfoModel({this.status, this.message, this.errors, this.data});

  PaymentInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'];
    data = json['data'] != null ? PaymentData.fromJson(json['data']) : null;
  }
}

class PaymentData {
  int? id;
  User? user;
  Member? membership;
  int? amount;

  PaymentData({this.id, this.user, this.membership, this.amount});

  PaymentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    membership =
        json['membership'] != null ? Member.fromJson(json['membership']) : null;
    amount = json['amount'];
  }
}
