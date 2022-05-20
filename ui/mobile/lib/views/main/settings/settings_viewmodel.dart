import 'package:mobile/app/app.locator.dart';
import 'package:mobile/services/storage.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';
import 'settings_view.form.dart';

class SettingsViewModel extends FormViewModel {
  final _storageService = locator<StorageService>();
  final _dialogService = locator<DialogService>();

  String? username;
  String? wifiPassword;
  String? wifiSsid;

  void onMount() async {
    username = await _storageService.getValue(key: "username");
    wifiPassword = await _storageService.getValue(key: "wifiPassword");
    wifiSsid = await _storageService.getValue(key: "wifiSsid");
  }

  void submit() async {
    if (usernameValue != null &&
        wifiSsidValue != null &&
        wifiPasswordValue != null) {
      username = usernameValue;
      wifiSsid = wifiSsidValue;
      wifiPassword = wifiPasswordValue;
      _storageService.setValue(
          key: "username", value: usernameValue ?? "No Name");
      _storageService.setValue(key: "wifiSsid", value: wifiSsidValue!);
      _storageService.setValue(key: "widiPassword", value: wifiPasswordValue!);
    } else {
      _dialogService.showDialog(
          title: "alert", description: "Fill all the fields");
    }
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}
