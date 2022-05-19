import 'dart:async';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothService {
  final instance = FlutterBluetoothSerial.instance;

  Stream<BluetoothDiscoveryResult> getStreamDiscovery() =>
      instance.startDiscovery();
}
