import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/vertical_space.dart';

class MembershipDescription extends StatelessWidget {
  const MembershipDescription({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
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
