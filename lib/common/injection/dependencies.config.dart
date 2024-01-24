// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:currency_rates/common/common.dart' as _i11;
import 'package:currency_rates/common/constant/config.dart' as _i4;
import 'package:currency_rates/common/database/app_database.dart' as _i3;
import 'package:currency_rates/common/database/dao/currency_dao.dart' as _i5;
import 'package:currency_rates/common/database/dao/timestamp_dao.dart' as _i8;
import 'package:currency_rates/common/injection/api_module.dart' as _i19;
import 'package:currency_rates/common/injection/third_party_module.dart'
    as _i20;
import 'package:currency_rates/common/network/api/currency_api.dart' as _i13;
import 'package:currency_rates/common/network/interceptors/token_interceptor.dart'
    as _i9;
import 'package:currency_rates/common/provider/currency/local_currency_provider.dart'
    as _i12;
import 'package:currency_rates/common/provider/currency/remote_currency_provider.dart'
    as _i14;
import 'package:currency_rates/common/provider/provider.dart' as _i16;
import 'package:currency_rates/common/repository/currency_repository.dart'
    as _i15;
import 'package:currency_rates/feature/details/cubit/details_cubit.dart'
    as _i17;
import 'package:currency_rates/feature/main/cubit/main_cubit.dart' as _i18;
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:go_router/go_router.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyModule = _$ThirdPartyModule();
    final apiModule = _$ApiModule();
    gh.singleton<_i3.AppDatabase>(_i3.AppDatabase());
    gh.factory<_i4.Config>(() => _i4.Config());
    gh.factory<_i5.CurrencyDao>(() => _i5.CurrencyDao(gh<_i3.AppDatabase>()));
    gh.factory<_i6.GoRouter>(() => thirdPartyModule.router);
    gh.factory<_i7.Logger>(() => thirdPartyModule.logger);
    gh.factory<_i8.TimestampDao>(() => _i8.TimestampDao(gh<_i3.AppDatabase>()));
    gh.factory<_i9.TokenInterceptor>(() => _i9.TokenInterceptor());
    gh.factory<_i10.Dio>(() => apiModule.authDio(
          gh<_i11.Config>(),
          gh<_i11.TokenInterceptor>(),
        ));
    gh.factory<_i12.LocalCurrencyProvider>(() => _i12.LocalCurrencyProvider(
          currencyDao: gh<_i11.CurrencyDao>(),
          timestampDao: gh<_i11.TimestampDao>(),
        ));
    gh.factory<_i13.CurrencyApi>(() => _i13.CurrencyApi(gh<_i10.Dio>()));
    gh.factory<_i14.RemoteCurrencyProvider>(
        () => _i14.RemoteCurrencyProvider(currencyApi: gh<_i11.CurrencyApi>()));
    gh.singleton<_i15.CurrencyRepository>(_i15.CurrencyRepository(
      remoteCurrencyProvider: gh<_i16.RemoteCurrencyProvider>(),
      localCurrencyProvider: gh<_i12.LocalCurrencyProvider>(),
    ));
    gh.factory<_i17.DetailsCubit>(() =>
        _i17.DetailsCubit(currencyRepository: gh<_i11.CurrencyRepository>()));
    gh.factory<_i18.MainCubit>(() =>
        _i18.MainCubit(currencyRepository: gh<_i11.CurrencyRepository>()));
    return this;
  }
}

class _$ApiModule extends _i19.ApiModule {}

class _$ThirdPartyModule extends _i20.ThirdPartyModule {}
