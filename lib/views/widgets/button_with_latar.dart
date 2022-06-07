import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';

class ButtonWithLatar extends StatelessWidget {
  const ButtonWithLatar({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kLightColor,
          backgroundColor: kPrimaryColor,
        ),
        onPressed: press,
        child: Text(
          title,
          style: AppTheme.theme(context).textTheme.labelMedium?.copyWith(
                fontWeight: kRegularWeight,
                color: kLightColor,
              ),
        ),
      ),
    );
  }
}
