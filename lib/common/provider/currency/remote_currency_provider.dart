import 'package:currency_rates/common/common.dart';
import 'package:injectable/injectable.dart';

class Data {
  Data({
    required this.date,
    required this.list,
  });

  final DateTime date;
  final List<Currency> list;
}

@injectable
class RemoteCurrencyProvider {
  const RemoteCurrencyProvider({
    required CurrencyApi currencyApi,
  }) : _currencyApi = currencyApi;

  final CurrencyApi _currencyApi;

  Future<Result<Data>> getCurrencies() async => _currencyApi.getCurrencies().toResult<Data>(
        mapper: (value) => Data(
          date: value.timestamp,
          list: value.currencies.map((e) => e.toDomain()).toList(),
        ),
      );
}
