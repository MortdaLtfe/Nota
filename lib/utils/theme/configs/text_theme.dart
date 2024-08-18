import 'package:flutter/material.dart';
import 'package:nota/utils/constants/colors.dart';

class TextConfigTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
        fontFamily: 'Sofia',
        fontSize: 50.0,
        fontWeight: FontWeight.w500,
        color: black),
    headlineMedium: TextStyle(
        fontFamily: 'Sofia',
        fontSize: 30.0,
        fontWeight: FontWeight.w500,
        color: black),
    headlineSmall: TextStyle(
        fontFamily: 'Sofia',
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: black),
    bodyLarge: TextStyle(
        fontFamily: 'Sofia',
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        color: black),
    bodyMedium: TextStyle(
        fontFamily: 'Sofia',
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: black),
    bodySmall: TextStyle(
        fontFamily: 'Sofia',
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: black),
    labelSmall: TextStyle(
        fontFamily: 'Sofia',
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: black),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
        fontFamily: 'Sofia',
        fontSize: 50.0,
        fontWeight: FontWeight.w500,
        color: white),
    headlineMedium: TextStyle(
        fontFamily: 'Sofia',
        fontSize: 30.0,
        fontWeight: FontWeight.w500,
        color: white),
    headlineSmall: TextStyle(
        fontFamily: 'Sofia',
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: white),
    bodyLarge: TextStyle(
        fontFamily: 'Sofia',
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        color: white),
    bodyMedium: TextStyle(
        fontFamily: 'Sofia',
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: white),
    bodySmall: const TextStyle(
        fontFamily: 'Sofia',
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: Colors.white60),
    labelSmall: const TextStyle(
        fontFamily: 'Sofia',
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: Colors.white60),
    labelMedium: const TextStyle(
        fontFamily: 'Sofia',
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: Colors.white60),
  );
}
