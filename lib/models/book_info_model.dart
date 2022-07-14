import 'package:workout_zone/models/class_model.dart';

import 'user_model.dart';

class BookInfoModel {
  bool? status;
  String? message;
  List<String>? errors;
  BookData? data;

  BookInfoModel({this.status, this.message, this.errors, this.data});

  BookInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'];
    data = json['data'] != null ? BookData.fromJson(json['data']) : null;
  }
}

class BookData {
  int? id;
  User? user;
  Class? classes;

  BookData({this.id, this.user, this.classes});

  BookData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    classes = json['class'] != null ? Class.fromJson(json['class']) : null;
  }
}
