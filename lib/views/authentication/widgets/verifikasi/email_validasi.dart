import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class EmailValidasi extends StatelessWidget {
  const EmailValidasi({
    Key? key,
    required this.user,
  }) : super(key: key);

  final String user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Please enter the code we sent to',
        ),
        const VerticalSpace(height: 10),
        Text(
          user,
          style: const TextStyle(fontWeight: kSemiBoldWeight),
        ),
        const VerticalSpace(height: 15),
      ],
    );
  }
}
