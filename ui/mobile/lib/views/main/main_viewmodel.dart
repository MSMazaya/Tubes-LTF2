import 'package:flutter/cupertino.dart';
import 'package:mobile/views/main/activity/activity_view.dart';
import 'package:mobile/views/main/control/control_view.dart';
import 'package:mobile/views/main/settings/settings_view.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel {
  int _currentTabIndex = 0;
  int get currentTabIndex => _currentTabIndex;

  bool _reverse = false;
  bool get reverse => _reverse;

  void setTabIndex(int value) {
    if (value < _currentTabIndex) {
      _reverse = true;
    }
    _currentTabIndex = value;
    notifyListeners();
  }

  final Map<int, Widget> _viewCache = Map<int, Widget>();

  Widget getViewForIndex(int index) {
    if (!_viewCache.containsKey(index)) {
      switch (index) {
        case 0:
          _viewCache[index] = ControlView();
          break;
        case 1:
          _viewCache[index] = ActivityView();
          break;
        case 2:
          _viewCache[index] = SettingsView();
          break;
      }
    }

    return _viewCache[index]!;
  }
}
