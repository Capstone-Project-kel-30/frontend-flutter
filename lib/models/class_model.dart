class ClassModel {
  bool? status;
  String? message;
  List<String>? errors;
  List<Class>? data;

  ClassModel({this.status, this.message, this.errors, this.data});

  ClassModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'];
    if (json['data'] != null) {
      if (json['data'].length >= 1) {
        data = <Class>[];
        json['data'].forEach((v) {
          data!.add(Class.fromJson(v));
        });
      } else {
        data = [Class.fromJson(json['data'])];
      }
    }
  }
}

class Class {
  int? id;
  String? classname;
  String? status;
  int? capacity;
  String? trainer;
  String? date;
  String? clock;
  String? clastype;
  int? duration;
  int? userBooked;
  String? description;
  String? image;

  Class(
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

  Class.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? json['ID'];
    classname = json['classname'] ?? json['Classname'];
    status = json['status'] ?? json['Status'];
    capacity = json['capacity'] ?? json['Capacity'];
    trainer = json['trainer'] ?? json['Trainer'];
    date = json['date'] ?? json['Date'];
    clock = json['clock'] ?? json['Clock'];
    clastype = json['clastype'] ?? json['ClassType'];
    duration = json['duration'];
    userBooked = json['user_booked'] ?? json['UserBooked'];
    description = json['description'] ?? json['Description'];
    image = json['image'];
  }
}
