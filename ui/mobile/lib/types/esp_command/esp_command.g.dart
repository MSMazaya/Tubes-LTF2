// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'esp_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EspCommand _$$_EspCommandFromJson(Map<String, dynamic> json) =>
    _$_EspCommand(
      type: json['type'] as String,
      payload:
          WifiCredsPayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EspCommandToJson(_$_EspCommand instance) =>
    <String, dynamic>{
      'type': instance.type,
      'payload': instance.payload,
    };
