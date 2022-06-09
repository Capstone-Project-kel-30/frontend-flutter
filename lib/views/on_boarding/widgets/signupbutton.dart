import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: kPrimaryColor),
        ),
        onPressed: () {},
        child: Text(
          title,
          style: const TextStyle(color: kLightColor),
        ),
      ),
    );
  }
}
