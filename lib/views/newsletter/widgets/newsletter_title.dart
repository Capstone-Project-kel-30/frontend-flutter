import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';

class NewsletterTitle extends StatelessWidget {
  const NewsletterTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTheme.theme(context).textTheme.bodyLarge?.copyWith(
            fontSize: 20,
            fontWeight: kSemiBoldWeight,
          ),
    );
  }
}
