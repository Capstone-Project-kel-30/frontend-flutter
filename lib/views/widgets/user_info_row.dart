import 'package:flutter/material.dart';
import 'package:workout_zone/views/widgets/shimmer_placeholder.dart';

import '../../../utils/themes/app_theme.dart';

class UserInfoRow extends StatelessWidget {
  const UserInfoRow({
    Key? key,
    required this.info,
    required this.data,
    required this.isLoading,
  }) : super(key: key);

  final String info, data;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isLoading
            ? const ShimmerPlaceholder(height: 15, width: 37)
            : Text(
                info,
                style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                      color: kDarkColor,
                      fontWeight: kRegularWeight,
                    ),
              ),
        isLoading
            ? const ShimmerPlaceholder(height: 15, width: 130)
            : Text(
                data,
                style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                      color: kDarkColor,
                      fontWeight: kMediumWeight,
                    ),
              ),
      ],
    );
  }
}
