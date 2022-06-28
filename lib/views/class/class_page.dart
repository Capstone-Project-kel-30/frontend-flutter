import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../utils/common/constant.dart';
import '../../utils/common/helper.dart';
import '../widgets/vertical_space.dart';
import 'widgets/class_list.dart';
import 'widgets/date_picker.dart';
import 'widgets/search_bar.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({
    Key? key,
    required this.classType,
    required this.user,
  }) : super(key: key);

  final String classType;
  final UserModel user;

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  int index = 0;

  List<Map<String, dynamic>> ganjil = [
    {
      "classType": offlineClass,
      "location": "Gym Studio - Bandung",
      "isFull": false,
      "title": "Lorem Ipsum",
      "trainer": "trainer",
      "startTime": "16:00",
    },
    {
      "classType": onlineClass,
      "location": "Streaming - Zoom",
      "isFull": true,
      "title": "Lorem Dorem",
      "trainer": "trainer",
      "startTime": "07:00",
    },
    {
      "classType": offlineClass,
      "location": "Gym Studio - Bandung",
      "isFull": true,
      "title": "Lorem Ipsum Dorem",
      "trainer": "trainer",
      "startTime": "20:00",
    },
  ];

  List<Map<String, dynamic>> genap = [
    {
      "classType": onlineClass,
      "location": "Streaming - GMeet",
      "isFull": false,
      "title": "Do esse esse ad eiusmod ad nostrud id",
      "trainer": "trainer",
      "startTime": "05:00",
    },
    {
      "classType": offlineClass,
      "location": "Gym Studio - Bandung",
      "isFull": false,
      "title": "Amet mollit sint sint aute eiusmod proident esse duis et.",
      "trainer": "trainer",
      "startTime": "08:00",
    },
    {
      "classType": offlineClass,
      "location": "Gym Studio - Bandung",
      "isFull": true,
      "title": "Lorem Ipsum Dorem",
      "trainer": "trainer",
      "startTime": "20:00",
    },
    {
      "classType": offlineClass,
      "location": "Gym Studio - Bandung",
      "isFull": false,
      "title": "Lorem Sint Sint",
      "trainer": "trainer",
      "startTime": "23:00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${capitalize(widget.classType)} Class')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SearchBar(),
            const VerticalSpace(height: 10),
            DatePicker(
              onPressed: (int idx) {
                index = idx;
                setState(() {});
              },
            ),
            const VerticalSpace(height: 10),
            Expanded(
              child: ClassList(
                user: widget.user,
                classList: index % 2 == 0
                    ? genap
                        .where((element) =>
                            element["classType"] == widget.classType)
                        .toList()
                    : ganjil
                        .where((element) =>
                            element["classType"] == widget.classType)
                        .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
