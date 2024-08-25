import 'package:flutter/material.dart';

class ElevatedButtonConfigTheme {
  static ElevatedButtonThemeData theme = ElevatedButtonThemeData(
    style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(const Color(0xff873AB6)),
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)))),
  );
}
