// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrencyResponseDto _$CurrencyResponseDtoFromJson(Map<String, dynamic> json) {
  return _CurrencyResponseDto.fromJson(json);
}

/// @nodoc
mixin _$CurrencyResponseDto {
  List<CurrencyDto> get currencies => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyResponseDtoCopyWith<CurrencyResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyResponseDtoCopyWith<$Res> {
  factory $CurrencyResponseDtoCopyWith(
          CurrencyResponseDto value, $Res Function(CurrencyResponseDto) then) =
      _$CurrencyResponseDtoCopyWithImpl<$Res, CurrencyResponseDto>;
  @useResult
  $Res call(
      {List<CurrencyDto> currencies, @DateTimeConverter() DateTime timestamp});
}

/// @nodoc
class _$CurrencyResponseDtoCopyWithImpl<$Res, $Val extends CurrencyResponseDto>
    implements $CurrencyResponseDtoCopyWith<$Res> {
  _$CurrencyResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencies = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      currencies: null == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<CurrencyDto>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrencyResponseDtoCopyWith<$Res>
    implements $CurrencyResponseDtoCopyWith<$Res> {
  factory _$$_CurrencyResponseDtoCopyWith(_$_CurrencyResponseDto value,
          $Res Function(_$_CurrencyResponseDto) then) =
      __$$_CurrencyResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CurrencyDto> currencies, @DateTimeConverter() DateTime timestamp});
}

/// @nodoc
class __$$_CurrencyResponseDtoCopyWithImpl<$Res>
    extends _$CurrencyResponseDtoCopyWithImpl<$Res, _$_CurrencyResponseDto>
    implements _$$_CurrencyResponseDtoCopyWith<$Res> {
  __$$_CurrencyResponseDtoCopyWithImpl(_$_CurrencyResponseDto _value,
      $Res Function(_$_CurrencyResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencies = null,
    Object? timestamp = null,
  }) {
    return _then(_$_CurrencyResponseDto(
      currencies: null == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<CurrencyDto>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrencyResponseDto implements _CurrencyResponseDto {
  const _$_CurrencyResponseDto(
      {required final List<CurrencyDto> currencies,
      @DateTimeConverter() required this.timestamp})
      : _currencies = currencies;

  factory _$_CurrencyResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_CurrencyResponseDtoFromJson(json);

  final List<CurrencyDto> _currencies;
  @override
  List<CurrencyDto> get currencies {
    if (_currencies is EqualUnmodifiableListView) return _currencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencies);
  }

  @override
  @DateTimeConverter()
  final DateTime timestamp;

  @override
  String toString() {
    return 'CurrencyResponseDto(currencies: $currencies, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrencyResponseDto &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_currencies), timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrencyResponseDtoCopyWith<_$_CurrencyResponseDto> get copyWith =>
      __$$_CurrencyResponseDtoCopyWithImpl<_$_CurrencyResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrencyResponseDtoToJson(
      this,
    );
  }
}

abstract class _CurrencyResponseDto implements CurrencyResponseDto {
  const factory _CurrencyResponseDto(
          {required final List<CurrencyDto> currencies,
          @DateTimeConverter() required final DateTime timestamp}) =
      _$_CurrencyResponseDto;

  factory _CurrencyResponseDto.fromJson(Map<String, dynamic> json) =
      _$_CurrencyResponseDto.fromJson;

  @override
  List<CurrencyDto> get currencies;
  @override
  @DateTimeConverter()
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencyResponseDtoCopyWith<_$_CurrencyResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
