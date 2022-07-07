import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';

class NewsletterDate extends StatelessWidget {
  const NewsletterDate({Key? key, required this.date}) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: AppTheme.theme(context).textTheme.bodySmall,
    );
  }
}
