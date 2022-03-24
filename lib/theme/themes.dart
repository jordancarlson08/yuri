import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

//Base Theme
ThemeData themeFromScheme(ColorScheme colorScheme) {
  return ThemeData(
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      colorScheme: colorScheme,
      cardColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.background,
      //Shared with all themes
      fontFamily: GoogleFonts.getFont('Manrope').fontFamily,
      cardTheme: const CardTheme().copyWith(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        elevation: 0,
        color: colorScheme.surface,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      )),
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontWeight: FontWeight.w800,
        ),
        titleMedium: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
      ));
}

// Color Schemes
const ColorScheme heyFamColorSchemeLight = ColorScheme.light(
    brightness: Brightness.light,
    primary: HeyFamColors.blueAlt,
    surface: HeyFamColors.gray10,
    onPrimary: Colors.white,
    background: Colors.white);

const ColorScheme heyFamColorSchemeDark = ColorScheme.dark(
    brightness: Brightness.dark,
    primary: HeyFamColors.blueBrand,
    surface: HeyFamColors.plumLight,
    onPrimary: Colors.black,
    background: HeyFamColors.plumBrand);

const ColorScheme altFamColorSchemeLight = ColorScheme.light(
    brightness: Brightness.light,
    primary: HeyFamColors.kiwiAlt,
    surface: HeyFamColors.gray10,
    onPrimary: Colors.white,
    background: Colors.white);

const ColorScheme altFamColorSchemeDark = ColorScheme.dark(
    brightness: Brightness.dark,
    primary: HeyFamColors.kiwiBrand,
    surface: HeyFamColors.greenLighter,
    onPrimary: Colors.black,
    background: HeyFamColors.greenDark);

enum AppTheme {
  heyFamLight,
  heyFamDark,
  altFamLight,
  altFamDark,
}

final appThemeData = {
  AppTheme.heyFamLight: heyFamLight,
  AppTheme.heyFamDark: heyFamDark,
  AppTheme.altFamLight: altFamLight,
  AppTheme.altFamDark: altFamDark,
};

final ThemeData heyFamLight = themeFromScheme(heyFamColorSchemeLight);
final ThemeData heyFamDark = themeFromScheme(heyFamColorSchemeDark);
final ThemeData altFamLight = themeFromScheme(altFamColorSchemeLight);
final ThemeData altFamDark = themeFromScheme(altFamColorSchemeDark);
