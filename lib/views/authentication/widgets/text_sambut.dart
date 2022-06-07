import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';

class TextSambut extends StatelessWidget {
  const TextSambut({
    Key? key,
    required this.sambut1,
    required this.smabut2,
  }) : super(key: key);
  final String sambut1, smabut2;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: sambut1,
            style: AppTheme.theme(context).textTheme.headlineMedium?.copyWith(
                height: 1.2, fontWeight: kBoldWeight, color: kDarkColor),
          ),
          TextSpan(
            text: smabut2,
            style: AppTheme.theme(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
