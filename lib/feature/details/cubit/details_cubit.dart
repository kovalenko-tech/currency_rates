import 'dart:async';

import 'package:currency_rates/common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'details_cubit.freezed.dart';
part 'details_state.dart';

@injectable
class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit({
    required CurrencyRepository currencyRepository,
  })  : _currencyRepository = currencyRepository,
        super(const _Initial());

  final CurrencyRepository _currencyRepository;

  StreamSubscription<Result<List<Currency>>>? _streamSubscription;

  @override
  Future<void> close() async {
    _streamSubscription?.cancel();
    return super.close();
  }

  Future<void> init({
    required String key,
  }) async {
    emit(const _Loading());
    _streamSubscription ??= _currencyRepository.watchAllCurrencyByKey(key: key).listen((result) {
      emit(result.map(
        success: (result) => _Success(currencies: result.data),
        failed: (_) => const _Failure(),
      ));
    });
  }
}
