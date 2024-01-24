import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency.freezed.dart';
part 'currency.g.dart';

@freezed
class Currency with _$Currency {
  const factory Currency({
    required String key,
    required String name,
    required double exchange,
    required String flag,
  }) = _Currency;

  factory Currency.fromJson(Map<String, Object?> json) => _$CurrencyFromJson(json);
}
