import 'package:flutter/material.dart';

// Color
const Color kBackgroundColor = Color.fromRGBO(244, 244, 244, 1);
const Color kPrimaryColor = Color.fromRGBO(79, 189, 186, 1);
const Color kSecondaryColor = Color.fromRGBO(26, 46, 57, 1);
const Color kDarkColor = Color.fromRGBO(14, 14, 14, 1);
const Color kLightColor = Color.fromRGBO(254, 254, 252, 1);
const Color kDisabledColor = Color.fromRGBO(175, 175, 175, 1);
const Color kErrorColor = Color.fromRGBO(141, 41, 51, 1);
const Color kPressedColor = Color.fromRGBO(40, 95, 93, 1);

// FontWeight
const FontWeight kRegularWeight = FontWeight.w400;
const FontWeight kMediumWeight = FontWeight.w500;
const FontWeight kSemiBoldWeight = FontWeight.w600;
const FontWeight kBoldWeight = FontWeight.w700;

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
        primary: kPrimaryColor,
        onPrimary: kLightColor,
        secondary: kSecondaryColor,
        onSecondary: kLightColor,
        error: kErrorColor,
        background: kBackgroundColor,
        onBackground: kDarkColor,
      ),
    );
  }

  static ThemeData theme(BuildContext context) {
    return Theme.of(context);
  }
}
