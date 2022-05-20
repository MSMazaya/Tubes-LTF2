import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:mobile/views/bluetooth_config/bluetooth_config_viewmodel.dart';
import 'package:stacked/stacked.dart';

class BluetoothConfigView extends StatelessWidget {
  BluetoothConfigView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BluetoothConfigViewModel>.reactive(
      onModelReady: (model) => {model.restartDiscovery()},
      onDispose: (model) => {model.disposeBluetoothStream()},
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
                  child: model.isDiscovering
                      ? const Text(
                          "Searching for Devices",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      : const Text(
                          "Available Devices",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                ),
                model.isDiscovering
                    ? FittedBox(
                        child: Container(
                          margin: new EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: model.results.length,
                        itemBuilder: (context, index) {
                          BluetoothDiscoveryResult result =
                              model.results[index];
                          final device = result.device;
                          final address = device.address;

                          return GestureDetector(
                            onLongPress: () async {
                              // HapticFeedback.vibrate();
                              // bool bonded = false;
                              // if (device.isBonded) {
                              //   print('Unbonding from ${device.address}...');
                              //   await FlutterBluetoothSerial.instance
                              //       .removeDeviceBondWithAddress(address);
                              //   model.info(
                              //       'Unbonding from ${device.address} has succeed');
                              // } else {
                              //   print('Bonding with ${device.address}...');
                              //   bonded = (await FlutterBluetoothSerial.instance
                              //       .bondDeviceAtAddress(address))!;
                              //   model.info(
                              //       'Bonding with ${device.address} has ${bonded ? 'succeed' : 'failed'}.');
                              // }
                              model.restartDiscovery();
                            },
                            onTap: () async {
                              model.submit(
                                deviceAddress: device.address,
                                deviceName: device.name ?? "No Name",
                              );
                            },
                            child: Card(
                              elevation: 5,
                              color: device.isBonded
                                  ? Colors.lightBlue
                                  : Colors.white,
                              child: ListTile(
                                title: Text(device.name ?? "No Name Device"),
                              ),
                            ),
                          );
                        },
                      )
              ],
            ),
          ),
        ),
        floatingActionButton: Align(
          alignment: Alignment(1, 0.85),
          child: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 90, 54, 198),
            onPressed: () {
              model.restartDiscovery();
              // model.next();
            },
            child: const Icon(Icons.restart_alt),
          ),
        ),
      ),
    );
  }
}
