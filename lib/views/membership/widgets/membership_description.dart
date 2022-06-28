import 'package:flutter/material.dart';

import '../../../utils/common/constant.dart';
import '../../../utils/themes/app_theme.dart';
import '../../widgets/vertical_space.dart';

class MembershipDescription extends StatelessWidget {
  const MembershipDescription({Key? key, required this.type}) : super(key: key);

  final String type;

  String getDescription(type) {
    if (type == goldMember) {
      return 'Gold membership is the best package offer for you. The advantages of this package are:\n\n1. The duration of membership is 3 months.\n2. Unlocked online and offline class features.\n3. Free access to online and offline class bookings for the duration of the active membership.';
    } else if (type == silverMember) {
      return 'Silver membership is the best package offer for you. The advantages of this package are:\n\n1. Membership duration is 2 months.\n2. Unlocked online and offline class features.\n3. Free access to online and offline class bookings for the duration of the active membership.';
    } else {
      return 'Bronze membership is the best package offer for you. The advantages of this package are:\n\n1. The duration of membership is 1 month.\n2. Unlocked online and offline class features.\n3. Free access to online and offline class bookings for the duration of the active membership.';
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
