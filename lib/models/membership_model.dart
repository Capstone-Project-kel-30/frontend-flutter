class MembershipModel {
  bool? status;
  String? message;
  List<String>? errors;
  List<Member>? data;

  MembershipModel({this.status, this.message, this.errors, this.data});

  MembershipModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'];
    if (json['data'] != null) {
      data = <Member>[];
      json['data'].forEach((v) {
        data!.add(Member.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['errors'] = errors;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Member {
  int? id;
  String? type;
  int? price;
  int? duration;
  String? description;

  Member({this.id, this.type, this.price, this.duration, this.description});

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    price = json['price'];
    duration = json['duration'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['price'] = price;
    data['duration'] = duration;
    data['description'] = description;
    return data;
  }
}
