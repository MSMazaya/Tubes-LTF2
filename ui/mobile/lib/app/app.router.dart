// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../views/bluetooth_config/bluetooth_config_view.dart';
import '../views/startup/startup_view.dart';
import '../views/wifi_config/wifi_config_view.dart';

class Routes {
  static const String startupView = '/';
  static const String bluetoothConfigView = '/bluetooth-config-view';
  static const String wifiConfigView = '/wifi-config-view';
  static const all = <String>{
    startupView,
    bluetoothConfigView,
    wifiConfigView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.bluetoothConfigView, page: BluetoothConfigView),
    RouteDef(Routes.wifiConfigView, page: WifiConfigView),
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
