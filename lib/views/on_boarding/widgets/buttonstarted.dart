import 'package:flutter/material.dart';

class ButtonStarted extends StatelessWidget {
  const ButtonStarted({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Color(0xFF4FBDBA),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        onPressed: press,
      ),
    );
  }
}
