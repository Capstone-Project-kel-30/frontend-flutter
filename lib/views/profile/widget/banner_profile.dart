import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/member_card.dart';

class BannerProfile extends StatelessWidget {
  const BannerProfile({
    Key? key,
    required this.member,
  }) : super(key: key);

  final String member;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kSecondaryColor,
          ),
          height: 50,
          width: 199,
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
                Text(
                  "$member Membership",
                  style: AppTheme.theme(context).textTheme.bodyMedium!.copyWith(
                        color: kPrimaryColor,
                        fontWeight: kSemiBoldWeight,
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
