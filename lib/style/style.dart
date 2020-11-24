import 'package:flutter/material.dart';
import 'package:productivity/controller/central_state.dart';

///Color schema
const Color blue = Color(0xff258FFB);
const Color pink = Color(0xffE94367);
const Color yellow = Color(0xffF7BD34);
const Color orange = Color(0xffED7051);
const Color purple = Color(0xff9453FD);
const Color green = Color(0xff3DC26A);

const Color backgroundLight = Color(0xff2B292C);
const Color backgroundColorMedium = Color(0xff1C1A1D);
const Color backgroundDark = Color(0xff1D1A1D);

final Color iconColor = Colors.white.withOpacity(0.8);
const Color selectedIconColor = Colors.white;
final Color unselectedColor = Colors.white.withOpacity(0.4);
const Color highlightColor = blue;
const Color cardColor = Color(0xff363336);
const Color hintColor = Color(0xff5B585B);

/// common textstyles
final TextStyle cardFontStyle = TextStyle(
  fontSize: headingFontSize,
  color: iconColor,
);
final TextStyle headingFontStyle = TextStyle(
    fontSize: headingFontSize, color: iconColor,
    fontWeight: FontWeight.w600);

final TextStyle hintStyle = TextStyle(
    color: hintColor, fontSize: headingFontSize);
/// all the numbers
const double iconSize = 35;
const double headingFontSize = 18.0;
const double borderRadius = 14;
final double margin = centralState.getHeight(1);
final double marginLarge = centralState.getHeight(1)*1.5;
final double marginExtraLarge = centralState.getHeight(1)*2;
const double labelFontSize = 11;
