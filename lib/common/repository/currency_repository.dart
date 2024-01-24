import 'dart:async';

import 'package:currency_rates/common/model/model.dart';
import 'package:currency_rates/common/provider/currency/local_currency_provider.dart';
import 'package:currency_rates/common/provider/provider.dart';
import 'package:injectable/injectable.dart';

@singleton
class CurrencyRepository {
  CurrencyRepository({
    required RemoteCurrencyProvider remoteCurrencyProvider,
    required LocalCurrencyProvider localCurrencyProvider,
  })  : _remoteCurrencyProvider = remoteCurrencyProvider,
        _localCurrencyProvider = localCurrencyProvider;

  final RemoteCurrencyProvider _remoteCurrencyProvider;
  final LocalCurrencyProvider _localCurrencyProvider;

  Future<Result<List<Currency>>> getCurrencies() async {
    final result = await _remoteCurrencyProvider.getCurrencies();

    return result.when(
      success: (data) {
        unawaited(_localCurrencyProvider.saveCurrencies(
          list: data.list,
          date: data.date,
        ));
        return Result.success(data: data.list);
      },
      failed: (_, __, ___) => _localCurrencyProvider.getLastCurrencies(),
    );
  }

  Stream<Result<List<Currency>>> watchAllCurrencyByKey({
    required String key,
  }) =>
      _localCurrencyProvider.watchAllCurrencyByKey(key: key);
}
