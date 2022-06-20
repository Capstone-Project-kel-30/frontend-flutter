import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    Key? key,
    required this.startTime,
  }) : super(key: key);

  final String startTime;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: kPrimaryColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 2.5,
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/Clock.svg'),
            const HorizontalSpace(width: 3),
            Text(
              startTime,
              style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                    fontSize: 10,
                    color: kGreyColor,
                    fontWeight: kMediumWeight,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
