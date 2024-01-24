// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrencyDto _$$_CurrencyDtoFromJson(Map<String, dynamic> json) =>
    _$_CurrencyDto(
      key: json['key'] as String,
      name: json['name'] as String,
      exchange: (json['exchange'] as num).toDouble(),
      flag: json['flag'] as String,
    );

Map<String, dynamic> _$$_CurrencyDtoToJson(_$_CurrencyDto instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'exchange': instance.exchange,
      'flag': instance.flag,
    };
