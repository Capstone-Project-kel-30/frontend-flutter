import 'package:equatable/equatable.dart';

class MembershipModel extends Equatable {
  final bool? status;
  final String? message;
  final List<String>? errors;
  final List<Member>? data;

  const MembershipModel({this.status, this.message, this.errors, this.data});

  factory MembershipModel.fromJson(Map<String, dynamic> json) {
    List<Member>? data;
    if (json['data'] != null) {
      data = <Member>[];
      json['data'].forEach((v) {
        data!.add(Member.fromJson(v));
      });
    }
    return MembershipModel(
      status: json['status'],
      message: json['message'],
      errors: json['errors'],
      data: data,
    );
  }
  @override
  List<Object?> get props => [status, message, errors, data];
}

class Member extends Equatable {
  final int? id;
  final String? type;
  final int? price;
  final int? duration;
  final String? description;
  final String? image;

  const Member({
    this.image,
    this.id,
    this.type,
    this.price,
    this.duration,
    this.description,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      type: json['type'],
      price: json['price'],
      duration: json['duration'],
      description: json['description'],
      image: json['img'],
    );
  }

  @override
  List<Object?> get props => [id, type, price, duration, description, image];
}
