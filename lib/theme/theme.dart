import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constants.dart';

// Our light/Primary Theme
ThemeData themeData() {
  const iconThemeData = IconThemeData(color: kPrimaryIconDarkColor);
  return ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0),
    primaryColor: kPrimaryColor,

    // accentColor: kAccentLightColor,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      secondary: kSecondaryLightColor,
      brightness: Brightness.dark,
    ),
    cardColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      fillColor: kAccentIconLightColor,
      // fillColor: kAccentLightColor,
    ),
    snackBarTheme: const SnackBarThemeData().copyWith(
      backgroundColor: Colors.white,
    ),
    iconTheme: iconThemeData,
    primaryIconTheme: iconThemeData,
    textTheme: GoogleFonts.latoTextTheme(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kSecondaryLightColor,
    ),
    shadowColor: kShadowColor,
   
  );
}

// Dark Them
ThemeData darkThemeData() {
  const backgroundColor = Color(0xFF0D0C0E);
  // final iconTheme = ThemeData.dark().iconTheme.merge(IconThemeData(color: kAccentIconLightColor))
  const iconTheme = IconThemeData(color: kPrimaryIconLightColor);
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: appBarTheme,
    backgroundColor: backgroundColor,
    cardColor: kSurfaceDarkColor,
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      fillColor: kSurfaceDarkColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kSecondaryDarkColor,
    ),
    iconTheme: iconTheme,
    primaryIconTheme: iconTheme,
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyText1: const TextStyle(color: kBodyTextColorDark),
      bodyText2: TextStyle(color: Colors.grey[400]),
      headline4: TextStyle(color: Colors.grey[600], fontSize: 32),
      headline1: const TextStyle(color: kTitleTextDarkColor, fontSize: 80),
      subtitle1: const TextStyle(color: kBodyTextColorDark),
      headline6: TextStyle(color: Colors.grey[300]),
      subtitle2: const TextStyle(color: kTitleTextDarkColor),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      secondary: kAccentDarkColor,
      surface: kSurfaceDarkColor,
      brightness: Brightness.light,
    ),
  );
}

AppBarTheme appBarTheme = const AppBarTheme(color: Colors.transparent, elevation: 0);
