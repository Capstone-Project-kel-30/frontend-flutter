import 'package:flutter/material.dart';

import '../../../utils/themes/app_theme.dart';

class Badge extends StatelessWidget {
  const Badge({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: kGreyColor,
        ),
      ),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: child,
        ),
      ),
    );
  }
}
