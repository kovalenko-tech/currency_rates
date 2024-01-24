import 'package:currency_rates/common/database/database.dart';
import 'package:currency_rates/common/model/model.dart';
import 'package:currency_rates/common/network/network.dart';

extension CurrencyDtoExtension on CurrencyDto {
  Currency toDomain() => Currency(
        key: key,
        name: name,
        exchange: exchange,
        flag: flag,
      );
}

extension CurrencyEntityExtension on CurrencyEntity {
  Currency toDomain() => Currency(
        key: key,
        name: name,
        exchange: exchange,
        flag: flag,
      );
}

extension CurrencyExtension on Currency {
  CurrencyEntity toEntity({
    required int timestampId,
  }) =>
      CurrencyEntity(
        key: key,
        name: name,
        exchange: exchange,
        timestampId: timestampId,
        flag: flag,
      );
}
