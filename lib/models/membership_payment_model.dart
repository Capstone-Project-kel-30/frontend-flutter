import 'package:equatable/equatable.dart';

import 'membership_model.dart';
import 'user_model.dart';

class MembershipPaymentModel extends Equatable {
  final bool? status;
  final String? message;
  final List<String>? errors;
  final MembershipPayment? data;

  const MembershipPaymentModel({
    this.status,
    this.message,
    this.errors,
    this.data,
  });

  factory MembershipPaymentModel.fromJson(Map<String, dynamic> json) {
    return MembershipPaymentModel(
      status: json['status'],
      message: json['message'],
      errors: json['errors'],
      data: json['data'] != null
          ? MembershipPayment.fromJson(json['data'])
          : null,
    );
  }

  @override
  List<Object?> get props => [status, message, errors, data];
}

class MembershipPayment extends Equatable {
  final int? id;
  final User? user;
  final Member? membership;
  final int? amount;
  final String? snapUrl;

  const MembershipPayment({
    this.id,
    this.user,
    this.membership,
    this.amount,
    this.snapUrl,
  });

  factory MembershipPayment.fromJson(Map<String, dynamic> json) {
    return MembershipPayment(
      id: json['id'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      membership: json['membership'] != null
          ? Member.fromJson(json['membership'])
          : null,
      amount: json['amount'],
      snapUrl: json['snap_url'],
    );
  }

  @override
  List<Object?> get props => [id, user, membership, amount, snapUrl];
}
