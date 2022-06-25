import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';

class DateButton extends StatelessWidget {
  const DateButton({
    Key? key,
    required this.isActive,
    required this.day,
    required this.date,
    required this.onTap,
  }) : super(key: key);

  final bool isActive;
  final String day, date;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        height: 55,
        width: 30,
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: isActive ? kPrimaryColor : kLightColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                    color: isActive ? kLightColor : kDarkColor,
                  ),
            ),
            Text(
              date,
              style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                    color: isActive ? kLightColor : kDarkColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
