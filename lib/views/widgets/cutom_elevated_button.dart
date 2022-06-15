import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.radius = 5,
    this.fontSize = 14,
    this.fontWeight = kSemiBoldWeight,
    this.height = 45,
  }) : super(key: key);

  final Function()? onPressed;
  final String text;
  final double? width, height;
  final double radius, fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
