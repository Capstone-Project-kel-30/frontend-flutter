import 'package:flutter/material.dart';
import 'package:workout_zone/views/widgets/shimmer_placeholder.dart';

import '../../../utils/themes/app_theme.dart';
import 'vertical_space.dart';
import 'user_info_row.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.name,
    required this.phone,
    required this.email,
    required this.isLoading,
  }) : super(key: key);

  final String name, phone, email;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isLoading
            ? const ShimmerPlaceholder(height: 17, width: 125)
            : Text(
                'User Information',
                style: AppTheme.theme(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: kSemiBoldWeight,
                    ),
              ),
        const VerticalSpace(height: 10),
        UserInfoRow(
          info: 'Name',
          data: name,
          isLoading: isLoading,
        ),
        const VerticalSpace(height: 10),
        UserInfoRow(
          info: 'Phone',
          data: phone,
          isLoading: isLoading,
        ),
        const VerticalSpace(height: 10),
        UserInfoRow(
          info: 'Email',
          data: email,
          isLoading: isLoading,
        ),
      ],
    );
  }
}
