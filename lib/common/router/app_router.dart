import 'package:currency_rates/feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

@TypedGoRoute<MainRoute>(path: '/')
class MainRoute extends GoRouteData {
  const MainRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => MainPage(
        onCurrencyDetails: (currencyKey, flag) => DetailsRoute(
          currencyKey: currencyKey,
          flag: flag,
        ).push(context),
      );
}

@TypedGoRoute<DetailsRoute>(path: '/details')
class DetailsRoute extends GoRouteData {
  const DetailsRoute({
    required this.flag,
    required this.currencyKey,
  });

  final String flag;
  final String currencyKey;

  @override
  Widget build(BuildContext context, GoRouterState state) => DetailsPage(
        currencyKey: currencyKey,
        flag: flag,
      );
}
