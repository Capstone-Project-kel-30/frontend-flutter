class MembershipModel {
  bool? status;
  String? message;
  List<String>? errors;
  List<Data>? data;

  MembershipModel({this.status, this.message, this.errors, this.data});

  MembershipModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  int? id;
  String? type;
  int? price;
  int? duration;

  Data({this.id, this.type, this.price, this.duration});

  Data.fromJson(Map<String, dynamic> json) {
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
