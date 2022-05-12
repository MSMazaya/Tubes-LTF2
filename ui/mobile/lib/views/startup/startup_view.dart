import 'package:flutter/material.dart';
import 'startup_view.form.dart';
import 'package:mobile/views/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [FormTextField(name: 'username')])
class StartupView extends StatelessWidget with $StartupView {
  StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      onDispose: (_) => disposeForm(),
      viewModelBuilder: () => StartupViewModel(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: Align(
          alignment: Alignment(1, 0.85),
          child: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 90, 54, 198),
            onPressed: () {},
            child: Text("Next"),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome to",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Solar Tracker App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "What should we call you?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Input your username",
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
            ],
          ),
        ),
      ),
    );
  }
}
