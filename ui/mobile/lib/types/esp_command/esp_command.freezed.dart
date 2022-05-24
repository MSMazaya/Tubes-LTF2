// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'esp_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EspCommand _$EspCommandFromJson(Map<String, dynamic> json) {
  return _EspCommand.fromJson(json);
}

/// @nodoc
mixin _$EspCommand {
  String get type => throw _privateConstructorUsedError;
  WifiCredsPayload get payload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EspCommandCopyWith<EspCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EspCommandCopyWith<$Res> {
  factory $EspCommandCopyWith(
          EspCommand value, $Res Function(EspCommand) then) =
      _$EspCommandCopyWithImpl<$Res>;
  $Res call({String type, WifiCredsPayload payload});

  $WifiCredsPayloadCopyWith<$Res> get payload;
}

/// @nodoc
class _$EspCommandCopyWithImpl<$Res> implements $EspCommandCopyWith<$Res> {
  _$EspCommandCopyWithImpl(this._value, this._then);

  final EspCommand _value;
  // ignore: unused_field
  final $Res Function(EspCommand) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? payload = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as WifiCredsPayload,
    ));
  }

  @override
  $WifiCredsPayloadCopyWith<$Res> get payload {
    return $WifiCredsPayloadCopyWith<$Res>(_value.payload, (value) {
      return _then(_value.copyWith(payload: value));
    });
  }
}

/// @nodoc
abstract class _$$_EspCommandCopyWith<$Res>
    implements $EspCommandCopyWith<$Res> {
  factory _$$_EspCommandCopyWith(
          _$_EspCommand value, $Res Function(_$_EspCommand) then) =
      __$$_EspCommandCopyWithImpl<$Res>;
  @override
  $Res call({String type, WifiCredsPayload payload});

  @override
  $WifiCredsPayloadCopyWith<$Res> get payload;
}

/// @nodoc
class __$$_EspCommandCopyWithImpl<$Res> extends _$EspCommandCopyWithImpl<$Res>
    implements _$$_EspCommandCopyWith<$Res> {
  __$$_EspCommandCopyWithImpl(
      _$_EspCommand _value, $Res Function(_$_EspCommand) _then)
      : super(_value, (v) => _then(v as _$_EspCommand));

  @override
  _$_EspCommand get _value => super._value as _$_EspCommand;

  @override
  $Res call({
    Object? type = freezed,
    Object? payload = freezed,
  }) {
    return _then(_$_EspCommand(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as WifiCredsPayload,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EspCommand with DiagnosticableTreeMixin implements _EspCommand {
  const _$_EspCommand({required this.type, required this.payload});

  factory _$_EspCommand.fromJson(Map<String, dynamic> json) =>
      _$$_EspCommandFromJson(json);

  @override
  final String type;
  @override
  final WifiCredsPayload payload;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EspCommand(type: $type, payload: $payload)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EspCommand'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('payload', payload));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EspCommand &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.payload, payload));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(payload));

  @JsonKey(ignore: true)
  @override
  _$$_EspCommandCopyWith<_$_EspCommand> get copyWith =>
      __$$_EspCommandCopyWithImpl<_$_EspCommand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EspCommandToJson(this);
  }
}

abstract class _EspCommand implements EspCommand {
  const factory _EspCommand(
      {required final String type,
      required final WifiCredsPayload payload}) = _$_EspCommand;

  factory _EspCommand.fromJson(Map<String, dynamic> json) =
      _$_EspCommand.fromJson;

  @override
  String get type => throw _privateConstructorUsedError;
  @override
  WifiCredsPayload get payload => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EspCommandCopyWith<_$_EspCommand> get copyWith =>
      throw _privateConstructorUsedError;
}
