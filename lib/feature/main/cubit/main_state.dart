part of 'main_cubit.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(Duration(seconds: 2)) Duration refreshDuration,
    @Default([]) List<Currency> currencies,
  }) = _MainState;
}
