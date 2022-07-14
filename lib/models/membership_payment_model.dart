import 'membership_model.dart';
import 'user_model.dart';

class MembershipPaymentModel {
  bool? status;
  String? message;
  List<String>? errors;
  MembershipPayment? data;

  MembershipPaymentModel({this.status, this.message, this.errors, this.data});

  MembershipPaymentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'];
    data =
        json['data'] != null ? MembershipPayment.fromJson(json['data']) : null;
  }
}

class MembershipPayment {
  int? id;
  User? user;
  Member? membership;
  int? amount;
  String? snapUrl;

  MembershipPayment(
      {this.id, this.user, this.membership, this.amount, this.snapUrl});

  MembershipPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    membership =
        json['membership'] != null ? Member.fromJson(json['membership']) : null;
    amount = json['amount'];
    snapUrl = json['snap_url'];
  }
}
