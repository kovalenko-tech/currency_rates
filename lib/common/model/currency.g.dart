// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Currency _$$_CurrencyFromJson(Map<String, dynamic> json) => _$_Currency(
      key: json['key'] as String,
      name: json['name'] as String,
      exchange: (json['exchange'] as num).toDouble(),
      flag: json['flag'] as String,
    );

Map<String, dynamic> _$$_CurrencyToJson(_$_Currency instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'exchange': instance.exchange,
      'flag': instance.flag,
    };
