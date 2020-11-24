import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productivity/style/style.dart';

ThemeData themeData = ThemeData(
    fontFamily: 'Montserrat',
    scaffoldBackgroundColor: backgroundLight,
    backgroundColor: backgroundLight,
    brightness: Brightness.dark,
    accentColor: backgroundDark,
    cupertinoOverrideTheme: CupertinoThemeData(brightness: Brightness.dark),
    colorScheme: ColorScheme.dark());
