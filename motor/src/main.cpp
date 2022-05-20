#include <Arduino.h>
#include <Motor.hpp>
#include <Control.hpp>
#include <WiFi.h>
#include <esp_now.h>
#include <Vector2D.hpp>
#include "main_thread.hpp"
#include "BluetoothSerial.h"

Vector2D data;

BluetoothSerial SerialBT;
 
// callback function that will be executed when data is received
void OnDataRecv(const uint8_t * mac, const uint8_t *incomingData, int len) {
  memcpy(&data, incomingData, sizeof(data));
  Serial.print("Bytes received: ");
  Serial.println(len);
  Serial.print("x: ");
  Serial.println(data.x);
  Serial.print("y: ");
  Serial.println(data.y);
}
 

void setup() {
  Serial.begin(9600);
  SerialBT.begin("ESP32");

  WiFi.mode(WIFI_AP_STA);

  if (esp_now_init() != ESP_OK) {
    Serial.println("Error initializing ESP-NOW");
    return;
  }
  
  esp_now_register_recv_cb(OnDataRecv);
  /* main_thread::setup(); */
}

void loop()   
{    
    if(SerialBT.available()) {
        Serial.println(SerialBT.read());
    }
} 
