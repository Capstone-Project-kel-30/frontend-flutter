import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';

class MembershipInfo extends StatelessWidget {
  const MembershipInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Gold Membership',
              style: TextStyle(
                fontSize: 16,
                fontWeight: kSemiBoldWeight,
                color: kDarkColor,
              ),
            ),
            Text(
              'Rp 990.000',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 18,
                fontWeight: kSemiBoldWeight,
              ),
            ),
          ],
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: kPrimaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: const Text(
            'Free access class 4 months',
            style: TextStyle(
              fontSize: 10,
              fontWeight: kMediumWeight,
              color: kGreyColor,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
