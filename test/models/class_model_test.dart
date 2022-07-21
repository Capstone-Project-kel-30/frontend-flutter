import 'package:flutter_test/flutter_test.dart';
import 'package:workout_zone/models/class_model.dart';

void main() {
  const response = {
    "status": true,
    "message": "All Class found",
    "errors": null,
    "data": [
      {
        "id": 3,
        "classname": "boxing baru 3",
        "status": "Available",
        "capacity": 10,
        "trainer": "ray",
        "date": "05-07-2022",
        "clock": "16:00",
        "clastype": "offline",
        "duration": 90,
        "user_booked": 9,
        "description": "deskripsi boxing",
        "image": "https://i.ibb.co/Ytc9415/47f13ef23feff41d059c824b13394a6c.png"
      },
      {
        "id": 5,
        "classname": "Zumba",
        "status": "Available",
        "capacity": 10,
        "trainer": "koko",
        "date": "09-09-3900",
        "clock": "19:11",
        "clastype": "online",
        "duration": 120,
        "user_booked": 1,
        "description": "ini deskripsi zumba online",
        "image": "https://i.ibb.co/hWbJ5dX/b9336ae423a74eb6d2a20915cd088150.png"
      },
    ]
  };
  const expectedModel = ClassModel(
    status: true,
    message: "All Class found",
    errors: null,
    data: [
      Class(
        id: 3,
        classname: "boxing baru 3",
        status: "Available",
        capacity: 10,
        trainer: "ray",
        date: "05-07-2022",
        clock: "16:00",
        clastype: "offline",
        duration: 90,
        userBooked: 9,
        description: "deskripsi boxing",
        image: "https://i.ibb.co/Ytc9415/47f13ef23feff41d059c824b13394a6c.png",
      ),
      Class(
        id: 5,
        classname: "Zumba",
        status: "Available",
        capacity: 10,
        trainer: "koko",
        date: "09-09-3900",
        clock: "19:11",
        clastype: "online",
        duration: 120,
        userBooked: 1,
        description: "ini deskripsi zumba online",
        image: "https://i.ibb.co/hWbJ5dX/b9336ae423a74eb6d2a20915cd088150.png",
      ),
    ],
  );
  test('should return correct class model', () {
    final actualModel = ClassModel.fromJson(response);
    expect(actualModel, expectedModel);
  });
}
