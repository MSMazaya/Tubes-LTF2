#include "pins.h"
#include <ArduinoJson.h>
#include "BluetoothSerial.h"
#include "main_thread.hpp"

namespace main_thread {
    Control control;
    Motor frontLeft;
    Motor frontRight;
    Motor backLeft;
    Motor backRight;
    BluetoothSerial SerialBT;
    bool autonomously = true;

    void setup() {
        SerialBT.begin("ESP32");

        backRight.init(
            MA_EN1,
            MA_IN1,
            MA_IN2,
            0
        );

        // MA_EN2
        frontRight.init(
            MA_EN2,
            MA_IN3,
            MA_IN4,
            1
        );

        // MB_EN1
        frontLeft.init( 
            MB_EN1, 
            MB_IN1,
            MB_IN2,
            2
        );

        // MB_EN2
        backLeft.init(
            MB_EN2,
            MB_IN3,
            MB_IN4,
            3
        );

        control.init(
            frontRight,
            frontLeft,
            backRight,
            backLeft
        );
    }

    void loop() {
        int bytesAvailable = SerialBT.available();
        if(bytesAvailable) {
            String json = SerialBT.readString();

            char buff[1024];
            json.toCharArray(buff, 1024);

            DynamicJsonDocument doc(1024);
            deserializeJson(doc, buff);

            const char* type = doc["type"];

            if(type == "SETUP") {
                autonomously = !autonomously;
            } 

            if(autonomously) {

            } else {
                if(type == "COMMAND") {
                    const char* payload = doc["payload"];
                    if(payload == "FORWARD") {
                        control.moveForward();
                    } else if (payload == "BACKWARD") {

                    } else if (payload == "ROTATE") {

                    } else if (payload == "STOP") {

                    }
                }
            }
        }
    }
}
