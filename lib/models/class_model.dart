import 'package:equatable/equatable.dart';

class ClassModel extends Equatable {
  final bool? status;
  final String? message;
  final List<String>? errors;
  final List<Class>? data;

  const ClassModel({this.status, this.message, this.errors, this.data});

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    List<Class>? data;
    if (json['data'] != null) {
      if (json['data'].length >= 1) {
        data = <Class>[];
        json['data'].forEach((v) {
          data?.add(Class.fromJson(v));
        });
      } else {
        data = [Class.fromJson(json['data'])];
      }
    }
    return ClassModel(
      status: json['status'],
      message: json['message'],
      errors: json['errors'],
      data: data,
    );
  }

  @override
  List<Object?> get props => [status, message, errors, data];
}

class Class extends Equatable {
  final int? id;
  final String? classname;
  final String? status;
  final int? capacity;
  final String? trainer;
  final String? date;
  final String? clock;
  final String? clastype;
  final int? duration;
  final int? userBooked;
  final String? description;
  final String? image;

  const Class(
      {this.id,
      this.classname,
      this.status,
      this.capacity,
      this.trainer,
      this.date,
      this.clock,
      this.clastype,
      this.duration,
      this.userBooked,
      this.description,
      this.image});

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      id: json['id'] ?? json['ID'],
      classname: json['classname'] ?? json['Classname'],
      status: json['status'] ?? json['Status'],
      capacity: json['capacity'] ?? json['Capacity'],
      trainer: json['trainer'] ?? json['Trainer'],
      date: json['date'] ?? json['Date'],
      clock: json['clock'] ?? json['Clock'],
      clastype: json['clastype'] ?? json['ClassType'],
      duration: json['duration'] ?? json['Duration'],
      userBooked: json['user_booked'] ?? json['UserBooked'],
      description: json['description'] ?? json['Description'],
      image: json['image'] ?? json['Image'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        classname,
        status,
        capacity,
        trainer,
        date,
        clock,
        clastype,
        duration,
        userBooked,
        description,
        image,
      ];
}
