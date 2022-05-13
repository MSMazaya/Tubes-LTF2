import 'package:mobile/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:mobile/services/bluetooth.dart';

class BluetoothConfigViewModel extends BaseViewModel {
  final _bluetoothService = locator<BluetoothService>();
}
