import 'package:flutter/material.dart';

class LogoImg extends StatelessWidget {
  const LogoImg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/Logo.png',
      height: 25,
      width: 100,
    );
  }
}
