// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrencyResponseDto _$$_CurrencyResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CurrencyResponseDto(
      currencies: (json['currencies'] as List<dynamic>)
          .map((e) => CurrencyDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: const DateTimeConverter().fromJson(json['timestamp'] as int),
    );

Map<String, dynamic> _$$_CurrencyResponseDtoToJson(
        _$_CurrencyResponseDto instance) =>
    <String, dynamic>{
      'currencies': instance.currencies,
      'timestamp': const DateTimeConverter().toJson(instance.timestamp),
    };
