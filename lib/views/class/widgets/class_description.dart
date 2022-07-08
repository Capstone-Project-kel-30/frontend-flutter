import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class ClassDescription extends StatelessWidget {
  const ClassDescription({Key? key, required this.description})
      : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About this class',
          style: AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
                fontWeight: kSemiBoldWeight,
              ),
        ),
        const VerticalSpace(height: 10),
        Text(
          description,
          style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                color: kDarkColor,
              ),
        ),
      ],
    );
  }
}
