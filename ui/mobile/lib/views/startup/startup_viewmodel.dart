import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:mobile/views/startup/startup_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:mobile/services/storage.dart';

class StartupViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<StorageService>();
  final _dialogService = locator<DialogService>();

  void submit() async {
    if ((usernameValue != null) && (usernameValue!.length > 6)) {
      await _storageService.setValue(key: "username", value: usernameValue!);
      next();
    } else {
      await _dialogService.showDialog(
        title: "Alert",
        description: "Username not long enough",
      );
    }
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  Future<bool> checkUserAvailable() async {
    return _storageService.checkValueAvailability(key: "username");
  }

  void next() async {
    await _navigationService.navigateTo(Routes.bluetoothConfigView);
  }
}
