import 'package:flutter/material.dart';
import 'package:currency_rates/common/theme/theme.dart';

extension ThemeExtension on BuildContext {
  AppTextTheme get textTheme => AppTheme.of(this).textTheme;

  AppThemeColorScheme get colors => AppTheme.of(this).colors;

  ThemeData get themeData => AppTheme.of(this).themeData;
}
