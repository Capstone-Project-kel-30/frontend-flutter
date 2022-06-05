import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
        // untuk edit warna, dll bisa di sini.
        // ada banyak propertinya
        primary: const Color.fromRGBO(79, 189, 186, 1),
      ),
      // Styling untuk input decoration
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(200),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(3),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }

  static ThemeData theme(BuildContext context) {
    return Theme.of(context);
  }
}
