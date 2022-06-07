import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/membership/widgets/time_info.dart';
import 'package:workout_zone/views/membership/widgets/user_info_row.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'User Information',
          style: AppTheme.theme(context).textTheme.bodyMedium?.copyWith(
                fontWeight: kSemiBoldWeight,
              ),
        ),
        const VerticalSpace(height: 10),
        const UserInfoRow(info: 'Name', data: 'Lorem Ipsum Dorem'),
        const VerticalSpace(height: 10),
        const UserInfoRow(info: 'Phone', data: '081123211231'),
        const VerticalSpace(height: 10),
        const UserInfoRow(info: 'Email', data: 'loremipsum@lorem.com'),
        const VerticalSpace(height: 50),
        const Center(child: TimeInfo(timeLeft: '23 : 59 : 00')),
      ],
    );
  }
}
