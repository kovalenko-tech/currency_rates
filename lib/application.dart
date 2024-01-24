import 'package:currency_rates/common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application(
    this.routerConfig, {
    super.key,
  });

  final RouterConfig<Object> routerConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: context.themeData,
      routerConfig: routerConfig,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(1),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
