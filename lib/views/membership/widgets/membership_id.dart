import 'package:flutter/material.dart';
import 'package:workout_zone/models/membership_payment_model.dart';

import '../../../utils/themes/app_theme.dart';

class MembershipId extends StatelessWidget {
  const MembershipId({
    Key? key,
    required this.membershipPayment,
  }) : super(key: key);

  final MembershipPaymentModel membershipPayment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Membership ID',
          style: AppTheme.theme(context).textTheme.bodyMedium?.copyWith(
                fontWeight: kSemiBoldWeight,
              ),
        ),
        Text(
          'GYM30-${membershipPayment.data!.membership!.type!}-${membershipPayment.data!.id!}',
          style: AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
                color: kPrimaryColor,
                fontWeight: kSemiBoldWeight,
              ),
        ),
      ],
    );
  }
}
