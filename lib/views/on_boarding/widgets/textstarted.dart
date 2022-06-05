import 'package:flutter/material.dart';

class TextStarted extends StatelessWidget {
  const TextStarted({
    Key? key,
    required this.tit,
    required this.subtit,
  }) : super(key: key);
  final String tit, subtit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
              text: tit,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: subtit,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
