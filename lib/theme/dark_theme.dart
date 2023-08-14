import 'package:flutter/material.dart';
import 'package:netnflix/cust_class.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'netnflix',
  primarySwatch: CustClass.customBlack,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: CustClass.customBlack,
  colorScheme: const ColorScheme.dark(
    background: CustClass.customBlack,
    primary: Colors.black,
    onPrimary: Colors.white,
  )
);