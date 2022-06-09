import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/vertical_space.dart';

class MembershipDescription extends StatelessWidget {
  const MembershipDescription({Key? key, required this.type}) : super(key: key);

  final String type;

  String getDescription(type) {
    if (type == 'Gold') {
      return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel ipsum penatibus congue ipsum nisl. In massa elit amet sed morbi. Leo, cras adipiscing cursus netus eu pharetra. Aliquam, est, ultrices odio posuere elit.';
    } else if (type == 'Silver') {
      return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel ipsum penatibus congue ipsum nisl. In massa elit amet sed morbi. Leo, cras adipiscing cursus netus eu pharetra. Aliquam, est, ultrices odio posuere elit.';
    } else {
      return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel ipsum penatibus congue ipsum nisl. In massa elit amet sed morbi. Leo, cras adipiscing cursus netus eu pharetra. Aliquam, est, ultrices odio posuere elit.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final String description = getDescription(type);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: AppTheme.theme(context).textTheme.bodyMedium?.copyWith(
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
