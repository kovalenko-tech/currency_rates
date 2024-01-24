import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, int> {
  const DateTimeConverter();

  @override
  DateTime fromJson(int value) => DateTime.fromMillisecondsSinceEpoch(value * 1000);

  @override
  int toJson(DateTime value) => value.millisecondsSinceEpoch ~/ 1000;
}
