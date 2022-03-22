import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class BaseYuriTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: YuriColors.tealAlt,
      scaffoldBackgroundColor: YuriColors.background,
      fontFamily: 'Manrope',
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: YuriColors.darkGreen,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)))),
    );
  }
}

enum AppTheme {
  greenLight,
  greenDark,
  blueLight,
  blueDark,
}

final ThemeData greenLight = ThemeData(
  fontFamily: GoogleFonts.getFont('Manrope').fontFamily,
  brightness: Brightness.light,
  primaryColor: Colors.green,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: YuriColors.darkGreen,
          onPrimary: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
);

final appThemeData = {
  AppTheme.greenLight: greenLight,
  AppTheme.greenDark: ThemeData(
    fontFamily: GoogleFonts.getFont('Hurricane').fontFamily,
    brightness: Brightness.dark,
    primaryColor: Colors.green[700],
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: YuriColors.lightPurple,
            onPrimary: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2)))),
  ),
  AppTheme.blueLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: YuriColors.deepPurple,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90)))),
  ),
  AppTheme.blueDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[700],
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: YuriColors.tealAlt,
            onPrimary: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32)))),
  ),
};
