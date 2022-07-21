import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final bool? status;
  final String? message;
  final List<String>? errors;
  final User? data;

  const UserModel({this.status, this.message, this.errors, this.data});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      status: json['status'],
      message: json['message'],
      errors: json['errors'],
      data: json['data'] != null ? User.fromJson(json['data']) : null,
    );
  }

  @override
  List<Object?> get props => [status, message, errors, data];
}

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? memberExpired;
  final String? memberType;
  final String? token;
  final String? totp;
  final String? password;

  const User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.memberExpired,
    this.memberType,
    this.token,
    this.totp,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      memberExpired: json['member_expired'],
      memberType: json['member_type'],
      token: json['token'],
      totp: json['totp'],
      password: json['password'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        memberExpired,
        memberType,
        token,
        totp,
        password,
      ];
}
