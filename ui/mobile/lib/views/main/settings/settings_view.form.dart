// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String UsernameValueKey = 'username';
const String WifiSsidValueKey = 'wifiSsid';
const String WifiPasswordValueKey = 'wifiPassword';

mixin $SettingsView on StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController wifiSsidController = TextEditingController();
  final TextEditingController wifiPasswordController = TextEditingController();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode wifiSsidFocusNode = FocusNode();
  final FocusNode wifiPasswordFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    usernameController.addListener(() => _updateFormData(model));
    wifiSsidController.addListener(() => _updateFormData(model));
    wifiPasswordController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            UsernameValueKey: usernameController.text,
            WifiSsidValueKey: wifiSsidController.text,
            WifiPasswordValueKey: wifiPasswordController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    usernameController.dispose();
    usernameFocusNode.dispose();
    wifiSsidController.dispose();
    wifiSsidFocusNode.dispose();
    wifiPasswordController.dispose();
    wifiPasswordFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get usernameValue => this.formValueMap[UsernameValueKey] as String?;
  String? get wifiSsidValue => this.formValueMap[WifiSsidValueKey] as String?;
  String? get wifiPasswordValue =>
      this.formValueMap[WifiPasswordValueKey] as String?;

  bool get hasUsername => this.formValueMap.containsKey(UsernameValueKey);
  bool get hasWifiSsid => this.formValueMap.containsKey(WifiSsidValueKey);
  bool get hasWifiPassword =>
      this.formValueMap.containsKey(WifiPasswordValueKey);

  bool get hasUsernameValidationMessage =>
      this.fieldsValidationMessages[UsernameValueKey]?.isNotEmpty ?? false;
  bool get hasWifiSsidValidationMessage =>
      this.fieldsValidationMessages[WifiSsidValueKey]?.isNotEmpty ?? false;
  bool get hasWifiPasswordValidationMessage =>
      this.fieldsValidationMessages[WifiPasswordValueKey]?.isNotEmpty ?? false;

  String? get usernameValidationMessage =>
      this.fieldsValidationMessages[UsernameValueKey];
  String? get wifiSsidValidationMessage =>
      this.fieldsValidationMessages[WifiSsidValueKey];
  String? get wifiPasswordValidationMessage =>
      this.fieldsValidationMessages[WifiPasswordValueKey];
}

extension Methods on FormViewModel {
  setUsernameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[UsernameValueKey] = validationMessage;
  setWifiSsidValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[WifiSsidValueKey] = validationMessage;
  setWifiPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[WifiPasswordValueKey] = validationMessage;
}
