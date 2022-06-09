import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/vertical_space.dart';
import 'user_info_row.dart';

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
      ],
    );
  }
}
