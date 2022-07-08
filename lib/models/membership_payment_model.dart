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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['errors'] = errors;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (membership != null) {
      data['membership'] = membership!.toJson();
    }
    data['amount'] = amount;
    data['snap_url'] = snapUrl;
    return data;
  }
}
