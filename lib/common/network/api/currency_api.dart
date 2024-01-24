import 'package:currency_rates/common/common.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'currency_api.g.dart';

@RestApi()
@injectable
abstract class CurrencyApi {
  @factoryMethod
  factory CurrencyApi(Dio dio) => FakeApi.currency.isEnabled ? FakeCurrencyApi() : _CurrencyApi(dio);

  /// list of currenct exchange rates and a timestamp
  @GET('/fx/current')
  Future<CurrencyResponseDto> getCurrencies();
}

class FakeCurrencyApi implements CurrencyApi {
  @override
  Future<CurrencyResponseDto> getCurrencies() async {
    return CurrencyResponseDto.fromJson({
      "currencies": [
        {"key": "usd", "name": "US Dollar", "exchange": 3.6873025642360084, "flag": "🇺🇸"},
        {"key": "eu", "name": "Euro", "exchange": 3.7703619294845376, "flag": "🇪🇺"},
        {"key": "gbp", "name": "British Pound", "exchange": 4.8361014948428265, "flag": "🇬🇧"},
        {"key": "jpy", "name": "Japanese Yen", "exchange": 0.024302517914913505, "flag": "🇯🇵"}
      ],
      "timestamp": 1706072584145
    });
  }
}
