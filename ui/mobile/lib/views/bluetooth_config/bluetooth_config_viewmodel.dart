import 'dart:async';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:mobile/services/bluetooth.dart';
import 'package:mobile/services/storage.dart';
import 'package:stacked_services/stacked_services.dart';

class BluetoothConfigViewModel extends BaseViewModel {
  final _bluetoothService = locator<BluetoothService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _storageService = locator<StorageService>();

  StreamSubscription<BluetoothDiscoveryResult>? _streamSubscription;
  List<BluetoothDiscoveryResult> results =
      List<BluetoothDiscoveryResult>.empty(growable: true);
  bool isDiscovering = false;

  void info(String message) async {
    _dialogService.showDialog(title: "info", description: message);
  }

  void submit({required String deviceAddress, required String deviceName}) {
    _storageService.setValue(key: "deviceAddress", value: deviceAddress);
    _storageService.setValue(key: "deviceName", value: deviceAddress);
    next();
  }

  void restartDiscovery() {
    results.clear();
    isDiscovering = true;
    notifyListeners();

    _startDiscovery();
  }

  void _startDiscovery() {
    _streamSubscription = _bluetoothService.getStreamDiscovery().listen((r) {
      final existingIndex = results
          .indexWhere((element) => element.device.address == r.device.address);

      if (existingIndex >= 0) {
        results[existingIndex] = r;
      } else {
        results.add(r);
      }

      notifyListeners();
    });

    _streamSubscription!.onDone(() {
      isDiscovering = false;
      notifyListeners();
    });
  }

  void disposeBluetoothStream() {
    _streamSubscription?.cancel();
  }

  void next() async {
    await _navigationService.navigateTo(Routes.wifiConfigView);
  }
}
