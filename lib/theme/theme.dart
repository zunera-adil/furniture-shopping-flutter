import 'dart:math';

import 'package:flutter/material.dart';
import 'package:furniture_shopping_flutter/utills/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utills/text_styles.dart';

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);

ThemeData appTheme = ThemeData(
  appBarTheme:
      AppBarTheme(color: kPrimaryWhiteColor, elevation: 0, centerTitle: true),
  primaryColor: kPrimaryBlackColor,
  indicatorColor: kSecondaryGrey01Color,
  primaryColorLight: kPrimaryWhiteColor,
  primaryColorDark: kPrimaryBlackColor,
  hintColor: kSecondaryGreyColor,
  cardColor: kSecondaryCardGreyColor,
  brightness: Brightness.light,
  scaffoldBackgroundColor: kPrimaryWhiteColor,
  iconTheme: IconThemeData(color: kPrimaryBlackColor),
  textTheme: GoogleFonts.merriweatherSansTextTheme().copyWith(
      displayLarge: kHeading1,
      displayMedium: kHeading2,
      displaySmall: kHeading3,
      headlineMedium: kHeading4,
      headlineSmall: kHeading5,
      bodyLarge: kBodyText1,
      bodyMedium: kBodyText2,
      bodySmall: kTextInputFieldStyle,
      titleMedium: kLabelTextStyle,
      labelLarge: kPrimaryButton1Style),
  colorScheme: ColorScheme.fromSwatch(
          primarySwatch: generateMaterialColor(kPrimaryBlackColor))
      .copyWith(error: kSystemRedColor),
);
