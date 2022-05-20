import 'package:flutter/material.dart';
import 'package:mobile/views/main/settings/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'settings_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'username'),
  FormTextField(name: 'wifiSsid'),
  FormTextField(name: 'wifiPassword', isPassword: true)
])
class SettingsView extends StatelessWidget with $SettingsView {
  SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      onModelReady: (model) {
        model.onMount();
        listenToFormUpdated(model);
      },
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Settings",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Username",
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              controller: usernameController,
              focusNode: usernameFocusNode,
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
              controller: wifiSsidController,
              focusNode: wifiSsidFocusNode,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Wifi Password",
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              controller: wifiPasswordController,
              focusNode: wifiPasswordFocusNode,
            ),
            SizedBox(height: 20),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    model.submit();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 20),
                  )),
              width: MediaQuery.of(context).size.width,
            )
          ],
        );
      },
    );
  }
}
