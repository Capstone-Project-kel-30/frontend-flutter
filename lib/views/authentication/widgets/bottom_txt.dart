import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';

class Bottomtxt extends StatelessWidget {
  const Bottomtxt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have Account?",
          style: AppTheme.theme(context).textTheme.labelMedium?.copyWith(
                fontWeight: kRegularWeight,
              ),
        ),
        const HorizontalSpace(width: 5),
        GestureDetector(
          onTap: () {
            context.router.push(
              const SignUpRoute(),
            );
          },
          child: Text(
            "Sign In",
            style: AppTheme.theme(context).textTheme.labelMedium?.copyWith(
                  fontWeight: kRegularWeight,
                  color: kPrimaryColor,
                ),
          ),
        )
      ],
    );
  }
}
