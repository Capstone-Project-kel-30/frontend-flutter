import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../utils/routes/routes.gr.dart';
import 'custom_outlined_button.dart';
import 'cutom_elevated_button.dart';

class MembershipPaymentButton extends StatelessWidget {
  const MembershipPaymentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomOutlinedButton(
          text: 'Back to Home',
          onPressed: () {
            context.router
                .removeUntil((route) => route.name == HomeWrapper.name);
          },
        ),
        CustomElevatedButton(
          text: 'Continue to Payment',
          onPressed: () {},
        ),
      ],
    );
  }
}
