import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
          // untuk edit warna, dll bisa di sini.
          // ada banyak propertinya
          ),
      // Styling untuk input decoration
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(200),
        ),
      ),
    );
  }

  static ThemeData theme(BuildContext context) {
    return Theme.of(context);
  }
}
