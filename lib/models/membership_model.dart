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
}

class Member {
  int? id;
  String? type;
  int? price;
  int? duration;
  String? description;
  String? img;

  Member({
    this.id,
    this.type,
    this.price,
    this.duration,
    this.description,
    this.img,
  });

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    price = json['price'];
    duration = json['duration'];
    description = json['description'];
    img = json['img'];
  }
}
