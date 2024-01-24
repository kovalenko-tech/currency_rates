import 'package:currency_rates/common/database/table/table.dart';
import 'package:drift/drift.dart';

@DataClassName("CurrencyEntity")
class CurrencyTable extends Table {
  TextColumn get key => text()();
  TextColumn get name => text()();
  RealColumn get exchange => real()();
  TextColumn get flag => text()();

  IntColumn get timestampId => integer().references(TimestampTable, #id)();

  @override
  Set<Column> get primaryKey => {key, exchange};
}
