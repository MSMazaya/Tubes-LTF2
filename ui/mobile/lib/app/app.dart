import 'package:mobile/services/bluetooth.dart';
import 'package:mobile/services/storage.dart';
import 'package:mobile/views/bluetooth_config/bluetooth_config_view.dart';
import 'package:mobile/views/main/activity/activity_view.dart';
import 'package:mobile/views/main/control/control_view.dart';
import 'package:mobile/views/main/main_view.dart';
import 'package:mobile/views/main/settings/settings_view.dart';
import 'package:mobile/views/startup/startup_view.dart';
import 'package:mobile/views/wifi_config/wifi_config_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: BluetoothConfigView),
    MaterialRoute(page: WifiConfigView),
    MaterialRoute(page: MainView),
    MaterialRoute(page: ControlView),
    MaterialRoute(page: ActivityView),
    MaterialRoute(page: SettingsView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BluetoothService),
    LazySingleton(classType: StorageService),
    LazySingleton(classType: DialogService),
  ],
)
class App {}
