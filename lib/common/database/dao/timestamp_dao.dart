import 'package:currency_rates/common/database/app_database.dart';
import 'package:currency_rates/common/database/table/table.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

part 'timestamp_dao.g.dart';

@injectable
@DriftAccessor(tables: [TimestampTable])
class TimestampDao extends DatabaseAccessor<AppDatabase> with _$TimestampDaoMixin {
  TimestampDao(AppDatabase db) : super(db);

  Future<int> saveTimestamp({
    required DateTime date,
  }) =>
      db.into(timestampTable).insert(TimestampTableCompanion.insert(date: date));

  Future<TimestampEntity> getTimestamp({
    required int timestampId,
  }) =>
      (db.select(timestampTable)..where((t) => t.id.equals(timestampId))).getSingle();

  Future<TimestampEntity> getLastTimestamp() => (db.select(timestampTable)
        ..orderBy([
          (tbl) => OrderingTerm(expression: tbl.id, mode: OrderingMode.desc),
        ]))
      .getSingle();
}
