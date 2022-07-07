import 'package:flutter/material.dart';
import 'package:workout_zone/utils/common/constant.dart';

import '../../widgets/select_button.dart';

class ClassTypePicker extends StatefulWidget {
  const ClassTypePicker({
    Key? key,
    required this.classType,
    required this.onPressed,
  }) : super(key: key);

  final String classType;
  final Function(String) onPressed;

  @override
  State<ClassTypePicker> createState() => _ClassTypePickerState();
}

class _ClassTypePickerState extends State<ClassTypePicker> {
  String classTypePicked = offlineClass;

  List<String> select = [
    offlineClass,
    onlineClass,
  ];
  List<String> logoSelect = [
    "assets/icons/ph_barbell.svg",
    "assets/icons/Online prediction.svg",
  ];

  @override
  void initState() {
    super.initState();
    classTypePicked = widget.classType.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              right: 2,
            ),
            child: Row(
              children: [
                SelectButton(
                  title: select[index],
                  ontap: () {
                    setState(
                      () {
                        classTypePicked = select[index];
                      },
                    );
                    widget.onPressed(select[index]);
                  },
                  isActive: classTypePicked == select[index],
                  logo: logoSelect[index],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
