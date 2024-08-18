import 'package:flutter/material.dart';
import 'package:nota/utils/constants/colors.dart';

class AppBarConfigTheme {
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: black,
    ),
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: black,
    elevation: 0, // no shadow
    centerTitle: true,
    iconTheme: IconThemeData(
      color: white,
    ),
  );
}
