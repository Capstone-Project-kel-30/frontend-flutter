import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/horizontal_space.dart';
import 'member_card.dart';

class MemberTypeInfo extends StatelessWidget {
  const MemberTypeInfo({
    Key? key,
    required this.type,
    required this.price,
  }) : super(key: key);

  final String type, price;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MemberCard(height: 60, width: 90, type: type),
        const HorizontalSpace(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$type Membership',
              style: AppTheme.theme(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: kSemiBoldWeight,
                  ),
            ),
            Text(
              'Rp $price',
              style: AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
                    color: kPrimaryColor,
                    fontWeight: kSemiBoldWeight,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
