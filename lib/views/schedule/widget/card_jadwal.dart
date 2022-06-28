import 'package:flutter/material.dart';
import 'package:workout_zone/views/schedule/widget/card_class.dart';

class JadwalCard extends StatelessWidget {
  const JadwalCard({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

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
              return const CardClass(classType: 'Offline');
            } else if (index == 1) {
              return const CardClass(classType: 'Offline');
            } else if (index == 2) {
              return const CardClass(classType: 'Online');
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
