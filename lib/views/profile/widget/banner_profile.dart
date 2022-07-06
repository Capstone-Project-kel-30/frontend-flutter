import 'package:flutter/material.dart';
import 'package:workout_zone/utils/common/helper.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';
import 'package:workout_zone/views/widgets/member_card.dart';

class BannerProfile extends StatelessWidget {
  const BannerProfile({
    Key? key,
    required this.member,
  }) : super(key: key);

  final String member;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kSecondaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MemberCard(
                height: 30,
                width: 40,
                type: member,
              ),
              const HorizontalSpace(width: 10),
              Text(
                " ${capitalize(member)} Membership",
                style: AppTheme.theme(context).textTheme.bodyMedium!.copyWith(
                      color: kLightColor,
                      fontWeight: kSemiBoldWeight,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
