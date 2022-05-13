#include <Arduino.h>
#include <Motor.hpp>
#include <Control.hpp>
#include <WiFi.h>
#include <esp_now.h>

struct Data {
    public:
        char a[32];
        void printA() {
            Serial.println(a);
        }
};
 
Data data;
 
// callback function that will be executed when data is received
void OnDataRecv(const uint8_t * mac, const uint8_t *incomingData, int len) {
  memcpy(&data, incomingData, sizeof(data));
  Serial.print("Bytes received: ");
  Serial.println(len);
  Serial.print("Char: ");
  data.printA();
  Serial.println();
}
 

void setup() {
  Serial.begin(9600);
  WiFi.mode(WIFI_AP_STA);

  if (esp_now_init() != ESP_OK) {
    Serial.println("Error initializing ESP-NOW");
    return;
  }
  
  esp_now_register_recv_cb(OnDataRecv);
}

void loop()   
{    
} 
