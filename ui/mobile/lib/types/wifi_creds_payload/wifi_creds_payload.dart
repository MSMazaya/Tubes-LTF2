import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'wifi_creds_payload.freezed.dart';
part 'wifi_creds_payload.g.dart';

@freezed
class WifiCredsPayload with _$WifiCredsPayload {
  const factory WifiCredsPayload({
    required String ssid,
    required String password,
  }) = _WifiCredsPayload;

  factory WifiCredsPayload.fromJson(Map<String, Object?> json) =>
      _$WifiCredsPayloadFromJson(json);
}
