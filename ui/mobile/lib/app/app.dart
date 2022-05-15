import 'package:mobile/services/bluetooth.dart';
import 'package:mobile/views/bluetooth_config/bluetooth_config_view.dart';
import 'package:mobile/views/startup/startup_view.dart';
import 'package:mobile/views/wifi_config/wifi_config_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: BluetoothConfigView),
    MaterialRoute(page: WifiConfigView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BluetoothService),
  ],
)
class App {}
