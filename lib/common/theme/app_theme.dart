import 'package:flutter/material.dart';
import 'package:currency_rates/common/theme/app_text_theme.dart';
import 'package:currency_rates/common/theme/app_theme_color_scheme.dart';

class AppTheme {
  AppTheme({
    required this.colors,
    required this.textTheme,
    required this.themeData,
  });

  static AppTheme darkTheme = AppTheme.initializeTheme(
    colorScheme: AppThemeColorScheme.dark,
    baseThemeData: ThemeData.dark(),
  );

  static AppTheme lightTheme = AppTheme.initializeTheme(
    colorScheme: AppThemeColorScheme.light,
    baseThemeData: ThemeData.light(),
  );

  static Iterable<AppTheme> themes = [lightTheme, darkTheme];

  final AppThemeColorScheme colors;
  final AppTextTheme textTheme;
  final ThemeData themeData;

  bool get isDark => this == darkTheme;

  static AppTheme of(BuildContext context) {
    final brightness = MediaQueryData.fromView(
      View.of(context),
    ).platformBrightness;
    return brightness == Brightness.dark ? AppTheme.darkTheme : AppTheme.lightTheme;
  }

  static ThemeData _createBaseThemeData(
    AppThemeColorScheme colorScheme,
    AppTextTheme textTheme,
    ThemeData baseThemeData,
  ) =>
      baseThemeData.copyWith(
        scaffoldBackgroundColor: colorScheme.white,
      );

  factory AppTheme.initializeTheme({
    required AppThemeColorScheme colorScheme,
    required ThemeData baseThemeData,
  }) {
    final textTheme = AppTextTheme.byColorScheme(colorScheme);

    return AppTheme(
      colors: colorScheme,
      themeData: _createBaseThemeData(
        colorScheme,
        textTheme,
        baseThemeData,
      ),
      textTheme: textTheme,
    );
  }
}

class AppThemeProvider extends StatefulWidget {
  const AppThemeProvider({
    required this.child,
    required this.initialTheme,
    super.key,
  });

  final Widget child;
  final AppTheme initialTheme;

  @override
  _AppThemeProviderState createState() => _AppThemeProviderState();
}

class _AppThemeBindingScope extends InheritedWidget {
  const _AppThemeBindingScope({
    required super.child,
    required this.applicationThemeProviderState,
  });

  final _AppThemeProviderState applicationThemeProviderState;

  @override
  bool updateShouldNotify(_AppThemeBindingScope oldWidget) => true;
}

class _AppThemeProviderState extends State<AppThemeProvider> {
  late AppTheme currentTheme;

  @override
  void initState() {
    super.initState();
    currentTheme = widget.initialTheme;
  }

  void updateTheme(AppTheme newTheme) {
    if (newTheme != currentTheme) {
      setState(() {
        currentTheme = newTheme;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _AppThemeBindingScope(
      applicationThemeProviderState: this,
      child: widget.child,
    );
  }
}

extension AppThemeTextStyleExtensions on AppThemeTextStyle {
  TextStyle get white => copyWith(
        color: colorScheme.white,
      );
}
