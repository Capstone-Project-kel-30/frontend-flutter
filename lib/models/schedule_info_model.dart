import 'class_model.dart';

class ScheduleInfoModel {
  bool? status;
  String? message;
  List<String>? errors;
  ScheduleData? data;

  ScheduleInfoModel({this.status, this.message, this.errors, this.data});

  ScheduleInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'];
    data = json['data'] != null ? ScheduleData.fromJson(json['data']) : null;
  }
}

class ScheduleData {
  int? userId;
  List<Class>? classes;

  ScheduleData({this.userId, this.classes});

  ScheduleData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    if (json['class'] != null) {
      classes = <Class>[];
      json['class'].forEach((v) {
        classes!.add(Class.fromJson(v));
      });
    }
  }
}
