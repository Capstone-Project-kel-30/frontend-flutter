import 'package:flutter_test/flutter_test.dart';
import 'package:workout_zone/models/class_model.dart';
import 'package:workout_zone/models/schedule_info_model.dart';

void main() {
  const response = {
    "status": true,
    "message": "User Booke Succsessfully",
    "errors": null,
    "data": {
      "user_id": 2,
      "class": [
        {
          "ID": 2,
          "Classname": "test 1",
          "Trainer": "koko",
          "Date": "09-09-3900",
          "Clock": "19:11",
          "Description": "test",
          "ClassType": "offline",
          "Capacity": 0,
          "UserBooked": 0,
          "Status": ""
        },
        {
          "ID": 1,
          "Classname": "test 2",
          "Trainer": "koko",
          "Date": "09-09-3900",
          "Clock": "19:11",
          "Description": "test",
          "ClassType": "online",
          "Capacity": 0,
          "UserBooked": 0,
          "Status": ""
        },
      ]
    }
  };
  const expected = ScheduleInfoModel(
    status: true,
    message: "User Booke Succsessfully",
    data: ScheduleData(
      userId: 2,
      classes: [
        Class(
          id: 2,
          classname: "test 1",
          trainer: "koko",
          date: "09-09-3900",
          clock: "19:11",
          description: "test",
          clastype: "offline",
          capacity: 0,
          userBooked: 0,
          status: "",
        ),
        Class(
          id: 1,
          classname: "test 2",
          trainer: "koko",
          date: "09-09-3900",
          clock: "19:11",
          description: "test",
          clastype: "online",
          capacity: 0,
          userBooked: 0,
          status: "",
        ),
      ],
    ),
  );
  test('should return correct schedule info model', () {
    final actual = ScheduleInfoModel.fromJson(response);
    expect(actual, expected);
  });
}
