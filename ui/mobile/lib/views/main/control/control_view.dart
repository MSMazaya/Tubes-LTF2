import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/utils/shapes.dart';
import 'package:mobile/views/main/control/control_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ControlView extends StatelessWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ControlViewModel>.reactive(
      onModelReady: (model) {
        model.getUsername();
        model.onMount();
      },
      viewModelBuilder: () => ControlViewModel(),
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hey, ${model.username}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 40, 33, 243),
              borderRadius: BorderRadius.circular(20),
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Status: ON",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Temperature: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Distance: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Text(
                        "Front Sensor",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        value: 0.8,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Text(
                        "Back Sensor",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        value: 0.8,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Text(
                        "Left Sensor",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        value: 0.8,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Text(
                        "Right Sensor",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        value: 0.8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    HapticFeedback.vibrate();
                    model.commandForward();
                  },
                  child: MyTriangle(
                    size: 70,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    HapticFeedback.vibrate();
                    if (model.onAction) {
                      model.commandStop();
                    } else {
                      model.commandRotate();
                    }
                  },
                  child: Icon(
                      model.onAction ? Icons.stop : Icons.rotate_90_degrees_ccw,
                      color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    primary: Colors.blue, // <-- Button color
                    onPrimary: Colors.red, // <-- Splash color
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    HapticFeedback.vibrate();
                    model.commandBackward();
                  },
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: MyTriangle(size: 70, color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
