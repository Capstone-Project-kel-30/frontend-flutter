import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../utils/routes/routes.gr.dart';
import '../../../utils/themes/app_theme.dart';

class JoinMembershipInfo extends StatelessWidget {
  const JoinMembershipInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: kBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: 'Reach Your Body Goals \n',
                style: AppTheme.theme(context).textTheme.bodySmall?.copyWith(
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Join Membership',
                style: AppTheme.theme(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0,
                      color: const Color.fromRGBO(244, 244, 244, 1),
                    ),
              ),
              onPressed: () {
                context.router.push(MembershipRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
