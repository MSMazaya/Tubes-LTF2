import 'package:mobile/app/app.locator.dart';
import 'package:mobile/services/storage.dart';
import 'package:stacked/stacked.dart';

class ControlViewModel extends BaseViewModel {
  final _storageService = locator<StorageService>();

  String username = "user";

  void getUsername() async {
    username = await _storageService.getValue(key: "username") ?? username;
    notifyListeners();
  }
}
