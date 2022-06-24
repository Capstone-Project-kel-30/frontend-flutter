import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/horizontal_space.dart';

class TimeStart extends StatelessWidget {
  const TimeStart({Key? key, required this.time}) : super(key: key);

  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/Clock.svg'),
        const HorizontalSpace(width: 6),
        Text(
          time,
          style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                fontSize: 10,
                color: kDarkColor,
              ),
        ),
      ],
    );
  }
}
