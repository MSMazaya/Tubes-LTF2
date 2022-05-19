#include "process.hpp"

namespace communication {
    /* 9C:9C:1F:EA:41:4C */
    uint8_t broadcastAddress[] = {0x9C, 0x9C, 0x1F, 0xEA, 0x41, 0x4C};
    esp_now_peer_info_t peerInfo;

    void OnDataSent(const uint8_t *mac_addr, esp_now_send_status_t status) {
      Serial.print("\r\nLast Packet Send Status:\t");
      Serial.println(status == ESP_NOW_SEND_SUCCESS ? "Delivery Success" : "Delivery Fail");
    }

    void setup() {
      // Set device as a Wi-Fi Station
      WiFi.mode(WIFI_STA);
      
      if (esp_now_init() != ESP_OK) {
        Serial.println("Error initializing ESP-NOW"); return;
      }

      esp_now_register_send_cb(OnDataSent);
      
      memcpy(peerInfo.peer_addr, broadcastAddress, 6);
      peerInfo.channel = 0;  
      peerInfo.encrypt = false;
      
      int test = esp_now_add_peer(&peerInfo);  
      if (test != ESP_OK){
        Serial.println("Failed to add peer");
        return;
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
