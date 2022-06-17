import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/horizontal_space.dart';
import '../../widgets/member_card.dart';
import '../../widgets/vertical_space.dart';

class WelcomeBar extends StatelessWidget {
  const WelcomeBar({
    Key? key,
    required this.username,
    required this.member,
  }) : super(key: key);

  final String username;
  final String member;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Visibility(
              visible: member != '',
              child: MemberCard(
                height: 30,
                width: 50,
                type: member,
                radius: 5,
              ),
            ),
            const HorizontalSpace(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome,',
                  style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                        color: kGreyColor,
                      ),
                ),
                const VerticalSpace(height: 4),
                Text(
                  username,
                  style:
                      AppTheme.theme(context).textTheme.titleMedium?.copyWith(
                            fontWeight: kSemiBoldWeight,
                          ),
                )
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: SvgPicture.asset('assets/icons/Search-Outline.svg'),
              padding: EdgeInsets.zero,
              splashRadius: 20,
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset('assets/icons/Bell-Outline.svg'),
              padding: EdgeInsets.zero,
              splashRadius: 20,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
