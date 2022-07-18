import 'package:doemais/theme/app-color.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: AppColor.bodyColor,
  scaffoldBackgroundColor: AppColor.bodyColor,
  hintColor: AppColor.textColor,
  primaryColorLight: AppColor.primary,
  primaryColor: AppColor.primary,
  textTheme: const TextTheme(
      headline1: TextStyle(
          color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: AppColor.primary)),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0))),
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w200,
      letterSpacing: 1.1,
      decorationColor: Colors.red,
    ),
  ),
);
