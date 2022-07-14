class UserModel {
  bool? status;
  String? message;
  List<String>? errors;
  User? data;

  UserModel({this.status, this.message, this.errors, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'];
    data = json['data'] != null ? User.fromJson(json['data']) : null;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? memberExpired;
  String? memberType;
  String? token;
  String? totp;
  String? password;

  User({
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

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    memberExpired = json['member_expired'];
    memberType = json['member_type'];
    token = json['token'];
    totp = json['totp'];
    password = json['password'];
  }
}
