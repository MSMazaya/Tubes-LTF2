#include <Arduino.h>
#include "BluetoothSerial.h"
#include <esp_now.h>
#include <WiFi.h>

BluetoothSerial SerialBT;

uint8_t broadcastAddress[] = {0x84, 0xCC, 0xA8, 0x5E, 0x58, 0xD0};
esp_now_peer_info_t peerInfo;

void OnDataSent(const uint8_t *mac_addr, esp_now_send_status_t status) {
  Serial.print("\r\nLast Packet Send Status:\t");
  Serial.println(status == ESP_NOW_SEND_SUCCESS ? "Delivery Success" : "Delivery Fail");
}

typedef struct myData {
    char payload[100];
} myData;

myData data;

void sendMessage(String input_){
    strcpy(data.payload, input_.c_str());

    Serial.println(data.payload);

    esp_err_t result = esp_now_send(broadcastAddress, (uint8_t *) &data, sizeof(data));

    if (result == ESP_OK) {
        Serial.println("Sent with success");
    } else {
        Serial.println("Error sending the data");
    }
}


myData input_;

TaskHandle_t Task1;

void setup(){
    Serial.begin(9600);
    SerialBT.begin("Light Follower");
    WiFi.mode(WIFI_STA);

    if (esp_now_init() != ESP_OK) {
        Serial.println("Error initializing ESP-NOW"); return;
    }

    esp_now_register_send_cb(OnDataSent);

    memcpy(peerInfo.peer_addr, broadcastAddress, 6);
    peerInfo.channel = 0;  
    peerInfo.encrypt = false;

    if (esp_now_add_peer(&peerInfo) != ESP_OK){
        Serial.println("Failed to add peer");
        return;
    }
}


void loop(){
    int bytesAvailable = SerialBT.available();
    if(bytesAvailable) {
        String test = SerialBT.readString();
        delay(6000);
        sendMessage(test);
    }
}

