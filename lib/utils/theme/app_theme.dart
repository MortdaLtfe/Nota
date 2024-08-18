import 'package:flutter/material.dart';
import 'package:nota/utils/constants/colors.dart';
import 'package:nota/utils/theme/configs/app_bar_theme.dart';
import 'package:nota/utils/theme/configs/elevated_button_theme.dart';
import 'package:nota/utils/theme/configs/text_theme.dart';

/// A class that provides themes for the app.
///
/// This class provides methods to generate light and dark themes for the app.
///
class AppTheme {
  /// Returns a light theme for the app.
  ///
  /// This function generates a ThemeData object with default settings.
  ///
  /// Returns:
  ///   ThemeData: A light theme for the app.
  static ThemeData lightTheme = ThemeData(
      textTheme: TextConfigTheme.lightTextTheme,
      elevatedButtonTheme: ElevatedButtonConfigTheme.theme,
      scaffoldBackgroundColor: white,
      appBarTheme: AppBarConfigTheme.lightAppBarTheme,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xff5F5AC9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
        ),
      ));

  /// Returns a dark theme for the app.
  ///
  /// This function generates a ThemeData object with default settings.
  ///
  /// Returns:
  ///   ThemeData: A dark theme for the app.
  static ThemeData darkTheme = ThemeData(
      textTheme: TextConfigTheme.darkTextTheme,
      elevatedButtonTheme: ElevatedButtonConfigTheme.theme,
      scaffoldBackgroundColor: black,
      appBarTheme: AppBarConfigTheme.darkAppBarTheme,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xff5F5AC9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
        ),
      ));
}
