import 'package:flutter/material.dart';

ThemeData buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  final ThemeData base2 = ThemeData.dark();
  bool isLight = false;
  if (isLight) {
    return base.copyWith(
      colorScheme: _shrineColorScheme,
      accentColor: shrinePink900,
      primaryColor: shrinePink100,
      buttonColor: shrinePink100,
      scaffoldBackgroundColor: shrineBackgroundWhite,
      cardColor: shrineBackgroundWhite,
      textSelectionColor: shrinePink100,
      errorColor: shrineErrorRed,
      buttonTheme: const ButtonThemeData(
        colorScheme: _shrineColorScheme,
        textTheme: ButtonTextTheme.normal,
      ),
      primaryIconTheme: _customIconTheme(base.iconTheme),
      textTheme: _buildShrineTextTheme(base.textTheme),
      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
      iconTheme: _customIconTheme(base.iconTheme),
    );
  } else {
    return base2.copyWith(
      colorScheme: _shrineColorScheme,
      accentColor: shrinePink900,
      primaryColor: shrinePink100,
      buttonColor: shrinePink100,
      scaffoldBackgroundColor: shrineBackgroundWhite,
      cardColor: shrineBackgroundWhite,
      textSelectionColor: shrinePink100,
      errorColor: shrineErrorRed,
      buttonTheme: const ButtonThemeData(
        colorScheme: _shrineColorScheme,
        textTheme: ButtonTextTheme.normal,
      ),
      primaryIconTheme: _customIconTheme(base.iconTheme),
      textTheme: _buildShrineTextTheme(base.textTheme),
      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
      iconTheme: _customIconTheme(base.iconTheme),
    );
  }
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: shrinePink900);
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: shrinePink900,
        bodyColor: shrinePink900,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  primaryVariant: shrinePink900,
  secondary: shrinePink50,
  secondaryVariant: shrinePink900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrinePink900,
  onSecondary: shrinePink900,
  onSurface: shrinePink900,
  onBackground: shrinePink900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFCE4EC);
const Color shrinePink100 = Color(0xFFF8BBD0);
const Color shrinePink200 = Color(0xFFF48FB1);
const Color shrinePink300 = Color(0xFFF06292);
const Color shrinePink400 = Color(0xFFEC407A);
const Color shrinePinkPink = Color(0xFFE91E63);
const Color shrinePink600 = Color(0xFFD81B60);
const Color shrinePink900 = Color(0xFF880E4F);

const Color shrineErrorRed = Color(0xFFC5032B);

//  FOR DARK MODE
const Color shrineSurfaceWhite = Color(0xFFFFFFFF);
const Color shrineBackgroundWhite = Color(0xFFFFFFFF);

const defaultLetterSpacing = 0.03;
