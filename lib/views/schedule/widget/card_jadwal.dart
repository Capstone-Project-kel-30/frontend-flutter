import 'package:flutter/material.dart';
import 'package:workout_zone/models/user_model.dart';
import 'package:workout_zone/views/schedule/widget/card_class.dart';

class JadwalCard extends StatelessWidget {
  const JadwalCard({
    Key? key,
    required this.index,
    required this.user,
  }) : super(key: key);
  final int index;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: 545,
        child: ListView.builder(
          itemCount: index == 2 ? 2 : 5,
          itemBuilder: (BuildContext context, int idx) {
            if (index == 0) {
              return CardClass(
                classType: 'Offline',
                user: user,
              );
            } else if (index == 1) {
              return CardClass(
                classType: 'Offline',
                user: user,
              );
            } else if (index == 2) {
              return CardClass(
                classType: 'Online',
                user: user,
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
