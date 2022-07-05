import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/routes.gr.dart';
import '../../utils/themes/app_theme.dart';
import '../widgets/vertical_space.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
    required this.isHome,
    this.message = "Unable to Fetch Data",
  }) : super(key: key);

  final bool isHome;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTheme.theme(context).textTheme.titleLarge?.copyWith(
                      fontWeight: kBoldWeight,
                    ),
              ),
              const VerticalSpace(height: 20),
              TextButton(
                child: Text(
                  isHome ? "Restart" : "Go Home",
                  style: AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
                        decoration: TextDecoration.underline,
                        color: kPrimaryColor,
                      ),
                ),
                onPressed: () {
                  context.router.replaceAll([
                    const HomeWrapper(),
                  ]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
