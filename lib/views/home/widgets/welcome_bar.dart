import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/themes/app_theme.dart';
import '../../widgets/horizontal_space.dart';
import '../../widgets/member_card.dart';
import '../../widgets/vertical_space.dart';
import '../../widgets/shimmer_placeholder.dart';

class WelcomeBar extends StatelessWidget {
  const WelcomeBar({
    Key? key,
    required this.username,
    required this.member,
    required this.isLoading,
  }) : super(key: key);

  final String username;
  final String member;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Visibility(
              visible: isLoading ? true : member != '',
              child: isLoading
                  ? const ShimmerPlaceholder(height: 30, width: 50)
                  : MemberCard(
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
                isLoading
                    ? const ShimmerPlaceholder(height: 12, width: 50)
                    : Text(
                        'Welcome,',
                        style: AppTheme.theme(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                              color: kGreyColor,
                            ),
                      ),
                const VerticalSpace(height: 4),
                isLoading
                    ? const ShimmerPlaceholder(height: 16, width: 100)
                    : Text(
                        username,
                        style: AppTheme.theme(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              fontWeight: kSemiBoldWeight,
                            ),
                      )
              ],
            ),
          ],
        ),
        Row(
          children: [
            isLoading
                ? const ShimmerPlaceholder(height: 30, width: 30)
                : IconButton(
                    icon: SvgPicture.asset('assets/icons/Search-Outline.svg'),
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                    onPressed: () {},
                  ),
            isLoading
                ? Row(
                    children: const [
                      HorizontalSpace(width: 10),
                      ShimmerPlaceholder(height: 30, width: 30),
                    ],
                  )
                : IconButton(
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
