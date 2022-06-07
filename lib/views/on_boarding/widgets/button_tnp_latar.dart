import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';

class ButtonTnpLatar extends StatelessWidget {
  const ButtonTnpLatar({
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
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: kPrimaryColor),
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
