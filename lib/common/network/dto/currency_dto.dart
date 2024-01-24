import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_dto.freezed.dart';
part 'currency_dto.g.dart';

@freezed
class CurrencyDto with _$CurrencyDto {
  const factory CurrencyDto({
    required String key,
    required String name,
    required double exchange,
    required String flag,
  }) = _CurrencyDto;

  factory CurrencyDto.fromJson(Map<String, Object?> json) => _$CurrencyDtoFromJson(json);
}
