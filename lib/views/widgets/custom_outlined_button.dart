import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.radius = 5,
    this.fontSize = 14,
    this.fontWeight = kSemiBoldWeight,
    this.height = 45,
    this.color = kPrimaryColor,
  }) : super(key: key);

  final Function()? onPressed;
  final String text;
  final double radius, fontSize;
  final double? width, height;
  final FontWeight fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          side: const BorderSide(color: kPrimaryColor),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
