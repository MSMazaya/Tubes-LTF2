// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../views/startup/startup_view.dart';

class Routes {
  static const String startupView = '/';
  static const all = <String>{
    startupView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
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