import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_zone/views/class/widgets/badge.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';

import '../../../utils/themes/app_theme.dart';

class ClassInfo extends StatelessWidget {
  const ClassInfo({
    Key? key,
    required this.date,
    required this.startTime,
    required this.trainer,
  }) : super(key: key);

  final String date, startTime, trainer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Badge(
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/Calendar.svg'),
              const HorizontalSpace(width: 6),
              Text(
                date,
                style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                      color: kPrimaryColor,
                    ),
              ),
            ],
          ),
        ),
        const HorizontalSpace(width: 10),
        Badge(
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/Clock.svg'),
              const HorizontalSpace(width: 6),
              Text(
                startTime,
                style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                      color: kPrimaryColor,
                    ),
              ),
            ],
          ),
        ),
        const HorizontalSpace(width: 10),
        Badge(
          child: Row(
            children: [
              Image.asset('assets/icons/Trainer.png'),
              const HorizontalSpace(width: 6),
              Text(
                trainer,
                style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                      color: kPrimaryColor,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
