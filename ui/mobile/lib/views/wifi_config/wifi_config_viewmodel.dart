import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/services/storage.dart';
import 'package:mobile/views/wifi_config/wifi_config_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WifiConfigViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<StorageService>();
  final _dialogService = locator<DialogService>();

  void submit() {
    if (((ssidValue != null) && (ssidValue!.isNotEmpty)) &&
        ((passwordValue != null) && (passwordValue!.isNotEmpty))) {
      _storageService.setValue(key: "wifiSsid", value: ssidValue!);
      _storageService.setValue(key: "wifiPassword", value: passwordValue!);
      next();
    } else {
      _dialogService.showDialog(
          title: "Alert", description: "Fill all the fields");
    }
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  void next() async {
    await _navigationService.navigateTo(Routes.mainView);
  }
}
