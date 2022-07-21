import 'package:flutter/material.dart';
import 'package:workout_zone/models/membership_payment_model.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';
import 'package:workout_zone/views/widgets/member_card.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

import '../../../utils/common/constant.dart';

class MembershipApprovedCard extends StatelessWidget {
  const MembershipApprovedCard({
    Key? key,
    required this.membershipPayment,
  }) : super(key: key);

  final MembershipPayment membershipPayment;

  String setBenefit(type) {
    if (type == goldMember) {
      return '4 months';
    } else if (type == silverMember) {
      return '2 months';
    } else {
      return '1 month';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 72,
        child: Card(
          child: Row(
            children: [
              const HorizontalSpace(width: 20),
              MemberCard(
                height: 30,
                width: 40,
                radius: 5,
                type: membershipPayment.membership!.type!.toUpperCase(),
              ),
              const HorizontalSpace(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Membership is Approved!',
                    style:
                        AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                              color: kDarkColor,
                              fontWeight: kSemiBoldWeight,
                            ),
                  ),
                  const VerticalSpace(height: 5),
                  Text(
                    "Enjoy access to class bookings for ${setBenefit(membershipPayment.membership!.type!.toUpperCase())} :)",
                    style: AppTheme.theme(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
