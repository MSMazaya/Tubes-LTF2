// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../views/bluetooth_config/bluetooth_config_view.dart';
import '../views/main/activity/activity_view.dart';
import '../views/main/control/control_view.dart';
import '../views/main/main_view.dart';
import '../views/main/settings/settings_view.dart';
import '../views/startup/startup_view.dart';
import '../views/wifi_config/wifi_config_view.dart';

class Routes {
  static const String startupView = '/';
  static const String bluetoothConfigView = '/bluetooth-config-view';
  static const String wifiConfigView = '/wifi-config-view';
  static const String mainView = '/main-view';
  static const String controlView = '/control-view';
  static const String activityView = '/activity-view';
  static const String settingsView = '/settings-view';
  static const all = <String>{
    startupView,
    bluetoothConfigView,
    wifiConfigView,
    mainView,
    controlView,
    activityView,
    settingsView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.bluetoothConfigView, page: BluetoothConfigView),
    RouteDef(Routes.wifiConfigView, page: WifiConfigView),
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.controlView, page: ControlView),
    RouteDef(Routes.activityView, page: ActivityView),
    RouteDef(Routes.settingsView, page: SettingsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartupView: (data) {
      var args = data.getArgs<StartupViewArguments>(
        orElse: () => StartupViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartupView(key: args.key),
        settings: data,
      );
    },
    BluetoothConfigView: (data) {
      var args = data.getArgs<BluetoothConfigViewArguments>(
        orElse: () => BluetoothConfigViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => BluetoothConfigView(key: args.key),
        settings: data,
      );
    },
    WifiConfigView: (data) {
      var args = data.getArgs<WifiConfigViewArguments>(
        orElse: () => WifiConfigViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => WifiConfigView(key: args.key),
        settings: data,
      );
    },
    MainView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MainView(),
        settings: data,
      );
    },
    ControlView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ControlView(),
        settings: data,
      );
    },
    ActivityView: (data) {
      var args = data.getArgs<ActivityViewArguments>(
        orElse: () => ActivityViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ActivityView(key: args.key),
        settings: data,
      );
    },
    SettingsView: (data) {
      var args = data.getArgs<SettingsViewArguments>(
        orElse: () => SettingsViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SettingsView(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// StartupView arguments holder class
class StartupViewArguments {
  final Key? key;
  StartupViewArguments({this.key});
}

/// BluetoothConfigView arguments holder class
class BluetoothConfigViewArguments {
  final Key? key;
  BluetoothConfigViewArguments({this.key});
}

/// WifiConfigView arguments holder class
class WifiConfigViewArguments {
  final Key? key;
  WifiConfigViewArguments({this.key});
}

/// ActivityView arguments holder class
class ActivityViewArguments {
  final Key? key;
  ActivityViewArguments({this.key});
}

/// SettingsView arguments holder class
class SettingsViewArguments {
  final Key? key;
  SettingsViewArguments({this.key});
}
