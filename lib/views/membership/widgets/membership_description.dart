import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/vertical_space.dart';

class MembershipDescription extends StatelessWidget {
  const MembershipDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Description',
          style: TextStyle(
            fontSize: 14,
            fontWeight: kSemiBoldWeight,
          ),
        ),
        VerticalSpace(height: 10),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel ipsum penatibus congue ipsum nisl. In massa elit amet sed morbi. Leo, cras adipiscing cursus netus eu pharetra. Aliquam, est, ultrices odio posuere elit.',
          style: TextStyle(
            fontSize: 12,
            fontWeight: kRegularWeight,
          ),
        ),
      ],
    );
  }
}
