import 'package:doemais/theme/app-color.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: AppColor.bodyColor,
  scaffoldBackgroundColor: AppColor.bodyColor,
  hintColor: AppColor.textColor,
  primaryColorLight: AppColor.buttonBackgroundColor,
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 40,
      fontWeight: FontWeight.bold
    )
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    buttonColor: Colors.black
  )
);