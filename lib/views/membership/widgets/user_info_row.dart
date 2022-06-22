import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';

class UserInfoRow extends StatelessWidget {
  const UserInfoRow({
    Key? key,
    required this.info,
    required this.data,
  }) : super(key: key);

  final String info, data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          info,
          style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                color: kDarkColor,
                fontWeight: kRegularWeight,
              ),
        ),
        Text(
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
