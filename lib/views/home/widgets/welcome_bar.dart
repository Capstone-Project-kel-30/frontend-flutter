import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';

import '../../../models/class_model.dart';
import '../../../models/user_model.dart';
import '../../../utils/themes/app_theme.dart';
import '../../widgets/horizontal_space.dart';
import '../../widgets/member_card.dart';
import '../../widgets/vertical_space.dart';
import '../../widgets/shimmer_placeholder.dart';

class WelcomeBar extends StatelessWidget {
  const WelcomeBar({
    Key? key,
    required this.isLoading,
    this.classes = const [],
    this.user,
  }) : super(key: key);

  final bool isLoading;
  final List<Class> classes;
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Visibility(
              visible: isLoading ? true : user!.data!.memberType! != '',
              child: isLoading
                  ? const ShimmerPlaceholder(height: 30, width: 50)
                  : MemberCard(
                      height: 30,
                      width: 50,
                      type: user!.data!.memberType!.toUpperCase(),
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
                        user!.data!.name!,
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
                    onPressed: () {
                      context.router.push(
                        SearchBarRoute(
                          classes: classes,
                          user: user!,
                        ),
                      );
                    },
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
                    onPressed: () {
                      context.router.push(const NotificationRoute());
                    },
                  ),
          ],
        ),
      ],
    );
  }
}
