import 'package:flutter/material.dart';

abstract class AppThemeColorScheme extends ColorScheme {
  const AppThemeColorScheme({
    required super.brightness,
    required this.white,
    required this.black,
  }) : super(
          primary: Colors.black,
          secondary: Colors.black,
          surface: Colors.black,
          background: Colors.black,
          error: Colors.black,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.black,
        );

  static LightColorScheme light = const LightColorScheme();
  static DarkColorScheme dark = const DarkColorScheme();

  final Color white;
  final Color black;
}

class LightColorScheme extends AppThemeColorScheme {
  const LightColorScheme()
      : super(
          brightness: Brightness.light,
          white: Colors.white,
          black: Colors.black,
        );
}

class DarkColorScheme extends LightColorScheme {
  const DarkColorScheme();
}
