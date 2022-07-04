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
      this.description});

  Class.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classname = json['classname'];
    status = json['status'];
    capacity = json['capacity'];
    trainer = json['trainer'];
    date = json['date'];
    clock = json['clock'];
    clastype = json['clastype'];
    duration = json['duration'];
    userBooked = json['user_booked'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['classname'] = classname;
    data['status'] = status;
    data['capacity'] = capacity;
    data['trainer'] = trainer;
    data['date'] = date;
    data['clock'] = clock;
    data['clastype'] = clastype;
    data['duration'] = duration;
    data['user_booked'] = userBooked;
    data['description'] = description;
    return data;
  }
}
