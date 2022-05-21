import 'dart:convert';
import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/services/storage.dart';
import 'package:mobile/types/esp_command/esp_command.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ControlViewModel extends BaseViewModel {
  final _storageService = locator<StorageService>();
  final _dialogService = locator<DialogService>();
  BluetoothConnection? connection;

  String username = "user";

  void onMount() async {
    String address =
        await _storageService.getValue(key: "deviceAddress") ?? "none";

    if (address == "none") {
      _dialogService.showDialog(
          title: "Alert", description: "No device bonded");
      return;
    }
    if (connection == null) {
      BluetoothConnection.toAddress(address).then((_connection) {
        connection = _connection;
        notifyListeners();
      });
    }
  }

  void test() {
    const tes = EspCommand(type: "COMMAND", payload: "MOVERIGHT");
    _sendMessage(json.encode(tes.toJson()));
  }

  void _sendMessage(String text) async {
    try {
      connection!.output.add(Uint8List.fromList(utf8.encode(text + "\r\n")));
      await connection!.output.allSent;
    } catch (e) {
      _dialogService.showDialog(title: "alert", description: e.toString());
    }
  }

  void getUsername() async {
    username = await _storageService.getValue(key: "username") ?? username;
    notifyListeners();
  }

  bool _onAction = false;
  bool get onAction => _onAction;

  void commandForward() {
    _onAction = true;
    notifyListeners();
  }

  void commandBackward() {
    _onAction = true;
    notifyListeners();
  }

  void commandRotate() {
    _onAction = true;
    notifyListeners();
  }

  void commandStop() {
    _onAction = false;
    notifyListeners();
  }
}
