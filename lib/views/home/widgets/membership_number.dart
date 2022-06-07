import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';

class MembershipNumber extends StatelessWidget {
  const MembershipNumber({
    Key? key,
    required this.membershipNumber,
  }) : super(key: key);

  final String membershipNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Membership Number',
          style: AppTheme.theme(context).textTheme.bodyMedium?.copyWith(
                fontWeight: kSemiBoldWeight,
              ),
        ),
        Text(
          membershipNumber,
          style: AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
                color: kPrimaryColor,
                fontWeight: kSemiBoldWeight,
              ),
        ),
      ],
    );
  }
}
