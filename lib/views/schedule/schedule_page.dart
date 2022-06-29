import 'package:flutter/material.dart';
import 'package:workout_zone/models/user_model.dart';
import 'package:workout_zone/views/schedule/widget/card_jadwal.dart';
import 'package:workout_zone/views/schedule/widget/select_picker.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

// gnorie: must_be_immutable
class SchedulePage extends StatefulWidget {
  const SchedulePage({
    Key? key,
  }) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int ind = 0;
  UserModel user = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedule"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              SelectPicker(
                onprees: (int index) {
                  ind = index;
                },
              ),
              const VerticalSpace(height: 20),
              JadwalCard(
                index: ind,
                user: user,
              )
            ],
          ),
        ),
      ),
    );
  }
}
