import 'package:flutter/material.dart';
import 'package:mobile/views/wifi_config/wifi_config_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'wifi_config_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'ssid'),
  FormTextField(name: 'password', isPassword: true)
])
class WifiConfigView extends StatelessWidget with $WifiConfigView {
  WifiConfigView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WifiConfigViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      onDispose: (_) => disposeForm(),
      viewModelBuilder: () => WifiConfigViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 41, 47, 172),
                Color.fromARGB(255, 41, 47, 172),
                Color.fromARGB(255, 18, 26, 62),
                Color.fromARGB(255, 18, 26, 62),
                Color.fromARGB(255, 18, 26, 62),
                Color.fromARGB(255, 18, 26, 62),
                Color.fromARGB(255, 90, 54, 198),
              ],
            ),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "WiFi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                const Text(
                  "Configuration",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: const Text(
                    "Enter WiFi Configuration:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "WiFi SSID",
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  controller: ssidController,
                  focusNode: ssidFocusNode,
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Align(
          alignment: Alignment(1, 0.85),
          child: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 90, 54, 198),
            onPressed: () {
              model.submit();
            },
            child: Text("Next"),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
