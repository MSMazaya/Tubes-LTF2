#include <Arduino.h>
#include <Motor.hpp>
#include <Control.hpp>
#include <ArduinoJson.h>
#include <WiFi.h>
#include <esp_now.h>
#include <Vector2D.hpp>
#include "BluetoothSerial.h"

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

Motor frontLeft(
    MB_EN1, 
    MB_IN1,
    MB_IN2,
    2
);

Motor frontRight(
    MA_EN2,
    MA_IN3,
    MA_IN4,
    1
);

Motor backLeft(
    MB_EN2,
    MB_IN3,
    MB_IN4,
    3
);

Motor backRight(
    MA_EN1,
    MA_IN1,
    MA_IN2,
    0
);

Control control(
    &frontRight,
    &frontLeft,
    &backRight,
    &backLeft
);

BluetoothSerial SerialBT;
bool autonomously = false;


Vector2D data;
const char* input_;
 
// callback function that will be executed when data is received
void OnDataRecv(const uint8_t * mac, const uint8_t *incomingData, int len) {

  /* naive checking input based on length of 
   * datatype coming:
   * 1. String (json) : 12
   * 2. Vector (2 int) : 4
   */
  if(len == 4) {
    memcpy(&data, incomingData, sizeof(data));
  } else if(len == 12){
    memcpy(&input_, incomingData, sizeof(input_));
    Serial.println(input_);
  }
}

void setup() {
    Serial.begin(9600);
    WiFi.mode(WIFI_AP_STA);

    if (esp_now_init() != ESP_OK) {
        Serial.println("Error initializing ESP-NOW");
        return;
    }

    esp_now_register_recv_cb(OnDataRecv); 

    SerialBT.begin("ESP32");

    /* main_thread::setup(); */
}


void loop()   
{    
    int bytesAvailable = SerialBT.available();
    
    if(autonomously) {
    
    } else {
        if(bytesAvailable) {
            String json = SerialBT.readString();
            Serial.println(json);
    
            char buff[1024];
            json.toCharArray(buff, 1024);
    
            DynamicJsonDocument doc(1024);
            deserializeJson(doc, buff);
    
            const char* type = doc["type"];
    
            if(strcmp(type,"SETUP") == 0) {
                autonomously = !autonomously;
            } 
    
            if(strcmp(type,"COMMAND") == 0) {
                const char* payload = doc["payload"];
                if(strcmp(payload, "FORWARD") == 0) {
                    Serial.println("MOVING FORWARD");
                    control.moveForward();
                } else if (strcmp(payload, "BACKWARD") == 0) {
                    Serial.println("MOVING BACKWARD");
                    control.moveBackward();
                } else if (strcmp(payload, "ROTATE") == 0) {
                    Serial.println("ROTATING");
                    control.rotateCW(0);
                } else if (strcmp(payload,"STOP") == 0) {
                    Serial.println("STOPPING");
                    control.stop();
                }
            }
        }
    }
} 
