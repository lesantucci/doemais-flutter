import 'package:doemais/theme/app-color.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: AppColor.bodyColor,
  hintColor: AppColor.textColor,
  primaryColorLight: AppColor.primary,
  primaryColor: AppColor.primary,
  appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
          color: AppColor.textColor,
          fontWeight: FontWeight.bold,
          fontSize: 18.0),
      elevation: 0),
  cardTheme: CardTheme(elevation: 0, color: AppColor.cardColor),
  textTheme: const TextTheme(
      headline1: TextStyle(
          color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: AppColor.primary)),
  inputDecorationTheme: const InputDecorationTheme(
    suffixIconColor: Color(0xff6200ee),
    fillColor: Colors.white,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Color(0xff6200ee))),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Color(0xff6200ee))),
    filled: true,
    labelStyle: TextStyle(
      color: Color(0xff6200ee),
      fontSize: 14,
      fontWeight: FontWeight.normal,
      letterSpacing: 1.1,
      decorationColor: Colors.red,
    ),
  ),
);
