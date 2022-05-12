import 'package:mobile/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
  ],
)
class App {}
