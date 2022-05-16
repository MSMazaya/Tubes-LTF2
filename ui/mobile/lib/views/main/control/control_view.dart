import 'package:flutter/material.dart';

class ControlView extends StatelessWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hey, <Username>",
          style: TextStyle(
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
              ],
            ))
      ],
    );
  }
}
