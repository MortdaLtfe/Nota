import 'package:flutter/material.dart';

class ElevatedButtonConfigTheme {
  static ElevatedButtonThemeData theme = ElevatedButtonThemeData(
    style: ButtonStyle(
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)))),
  );
}
