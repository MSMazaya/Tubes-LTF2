#include <Arduino.h>
#include <Motor.hpp>
#include <Control.hpp>
#include <ArduinoJson.h>
#include <WiFi.h>
#include <esp_now.h>
#include <Vector2D.hpp>
#include "spiffs_helper.hpp"
#include "comm_thread.hpp"

const char* ssidPath = "/ssid.txt";
const char* passPath = "/pass.txt";
const char* autoPath = "/auto.txt";


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

String ssid;
String pass;
String autonomous;

Motor frontLeft(
    MB_EN1,
    MB_IN1,
    MB_IN2,
    2);

Motor frontRight(
    MA_EN2,
    MA_IN3,
    MA_IN4,
    1);

Motor backLeft(
    MB_EN2,
    MB_IN3,
    MB_IN4,
    3);

Motor backRight(
    MA_EN1,
    MA_IN1,
    MA_IN2,
    0);

Control control(
    &frontRight,
    &frontLeft,
    &backRight,
    &backLeft);

Vector2D data;
esp_now_peer_info_t peerInfo;

typedef struct myData
{
    char payload[100];
} myData;

myData input_;

/* 9C:9C:1F:EA:41:4C */
uint8_t broadcastAddress[] = {0xAC, 0x67, 0xB2, 0x3B, 0xE6, 0x84};

void sendMessage(myData &data)
{
    Serial.println("SEND DATA");
    esp_err_t result = esp_now_send(broadcastAddress, (uint8_t *)&data, sizeof(data));
    delay(3000);

    if (result == ESP_OK)
    {
        Serial.println("Sent with success");
    }
    else
    {
        Serial.println("Error sending the data");
    }
}

// callback function that will be executed when data is received
void OnDataRecv(const uint8_t *mac, const uint8_t *incomingData, int len)
{
    if (len == 100)
    {
        memcpy(&input_, incomingData, sizeof(input_));

        sendMessage(input_);

        DynamicJsonDocument doc(1024);
        deserializeJson(doc, input_.payload);

        const char *ssid = doc["payload"]["ssid"];
        const char *password = doc["payload"]["password"];

        Serial.println(ssid);
        Serial.println(password);

        /* EEPROM.put(100, ssid); */
        /* EEPROM.put(200, password); */
        /* EEPROM.put(300, false); */
        writeFile(SPIFFS, ssidPath, "SSID");
        writeFile(SPIFFS, passPath, "PASS");
        writeFile(SPIFFS, passPath, "PASS");

        ESP.restart();
    }
    else
    {
        memcpy(&data, incomingData, sizeof(data));
        Serial.println(data.x);
        Serial.println(data.y);
    }
}

void OnDataSent(const uint8_t *mac_addr, esp_now_send_status_t status)
{
    Serial.print("\r\nLast Packet Send Status:\t");
    Serial.println(status == ESP_NOW_SEND_SUCCESS ? "Delivery Success" : "Delivery Fail");
}

void setup()
{
    Serial.begin(9600);

    initSPIFFS();

    ssid = readFile(SPIFFS, ssidPath);
    pass = readFile(SPIFFS, passPath);
    autonomous = readFile(SPIFFS, autoPath);

    Serial.println(ssid);
    Serial.println(pass);
    
    WiFi.mode(WIFI_AP_STA);
    
    if (esp_now_init() != ESP_OK)
    {
        Serial.println("Error initializing ESP-NOW");
        return;
    }
    
    esp_now_register_recv_cb(OnDataRecv);
    esp_now_register_send_cb(OnDataSent);
    
    memcpy(peerInfo.peer_addr, broadcastAddress, 6);
    peerInfo.channel = 0;
    peerInfo.encrypt = false;
    
    if (esp_now_add_peer(&peerInfo) != ESP_OK)
    {
        Serial.println("Failed to add peer");
        return;
    }

    comm_thread::setup(autonomous == "AUTO", ssid, pass);
}

void loop()
{
    /* if (autonomous) */
    /* { */
    /*     if(data.y == 0 && data.x == 0)  */
    /*     { */
    /*         control.stop(); */
    /*     } */
    /*     else if (data.y < 0) */
    /*     { */
    /*         Serial.println("ROTATE TO BACK"); */
    /*         control.rotateCW(); */
    /*     }  */
    /*     else if (data.x > data.y)  */
    /*     { */
    /*         Serial.println("ROTATE TO RIGHT"); */
    /*         control.rotateCW();  */
    /*     } */
    /*     else if (abs(data.x) > data.y) */
    /*     { */
    /*         Serial.println("ROTATE TO LEFT"); */
    /*         control.rotateCCW(); */
    /*     }  */
    /*     else */
    /*     { */
    /*         Serial.print("MOVE FORWARD, scale: "); */
    /*         Serial.println(1-data.y); */
    /*         control.moveForwardWithSpeedScale(1 - data.y); */
    /*     } */
    /* } */
}
