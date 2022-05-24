#include "process.hpp"

esp_now_peer_info_t peerInfo;

namespace communication {
    bool autonomous = true;

    WiFiClient net;
    MQTTClient client;

    typedef struct myData {
        char payload[100];
    } myData;

    uint8_t broadcastAddress[] = {0x84, 0xCC, 0xA8, 0x5E, 0x58, 0xD0};

    myData input_;

    void OnDataSent(const uint8_t *mac_addr, esp_now_send_status_t status) {
      Serial.print("\r\nLast Packet Send Status:\t");
      Serial.println(status == ESP_NOW_SEND_SUCCESS ? "Delivery Success" : "Delivery Fail");

    }

    void OnDataRecv(const uint8_t * mac, const uint8_t *incomingData, int len) {
        memcpy(&input_, incomingData, sizeof(input_));

        Serial.println("INCOMINGGGGGGGGG");

        DynamicJsonDocument doc(1024);
        deserializeJson(doc, input_.payload);

        const char* ssid = doc["payload"]["ssid"];
        const char* password = doc["payload"]["password"];

        Serial.println(ssid);
        Serial.println(password); 

        EEPROM.put(100, ssid);
        EEPROM.put(200, password);
        EEPROM.put(300, false);

        ESP.restart();
    }

    void non_autonomous_setup(char ssid[], char pass[]) {
        if(!autonomous) {
            EEPROM.put(300, true);
            WiFi.begin(ssid, pass);
            client.begin("iot.tf.itb.ac.id", net);

            Serial.print("checking wifi...");
            while (WiFi.status() != WL_CONNECTED) {
                Serial.print(".");
                delay(1000);
            }

            Serial.print("\nconnecting...");
            while (!client.connect("Tubes-LTF2", "Light-Follower")) {
                Serial.print(".");
                delay(1000);
            }

            Serial.println("\nconnected!");

            client.subscribe("/hello");
        } 
    }

    void setup() {
        // Set device as a Wi-Fi Station
        WiFi.mode(WIFI_AP_STA);

        EEPROM.begin(512); //Initialasing EEPROM

        if (esp_now_init() != ESP_OK) {
            Serial.println("Error initializing ESP-NOW"); return;
        }

        esp_now_register_send_cb(OnDataSent);
        esp_now_register_recv_cb(OnDataRecv); 

        memcpy(peerInfo.peer_addr, broadcastAddress, 6);
        peerInfo.channel = 0;  
        peerInfo.encrypt = false;

        int test = esp_now_add_peer(&peerInfo);  
        if (test != ESP_OK){
            Serial.println("Failed to add peer");
            return;
        }

        char ssid[100];
        char pass[100];

        delay(1000);
        Serial.println(autonomous);
        delay(1000);

        /* EEPROM.get(300,autonomous); */
        EEPROM.get(100,ssid);
        EEPROM.get(200,pass);

        delay(1000);
        Serial.println(autonomous);
        delay(1000);

        non_autonomous_setup(ssid, pass);
    }

    int lastMillis;
    void non_autonomous_loop() {
      client.loop();
      Serial.println(WiFi.macAddress());

      // publish a message roughly every second.
      if (millis() - lastMillis > 1000 ) {
        lastMillis = millis();
        client.publish("LABTF2/Tubes-LTF2/Light-Follower/Sensor", "{}");
      }
    }

    void sendMessage(Vector2D &intent){
        esp_err_t result = esp_now_send(broadcastAddress, (uint8_t *) &intent, sizeof(intent));

        if (result == ESP_OK) {
            Serial.println("Sent with success");
        } else {
            Serial.println("Error sending the data");
        }
    }
}
