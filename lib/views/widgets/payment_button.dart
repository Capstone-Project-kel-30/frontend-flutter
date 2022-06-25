import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/routes.gr.dart';
import '../../utils/themes/app_theme.dart';
import 'custom_outlined_button.dart';
import 'cutom_elevated_button.dart';
import 'vertical_space.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    Key? key,
    required this.onPressed,
    required this.elevatedButtonText,
  }) : super(key: key);

  final Function() onPressed;
  final String elevatedButtonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomOutlinedButton(
          text: 'Back to Home',
          onPressed: () {
            context.router.replaceAll([const HomeWrapper()]);
          },
          color: kGreyColor,
        ),
        const VerticalSpace(height: 10),
        CustomElevatedButton(
          text: elevatedButtonText,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
