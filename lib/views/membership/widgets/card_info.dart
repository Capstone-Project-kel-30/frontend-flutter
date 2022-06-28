import 'package:flutter/material.dart';

import '../../../utils/common/helper.dart';
import '../../../utils/themes/app_theme.dart';
import '../../widgets/member_card.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    Key? key,
    required this.type,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  final String type, price;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: MemberCard(
            height: 150,
            width: 335,
            type: type,
          ),
        ),
        Positioned.fill(
          bottom: 15,
          left: 15,
          right: 15,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  type,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: kSemiBoldWeight,
                  ),
                ),
                Text(
                  'Rp ${tambahTitik(price)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: kSemiBoldWeight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
