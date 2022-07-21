import 'package:flutter_test/flutter_test.dart';
import 'package:workout_zone/models/book_info_model.dart';
import 'package:workout_zone/models/class_model.dart';

void main() {
  const response = {
    "status": true,
    "message": "User Booke Succsessfully",
    "errors": null,
    "data": {
      "user_id": 2,
      "class": {
        "ID": 2,
        "Classname": "Zumba online Tes 233",
        "Trainer": "koko",
        "Date": "09-09-3900",
        "Clock": "19:11",
        "Description": "ini deskripsi zumba online",
        "ClassType": "offline",
        "Capacity": 0,
        "UserBooked": 0,
        "Status": ""
      }
    }
  };
  const expectedModel = BookInfoModel(
    status: true,
    message: "User Booke Succsessfully",
    data: BookData(
      userId: 2,
      classes: Class(
        id: 2,
        classname: "Zumba online Tes 233",
        trainer: "koko",
        date: "09-09-3900",
        clock: "19:11",
        description: "ini deskripsi zumba online",
        clastype: "offline",
        capacity: 0,
        userBooked: 0,
        status: "",
      ),
    ),
  );
  test('should return correct model', () {
    final actualModel = BookInfoModel.fromJson(response);
    expect(actualModel, expectedModel);
  });
}
