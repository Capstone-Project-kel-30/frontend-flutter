import 'package:flutter/material.dart';

import '../../../utils/common/helper.dart';
import '../../../utils/themes/app_theme.dart';
import '../../widgets/horizontal_space.dart';
import '../../widgets/vertical_space.dart';
import '../../widgets/member_card.dart';

class MemberTypeInfo extends StatelessWidget {
  const MemberTypeInfo({
    Key? key,
    required this.type,
    required this.price,
  }) : super(key: key);

  final String type, price;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kBackgroundColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MemberCard(height: 60, width: 90, type: type),
            const HorizontalSpace(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$type Membership',
                  style: AppTheme.theme(context).textTheme.bodyMedium?.copyWith(
                        color: HSLColor.fromColor(kGreyColor)
                            .withLightness(0.4)
                            .toColor(),
                        fontWeight: kSemiBoldWeight,
                      ),
                ),
                const VerticalSpace(height: 5),
                Text(
                  'Rp ${tambahTitik(price)}',
                  style: AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
                        color: kPrimaryColor,
                        fontWeight: kSemiBoldWeight,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
