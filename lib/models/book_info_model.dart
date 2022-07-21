import 'package:equatable/equatable.dart';

import 'class_model.dart';

class BookInfoModel extends Equatable {
  final bool? status;
  final String? message;
  final List<String>? errors;
  final BookData? data;

  const BookInfoModel({this.status, this.message, this.errors, this.data});

  factory BookInfoModel.fromJson(Map<String, dynamic> json) {
    return BookInfoModel(
      status: json['status'],
      message: json['message'],
      errors: json['errors'],
      data: json['data'] != null ? BookData.fromJson(json['data']) : null,
    );
  }

  @override
  List<Object?> get props => [status, message, errors, data];
}

class BookData extends Equatable {
  final int? userId;
  final Class? classes;

  const BookData({this.userId, this.classes});

  factory BookData.fromJson(Map<String, dynamic> json) {
    return BookData(
      userId: json['user_id'],
      classes: json['class'] != null ? Class.fromJson(json['class']) : null,
    );
  }

  @override
  List<Object?> get props => [userId, classes];
}
