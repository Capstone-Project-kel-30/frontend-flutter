import 'package:equatable/equatable.dart';

class NewsletterModel extends Equatable {
  final bool? status;
  final String? message;
  final List<String>? errors;
  final List<Newsletter>? data;

  const NewsletterModel({this.status, this.message, this.errors, this.data});

  factory NewsletterModel.fromJson(Map<String, dynamic> json) {
    List<Newsletter>? data;
    if (json['data'] != null) {
      if (json['data'] is Map) {
        data?.add(Newsletter.fromJson(json['data']));
      } else {
        data = <Newsletter>[];
        json['data'].forEach((v) {
          data!.add(Newsletter.fromJson(v));
        });
      }
    }
    return NewsletterModel(
      status: json['status'],
      message: json['message'],
      errors: json['errors'],
      data: data,
    );
  }

  @override
  List<Object?> get props => [status, message, errors, data];
}

class Newsletter extends Equatable {
  final int? id;
  final String? title;
  final String? date;
  final String? content;
  final String? image;

  const Newsletter({this.id, this.title, this.date, this.content, this.image});

  factory Newsletter.fromJson(Map<String, dynamic> json) {
    return Newsletter(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      content: json['content'],
      image: json['image'],
    );
  }

  @override
  List<Object?> get props => [id, title, date, content, image];
}
