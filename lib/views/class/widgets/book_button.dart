import 'package:flutter/material.dart';
import 'package:workout_zone/views/widgets/cutom_elevated_button.dart';

class BookButton extends StatelessWidget {
  const BookButton({
    Key? key,
    required this.isFull,
    required this.onPressed,
  }) : super(key: key);

  final bool isFull;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return isFull
        ? const CustomElevatedButton(
            padding: EdgeInsets.zero,
            text: 'Full Booked',
            onPressed: null,
            height: 25,
            width: 85,
            radius: 100,
            fontSize: 12,
          )
        : CustomElevatedButton(
            padding: EdgeInsets.zero,
            text: 'Book',
            onPressed: onPressed,
            height: 25,
            width: 50,
            radius: 100,
            fontSize: 12,
          );
  }
}
