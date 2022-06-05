import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';

class ImageContainerTitle extends StatelessWidget {
  const ImageContainerTitle({
    Key? key,
    required this.moreThan5,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final bool moreThan5;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTheme.theme(context).textTheme.titleSmall?.copyWith(
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600,
              ),
        ),
        if (moreThan5)
          GestureDetector(
            onTap: onTap,
            child: Text(
              'See all',
              style: AppTheme.theme(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.theme(context).colorScheme.primary,
                  ),
            ),
          ),
      ],
    );
  }
}
