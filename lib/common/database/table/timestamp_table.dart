import 'package:drift/drift.dart';

@DataClassName("TimestampEntity")
class TimestampTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
}
