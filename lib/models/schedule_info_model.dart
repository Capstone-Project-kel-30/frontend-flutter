import 'package:equatable/equatable.dart';

import 'class_model.dart';

class ScheduleInfoModel extends Equatable {
  final bool? status;
  final String? message;
  final List<String>? errors;
  final ScheduleData? data;

  const ScheduleInfoModel({this.status, this.message, this.errors, this.data});

  factory ScheduleInfoModel.fromJson(Map<String, dynamic> json) {
    return ScheduleInfoModel(
      status: json['status'],
      message: json['message'],
      errors: json['errors'],
      data: json['data'] != null ? ScheduleData.fromJson(json['data']) : null,
    );
  }

  @override
  List<Object?> get props => [status, message, errors, data];
}

class ScheduleData extends Equatable {
  final int? userId;
  final List<Class>? classes;

  const ScheduleData({this.userId, this.classes});

  factory ScheduleData.fromJson(Map<String, dynamic> json) {
    List<Class>? classes;
    if (json['class'] != null) {
      classes = <Class>[];
      json['class'].forEach((v) {
        classes!.add(Class.fromJson(v));
      });
    }
    return ScheduleData(
      userId: json['user_id'],
      classes: classes,
    );
  }

  @override
  List<Object?> get props => [userId, classes];
}
