import 'package:flutter/material.dart';
import 'package:mobile/views/bluetooth_config/bluetooth_config_viewmodel.dart';
import 'package:stacked/stacked.dart';

class BluetoothConfigView extends StatelessWidget {
  BluetoothConfigView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BluetoothConfigViewModel>.reactive(
      viewModelBuilder: () => BluetoothConfigViewModel(),
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
                  "Bluetooth",
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
                    "Available Devices",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => ListTile(),
                )
              ],
            ),
          ),
        ),
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
      ),
    );
  }
}
