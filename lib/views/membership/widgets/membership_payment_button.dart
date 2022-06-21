import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../utils/routes/routes.gr.dart';
import '../../../utils/themes/app_theme.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/cutom_elevated_button.dart';

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
          fontSize: 14,
          fontWeight: kSemiBoldWeight,
          color: kGreyColor,
          radius: 5,
        ),
        CustomElevatedButton(
          text: 'Continue to Payment',
          width: double.infinity,
          radius: 5,
          fontWeight: kSemiBoldWeight,
          fontSize: 14,
          onPressed: () {},
        ),
      ],
    );
  }
}
