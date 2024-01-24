part of 'details_cubit.dart';

@freezed
class DetailsState with _$DetailsState {
  const factory DetailsState.initial() = _Initial;
  const factory DetailsState.loading() = _Loading;
  const factory DetailsState.success({
    required List<Currency> currencies,
  }) = _Success;
  const factory DetailsState.failure() = _Failure;
}
