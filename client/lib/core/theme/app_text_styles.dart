import 'package:client/core/theme/app_pallette.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle bigTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Pallete.textColor,
  );

  static TextStyle link = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
    color: Pallete.linkColor,
  );

  static const TextStyle footer = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );
}
