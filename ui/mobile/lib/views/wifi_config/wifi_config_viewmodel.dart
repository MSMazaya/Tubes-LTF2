import 'package:mobile/app/app.locator.dart';
import 'package:mobile/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WifiConfigViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  void next() async {
    await _navigationService.navigateTo(Routes.mainView);
  }
}
