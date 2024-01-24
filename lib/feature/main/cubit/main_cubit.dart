import 'dart:async';

import 'package:currency_rates/common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

@injectable
class MainCubit extends Cubit<MainState> {
  MainCubit({
    required CurrencyRepository currencyRepository,
  })  : _currencyRepository = currencyRepository,
        super(const _MainState());

  final CurrencyRepository _currencyRepository;

  Timer? _timer;

  StreamSubscription<Result<List<Currency>>>? _streamSubscription;

  @override
  Future<void> close() async {
    _timer?.cancel();
    _streamSubscription?.cancel();
    return super.close();
  }

  Future<void> init() async {
    await _getData();

    _startTimerWithDuration(state.refreshDuration);
  }

  void _startTimerWithDuration(Duration duration) {
    _timer?.cancel();
    _timer = Timer.periodic(duration, (timer) {
      unawaited(_getData());
    });
  }

  Future<void> _getData() async {
    final result = await _currencyRepository.getCurrencies();

    emit(result.map(
      success: (result) => state.copyWith(
        currencies: result.data,
      ),
      failed: (_) => state,
    ));
  }

  void updateDuration({
    required Duration duration,
  }) {
    emit(state.copyWith(
      refreshDuration: duration,
    ));

    _startTimerWithDuration(duration);
  }
}
