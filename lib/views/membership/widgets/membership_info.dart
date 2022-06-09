import 'package:flutter/material.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

import '../../../utils/themes/app_theme.dart';

class MembershipInfo extends StatelessWidget {
  const MembershipInfo({
    Key? key,
    required this.type,
    required this.price,
  }) : super(key: key);

  final String type, price;

  String setBenefit(type) {
    if (type == 'Gold') {
      return 'Free access class 4 months';
    } else if (type == 'Silver') {
      return 'Free access class 2 months';
    } else {
      return 'Free access class 1 months';
    }
  }

  @override
  Widget build(BuildContext context) {
    final String benefit = setBenefit(type);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$type Membership',
              style: AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: kSemiBoldWeight,
                  ),
            ),
            const VerticalSpace(height: 5),
            Text(
              'Rp $price',
              style: AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
                    color: kPrimaryColor,
                    fontSize: 18,
                    fontWeight: kSemiBoldWeight,
                  ),
            ),
          ],
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: const Border.fromBorderSide(BorderSide(
              color: kPrimaryColor,
            )),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              benefit,
              style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                    color: kGreyColor,
                    fontSize: 10,
                    fontWeight: kMediumWeight,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
