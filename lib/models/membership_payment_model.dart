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
  Membership? membership;
  int? amount;
  String? snapUrl;

  MembershipPayment(
      {this.id, this.user, this.membership, this.amount, this.snapUrl});

  MembershipPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    membership = json['membership'] != null
        ? Membership.fromJson(json['membership'])
        : null;
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

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? memberExpired;
  String? memberType;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.memberExpired,
      this.memberType});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    memberExpired = json['member_expired'];
    memberType = json['member_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['member_expired'] = memberExpired;
    data['member_type'] = memberType;
    return data;
  }
}

class Membership {
  int? id;
  String? type;
  int? price;
  int? duration;

  Membership({this.id, this.type, this.price, this.duration});

  Membership.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    price = json['price'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['price'] = price;
    data['duration'] = duration;
    return data;
  }
}
