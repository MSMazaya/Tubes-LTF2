import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/types/wifi_creds_payload/wifi_creds_payload.dart';

part 'esp_command.freezed.dart';
part 'esp_command.g.dart';

@freezed
class EspCommand with _$EspCommand {
  const factory EspCommand({
    required String type,
    required WifiCredsPayload payload,
  }) = _EspCommand;

  factory EspCommand.fromJson(Map<String, Object?> json) =>
      _$EspCommandFromJson(json);
}
