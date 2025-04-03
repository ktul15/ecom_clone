import 'package:flutter/material.dart';

import 'app_pallette.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 1),
    borderRadius: BorderRadius.circular(4),
  );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: const AppBarTheme(backgroundColor: Pallete.backgroundColor),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(Pallete.borderColor),
      focusedBorder: _border(Pallete.gradient2),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Pallete.backgroundColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Pallete.greyColor, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );

  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: const AppBarTheme(backgroundColor: Pallete.backgroundColor),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      enabledBorder: _border(Pallete.greyColor),
      focusedBorder: _border(Pallete.greyColor),
      errorBorder: _border(Pallete.errorColor),
      focusedErrorBorder: _border(Pallete.errorColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Pallete.backgroundColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Pallete.textColor,
      selectionColor: Pallete.greyColor,
      selectionHandleColor: Pallete.greyColor,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Pallete.whiteColor,
    ),
  );
}
