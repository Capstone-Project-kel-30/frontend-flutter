import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/themes/app_theme.dart';
import 'horizontal_space.dart';

class LocationInfo extends StatelessWidget {
  const LocationInfo({
    Key? key,
    required this.classType,
    required this.location,
  }) : super(key: key);

  final String classType;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        classType == 'offline'
            ? Image.asset('assets/icons/Location.png')
            : SvgPicture.asset('assets/icons/Stream.svg'),
        const HorizontalSpace(width: 3),
        Text(
          location,
          style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                fontSize: 10,
                color: kGreyColor,
              ),
        ),
      ],
    );
  }
}
