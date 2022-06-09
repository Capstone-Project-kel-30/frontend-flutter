import 'package:flutter/material.dart';

class LatarImg extends StatelessWidget {
  const LatarImg({
    Key? key,
    required this.asset,
  }) : super(key: key);
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
}
