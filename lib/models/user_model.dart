class UserModel {
  bool? status;
  String? message;
  List<String>? errors;
  Data? data;

  UserModel({this.status, this.message, this.errors, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? memberExpired;
  String? memberType;
  String? token;
  String? totp;

  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.memberExpired,
    this.memberType,
    this.token,
    this.totp,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    memberExpired = json['member_expired'];
    memberType = json['member_type'];
    token = json['token'];
    totp = json['totp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['member_expired'] = memberExpired;
    data['member_type'] = memberType;
    data['token'] = token;
    data['totp'] = totp;
    return data;
  }
}
