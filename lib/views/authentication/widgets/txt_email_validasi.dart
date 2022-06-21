import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class TxtEmailValidasi extends StatelessWidget {
  const TxtEmailValidasi({
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
          '${user.substring(0, 2)}${'*' * (user.substring(2, user.indexOf('@')).length)}${user.substring(user.indexOf('@'), user.length)}',
          style: AppTheme.theme(context).textTheme.bodyMedium!.copyWith(
                fontWeight: kSemiBoldWeight,
              ),
        ),
        const VerticalSpace(height: 15),
      ],
    );
  }
}
