import 'package:equatable/equatable.dart';

import 'membership_model.dart';
import 'user_model.dart';

class PaymentInfoModel extends Equatable {
  final bool? status;
  final String? message;
  final List<String>? errors;
  final PaymentData? data;

  const PaymentInfoModel({this.status, this.message, this.errors, this.data});

  factory PaymentInfoModel.fromJson(Map<String, dynamic> json) {
    return PaymentInfoModel(
      status: json['status'],
      message: json['message'],
      errors: json['errors'],
      data: json['data'] != null ? PaymentData.fromJson(json['data']) : null,
    );
  }

  @override
  List<Object?> get props => [status, message, errors, data];
}

class PaymentData extends Equatable {
  final int? id;
  final User? user;
  final Member? membership;
  final int? amount;

  const PaymentData({this.id, this.user, this.membership, this.amount});

  factory PaymentData.fromJson(Map<String, dynamic> json) {
    return PaymentData(
      id: json['id'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      membership: json['membership'] != null
          ? Member.fromJson(json['membership'])
          : null,
      amount: json['amount'],
    );
  }

  @override
  List<Object?> get props => [id, user, membership, amount];
}
