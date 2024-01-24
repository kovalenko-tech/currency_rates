import 'package:currency_rates/common/common.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocalCurrencyProvider {
  const LocalCurrencyProvider({
    required CurrencyDao currencyDao,
    required TimestampDao timestampDao,
  })  : _currencyDao = currencyDao,
        _timestampDao = timestampDao;

  final CurrencyDao _currencyDao;
  final TimestampDao _timestampDao;

  Future<Result<List<Currency>>> getLastCurrencies() async {
    final timestamp = await _timestampDao.getLastTimestamp();
    return _currencyDao.getAllCurrencyByTimestampId(timestampId: timestamp.id).toResult<List<Currency>>(
          mapper: (value) => value.map((e) => e.toDomain()).toList(),
        );
  }

  Stream<Result<List<Currency>>> watchAllCurrencyByKey({
    required String key,
  }) =>
      _currencyDao.watchAllCurrencyByKey(key: key).map(
            (event) => Result.success(data: event.map((e) => e.toDomain()).toList()),
          );

  Future<void> saveCurrencies({
    required DateTime date,
    required List<Currency> list,
  }) async {
    final timestampId = await _timestampDao.saveTimestamp(date: date);
    return _currencyDao.saveCurrencies(
        list: list
            .map(
              (e) => e.toEntity(timestampId: timestampId),
            )
            .toList());
  }
}
