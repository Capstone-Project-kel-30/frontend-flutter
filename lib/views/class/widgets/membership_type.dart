import 'package:flutter/material.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';
import 'package:workout_zone/views/widgets/member_card.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

import '../../../utils/themes/app_theme.dart';

class MembershipType extends StatelessWidget {
  const MembershipType({Key? key, required this.memberType}) : super(key: key);

  final String memberType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Booking Type',
          style: AppTheme.theme(context).textTheme.bodyMedium?.copyWith(
                fontWeight: kSemiBoldWeight,
              ),
        ),
        const VerticalSpace(height: 5),
        Card(
          color: kBackgroundColor,
          margin: EdgeInsets.zero,
          shadowColor: kLightColor,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                MemberCard(height: 40, width: 60, type: memberType),
                const HorizontalSpace(width: 10),
                Text(
                  '$memberType Membership',
                  style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                        fontWeight: kSemiBoldWeight,
                        color: kDarkColor,
                      ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
