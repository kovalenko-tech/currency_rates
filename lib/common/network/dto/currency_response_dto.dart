import 'package:currency_rates/common/network/dto/converter/converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'currency_dto.dart';

part 'currency_response_dto.freezed.dart';
part 'currency_response_dto.g.dart';

@freezed
class CurrencyResponseDto with _$CurrencyResponseDto {
  const factory CurrencyResponseDto({
    required List<CurrencyDto> currencies,
    @DateTimeConverter() required DateTime timestamp,
  }) = _CurrencyResponseDto;

  factory CurrencyResponseDto.fromJson(Map<String, Object?> json) => _$CurrencyResponseDtoFromJson(json);
}
