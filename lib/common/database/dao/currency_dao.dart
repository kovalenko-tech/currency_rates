import 'package:currency_rates/common/database/app_database.dart';
import 'package:currency_rates/common/database/table/table.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

part 'currency_dao.g.dart';

@injectable
@DriftAccessor(tables: [CurrencyTable])
class CurrencyDao extends DatabaseAccessor<AppDatabase> with _$CurrencyDaoMixin {
  CurrencyDao(AppDatabase db) : super(db);

  Future<List<CurrencyEntity>> getAllCurrencyByTimestampId({
    required int timestampId,
  }) =>
      (select(currencyTable)..where((t) => t.timestampId.equals(timestampId))).get();

  Stream<List<CurrencyEntity>> watchAllCurrencyByKey({
    required String key,
  }) =>
      (select(currencyTable)
            ..where((t) => t.key.equals(key))
            ..orderBy([
              (tbl) => OrderingTerm(expression: tbl.timestampId, mode: OrderingMode.desc),
            ]))
          .watch();

  Future<void> saveCurrencies({
    required List<CurrencyEntity> list,
  }) =>
      batch((batch) => batch.insertAll(currencyTable, list));
}
