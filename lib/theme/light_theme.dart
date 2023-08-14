import 'package:flutter/material.dart';
import 'package:netnflix/cust_class.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'netnflix',
  primarySwatch: CustClass.customWhite,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.white,
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Colors.white,
    onPrimary: Colors.black,
  )
);