// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'k_line_stream.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KLineStream _$KLineStreamFromJson(Map<String, dynamic> json) {
  return _KLineStream.fromJson(json);
}

/// @nodoc
class _$KLineStreamTearOff {
  const _$KLineStreamTearOff();

  _KLineStream call(
      {required String e,
      required int E,
      required String s,
      required KLineEntity k}) {
    return _KLineStream(
      e: e,
      E: E,
      s: s,
      k: k,
    );
  }

  KLineStream fromJson(Map<String, Object> json) {
    return KLineStream.fromJson(json);
  }
}

/// @nodoc
const $KLineStream = _$KLineStreamTearOff();

/// @nodoc
mixin _$KLineStream {
  String get e => throw _privateConstructorUsedError;
  int get E => throw _privateConstructorUsedError;
  String get s => throw _privateConstructorUsedError;
  KLineEntity get k => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KLineStreamCopyWith<KLineStream> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KLineStreamCopyWith<$Res> {
  factory $KLineStreamCopyWith(
          KLineStream value, $Res Function(KLineStream) then) =
      _$KLineStreamCopyWithImpl<$Res>;
  $Res call({String e, int E, String s, KLineEntity k});
}

/// @nodoc
class _$KLineStreamCopyWithImpl<$Res> implements $KLineStreamCopyWith<$Res> {
  _$KLineStreamCopyWithImpl(this._value, this._then);

  final KLineStream _value;
  // ignore: unused_field
  final $Res Function(KLineStream) _then;

  @override
  $Res call({
    Object? e = freezed,
    Object? E = freezed,
    Object? s = freezed,
    Object? k = freezed,
  }) {
    return _then(_value.copyWith(
      e: e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as String,
      E: E == freezed
          ? _value.E
          : E // ignore: cast_nullable_to_non_nullable
              as int,
      s: s == freezed
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as String,
      k: k == freezed
          ? _value.k
          : k // ignore: cast_nullable_to_non_nullable
              as KLineEntity,
    ));
  }
}

/// @nodoc
abstract class _$KLineStreamCopyWith<$Res>
    implements $KLineStreamCopyWith<$Res> {
  factory _$KLineStreamCopyWith(
          _KLineStream value, $Res Function(_KLineStream) then) =
      __$KLineStreamCopyWithImpl<$Res>;
  @override
  $Res call({String e, int E, String s, KLineEntity k});
}

/// @nodoc
class __$KLineStreamCopyWithImpl<$Res> extends _$KLineStreamCopyWithImpl<$Res>
    implements _$KLineStreamCopyWith<$Res> {
  __$KLineStreamCopyWithImpl(
      _KLineStream _value, $Res Function(_KLineStream) _then)
      : super(_value, (v) => _then(v as _KLineStream));

  @override
  _KLineStream get _value => super._value as _KLineStream;

  @override
  $Res call({
    Object? e = freezed,
    Object? E = freezed,
    Object? s = freezed,
    Object? k = freezed,
  }) {
    return _then(_KLineStream(
      e: e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as String,
      E: E == freezed
          ? _value.E
          : E // ignore: cast_nullable_to_non_nullable
              as int,
      s: s == freezed
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as String,
      k: k == freezed
          ? _value.k
          : k // ignore: cast_nullable_to_non_nullable
              as KLineEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KLineStream implements _KLineStream {
  _$_KLineStream(
      {required this.e, required this.E, required this.s, required this.k});

  factory _$_KLineStream.fromJson(Map<String, dynamic> json) =>
      _$_$_KLineStreamFromJson(json);

  @override
  final String e;
  @override
  final int E;
  @override
  final String s;
  @override
  final KLineEntity k;

  @override
  String toString() {
    return 'KLineStream(e: $e, E: $E, s: $s, k: $k)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _KLineStream &&
            (identical(other.e, e) ||
                const DeepCollectionEquality().equals(other.e, e)) &&
            (identical(other.E, E) ||
                const DeepCollectionEquality().equals(other.E, E)) &&
            (identical(other.s, s) ||
                const DeepCollectionEquality().equals(other.s, s)) &&
            (identical(other.k, k) ||
                const DeepCollectionEquality().equals(other.k, k)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(e) ^
      const DeepCollectionEquality().hash(E) ^
      const DeepCollectionEquality().hash(s) ^
      const DeepCollectionEquality().hash(k);

  @JsonKey(ignore: true)
  @override
  _$KLineStreamCopyWith<_KLineStream> get copyWith =>
      __$KLineStreamCopyWithImpl<_KLineStream>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_KLineStreamToJson(this);
  }
}

abstract class _KLineStream implements KLineStream {
  factory _KLineStream(
      {required String e,
      required int E,
      required String s,
      required KLineEntity k}) = _$_KLineStream;

  factory _KLineStream.fromJson(Map<String, dynamic> json) =
      _$_KLineStream.fromJson;

  @override
  String get e => throw _privateConstructorUsedError;
  @override
  int get E => throw _privateConstructorUsedError;
  @override
  String get s => throw _privateConstructorUsedError;
  @override
  KLineEntity get k => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$KLineStreamCopyWith<_KLineStream> get copyWith =>
      throw _privateConstructorUsedError;
}
