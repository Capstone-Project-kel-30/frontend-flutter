import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/authentication/forget_password_page.dart';

class ForgetPassBttn extends StatelessWidget {
  const ForgetPassBttn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            context.router.push(
              const ForgetPassword(),
            );
          },
          child: Text(
            'Forget Password?',
            style: AppTheme.theme(context).textTheme.labelMedium?.copyWith(
                  fontWeight: kRegularWeight,
                  color: kPrimaryColor,
                ),
          ),
        ),
      ],
    );
  }
}
