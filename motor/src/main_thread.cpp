#define MA_EN2 13
#define MA_EN1 33 

#define MA_IN1 25
#define MA_IN2 26
#define MA_IN3 27
#define MA_IN4 32

#define MB_EN1 22
#define MB_EN2 16

#define MB_IN1 21
#define MB_IN2 19
#define MB_IN3 17
#define MB_IN4 4
#include <ArduinoJson.h>
#include "BluetoothSerial.h"
#include "main_thread.hpp"

namespace main_thread {
    /* Control control; */
    /* Motor frontLeft; */
    /* Motor frontRight; */
    /* Motor backLeft; */
    /* Motor backRight; */
    /* BluetoothSerial SerialBT; */
    /* bool autonomously = false; */
    /*  */
    /* void setup() { */
    /*     SerialBT.begin("ESP32"); */
    /*  */
    /*     backRight.init( */
    /*         MA_EN1, */
    /*         MA_IN1, */
    /*         MA_IN2, */
    /*         0 */
    /*     ); */
    /*      */
    /*     // MA_EN2 */
    /*     frontRight.init( */
    /*         MA_EN2, */
    /*         MA_IN3, */
    /*         MA_IN4, */
    /*         1 */
    /*     ); */
    /*      */
    /*     // MB_EN1 */
    /*     frontLeft.init(  */
    /*         MB_EN1,  */
    /*         MB_IN1, */
    /*         MB_IN2, */
    /*         2 */
    /*     ); */
    /*      */
    /*     // MB_EN2 */
    /*     backLeft.init( */
    /*         MB_EN2, */
    /*         MB_IN3, */
    /*         MB_IN4, */
    /*         3 */
    /*     ); */
    /*      */
    /*     control.init( */
    /*         frontRight, */
    /*         frontLeft, */
    /*         backRight, */
    /*         backLeft */
    /*     ); */
    /* } */

    void loop() {
        /* digitalWrite(MB_EN1, HIGH); */
        /* digitalWrite(MB_IN1, HIGH); */
        /* digitalWrite(MB_IN2, LOW); */
        /* int bytesAvailable = SerialBT.available(); */

        /* if(autonomously) { */
        /*  */
        /* } else { */
        /*     if(bytesAvailable) { */
        /*         String json = SerialBT.readString(); */
        /*         Serial.println(json); */
        /*  */
        /*         char buff[1024]; */
        /*         json.toCharArray(buff, 1024); */
        /*  */
        /*         DynamicJsonDocument doc(1024); */
        /*         deserializeJson(doc, buff); */
        /*  */
        /*         const char* type = doc["type"]; */
        /*  */
        /*         if(strcmp(type,"SETUP") == 0) { */
        /*             autonomously = !autonomously; */
        /*         }  */
        /*  */
        /*         if(strcmp(type,"COMMAND") == 0) { */
        /*             const char* payload = doc["payload"]; */
        /*             if(strcmp(payload, "FORWARD") == 0) { */
        /*                 Serial.println("MOVING FORWARD"); */
        /*                 control.moveForward(); */
        /*             } else if (strcmp(payload, "BACKWARD") == 0) { */
        /*                 Serial.println("MOVING BACKWARD"); */
        /*                 control.moveBackward(); */
        /*             } else if (strcmp(payload, "ROTATE") == 0) { */
        /*                 Serial.println("ROTATING"); */
        /*                 control.rotateCW(0); */
        /*             } else if (strcmp(payload,"STOP") == 0) { */
        /*                 Serial.println("STOPPING"); */
        /*                 control.stop(); */
        /*             } */
        /*         } */
        /*     } */
        /* } */
    }
}
