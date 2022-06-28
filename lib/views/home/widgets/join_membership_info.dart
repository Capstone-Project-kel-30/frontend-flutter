import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_zone/views/widgets/shimmer_placeholder.dart';

import '../../../utils/routes/routes.gr.dart';
import '../../../utils/themes/app_theme.dart';
import '../../widgets/cutom_elevated_button.dart';

class JoinMembershipInfo extends StatelessWidget {
  const JoinMembershipInfo({
    Key? key,
    required this.isLoading,
  }) : super(key: key);
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const ShimmerPlaceholder(height: 60, width: double.infinity)
        : Card(
            elevation: 3,
            shadowColor: kLightColor,
            color: kBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Reach Your Body Goals \n',
                      style:
                          AppTheme.theme(context).textTheme.bodySmall?.copyWith(
                                color: const Color.fromRGBO(94, 94, 94, 1),
                                fontWeight: kSemiBoldWeight,
                                letterSpacing: 0,
                              ),
                      children: const <TextSpan>[
                        TextSpan(text: 'at '),
                        TextSpan(
                          text: 'Workout Zone.',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: kBoldWeight,
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomElevatedButton(
                    text: 'Join Membership',
                    radius: 100,
                    fontSize: 10,
                    fontWeight: kSemiBoldWeight,
                    width: null,
                    height: 25,
                    onPressed: () {
                      context.router.push(const MembershipRoute());
                    },
                  ),
                ],
              ),
            ),
          );
  }
}
