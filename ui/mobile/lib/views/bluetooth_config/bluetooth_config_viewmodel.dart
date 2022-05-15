import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:mobile/services/bluetooth.dart';
import 'package:stacked_services/stacked_services.dart';

class BluetoothConfigViewModel extends BaseViewModel {
  final _bluetoothService = locator<BluetoothService>();
  final _navigationService = locator<NavigationService>();

  void next() async {
    await _navigationService.navigateTo(Routes.wifiConfigView);
  }
}
