import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class TimeInfo extends StatelessWidget {
  const TimeInfo({Key? key, required this.timeLeft}) : super(key: key);

  final String timeLeft;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Pay Until',
          style: AppTheme.theme(context).textTheme.bodyText2?.copyWith(
                fontWeight: kSemiBoldWeight,
              ),
        ),
        const VerticalSpace(height: 5),
        Text(
          timeLeft,
          style: AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
                color: kPrimaryColor,
                fontSize: 20,
                fontWeight: kSemiBoldWeight,
              ),
        ),
      ],
    );
  }
}
