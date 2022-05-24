// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wifi_creds_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WifiCredsPayload _$WifiCredsPayloadFromJson(Map<String, dynamic> json) {
  return _WifiCredsPayload.fromJson(json);
}

/// @nodoc
mixin _$WifiCredsPayload {
  String get ssid => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WifiCredsPayloadCopyWith<WifiCredsPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WifiCredsPayloadCopyWith<$Res> {
  factory $WifiCredsPayloadCopyWith(
          WifiCredsPayload value, $Res Function(WifiCredsPayload) then) =
      _$WifiCredsPayloadCopyWithImpl<$Res>;
  $Res call({String ssid, String password});
}

/// @nodoc
class _$WifiCredsPayloadCopyWithImpl<$Res>
    implements $WifiCredsPayloadCopyWith<$Res> {
  _$WifiCredsPayloadCopyWithImpl(this._value, this._then);

  final WifiCredsPayload _value;
  // ignore: unused_field
  final $Res Function(WifiCredsPayload) _then;

  @override
  $Res call({
    Object? ssid = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      ssid: ssid == freezed
          ? _value.ssid
          : ssid // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_WifiCredsPayloadCopyWith<$Res>
    implements $WifiCredsPayloadCopyWith<$Res> {
  factory _$$_WifiCredsPayloadCopyWith(
          _$_WifiCredsPayload value, $Res Function(_$_WifiCredsPayload) then) =
      __$$_WifiCredsPayloadCopyWithImpl<$Res>;
  @override
  $Res call({String ssid, String password});
}

/// @nodoc
class __$$_WifiCredsPayloadCopyWithImpl<$Res>
    extends _$WifiCredsPayloadCopyWithImpl<$Res>
    implements _$$_WifiCredsPayloadCopyWith<$Res> {
  __$$_WifiCredsPayloadCopyWithImpl(
      _$_WifiCredsPayload _value, $Res Function(_$_WifiCredsPayload) _then)
      : super(_value, (v) => _then(v as _$_WifiCredsPayload));

  @override
  _$_WifiCredsPayload get _value => super._value as _$_WifiCredsPayload;

  @override
  $Res call({
    Object? ssid = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_WifiCredsPayload(
      ssid: ssid == freezed
          ? _value.ssid
          : ssid // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WifiCredsPayload
    with DiagnosticableTreeMixin
    implements _WifiCredsPayload {
  const _$_WifiCredsPayload({required this.ssid, required this.password});

  factory _$_WifiCredsPayload.fromJson(Map<String, dynamic> json) =>
      _$$_WifiCredsPayloadFromJson(json);

  @override
  final String ssid;
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WifiCredsPayload(ssid: $ssid, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WifiCredsPayload'))
      ..add(DiagnosticsProperty('ssid', ssid))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WifiCredsPayload &&
            const DeepCollectionEquality().equals(other.ssid, ssid) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ssid),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_WifiCredsPayloadCopyWith<_$_WifiCredsPayload> get copyWith =>
      __$$_WifiCredsPayloadCopyWithImpl<_$_WifiCredsPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WifiCredsPayloadToJson(this);
  }
}

abstract class _WifiCredsPayload implements WifiCredsPayload {
  const factory _WifiCredsPayload(
      {required final String ssid,
      required final String password}) = _$_WifiCredsPayload;

  factory _WifiCredsPayload.fromJson(Map<String, dynamic> json) =
      _$_WifiCredsPayload.fromJson;

  @override
  String get ssid => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WifiCredsPayloadCopyWith<_$_WifiCredsPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
