class NewsletterModel {
  bool? status;
  String? message;
  List<String>? errors;
  List<Newsletter>? data;

  NewsletterModel({this.status, this.message, this.errors, this.data});

  NewsletterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'];
    if (json['data'] != null) {
      if (json['data'].length >= 1) {
        data = <Newsletter>[];
        json['data'].forEach((v) {
          data!.add(Newsletter.fromJson(v));
        });
      } else {
        data = [Newsletter.fromJson(json['data'])];
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

class Newsletter {
  int? id;
  String? title;
  String? date;
  String? content;
  String? image;

  Newsletter({this.id, this.title, this.date, this.content, this.image});

  Newsletter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
    content = json['content'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['date'] = date;
    data['content'] = content;
    data['image'] = image;
    return data;
  }
}
