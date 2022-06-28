import 'package:flutter/material.dart';

import '../../../utils/common/helper.dart';
import '../../../utils/themes/app_theme.dart';
import '../../widgets/location_info.dart';
import '../../widgets/vertical_space.dart';
import 'badge.dart';

class ClassTitle extends StatelessWidget {
  const ClassTitle({
    Key? key,
    required this.classType,
    required this.classTitle,
    required this.location,
  }) : super(key: key);

  final String classType, classTitle, location;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              classTitle,
              style: AppTheme.theme(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: kSemiBoldWeight,
                  ),
            ),
            const VerticalSpace(height: 5),
            LocationInfo(classType: classType, location: location),
          ],
        ),
        Badge(
            child: Text(
          '${capitalize(classType)} Class',
          style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                color: kPrimaryColor,
              ),
        )),
      ],
    );
  }
}
