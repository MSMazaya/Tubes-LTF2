#include <Arduino.h>
#include <WiFi.h>
#include <esp_now.h>
#include <Vector2D.hpp>
#include <SensorLDR.hpp>
#include <Filter.hpp>
#include <ConcreteFilter.hpp>

/* 9C:9C:1F:EA:41:4C */
uint8_t broadcastAddress[] = {0x9C, 0x9C, 0x1F, 0xEA, 0x41, 0x4C};

struct Data {
    public:
        char a[32];
        void printA() {
            Serial.println(a);
        }
};
 
Data data;

esp_now_peer_info_t peerInfo;

// callback when data is sent
void OnDataSent(const uint8_t *mac_addr, esp_now_send_status_t status) {
  Serial.print("\r\nLast Packet Send Status:\t");
  Serial.println(status == ESP_NOW_SEND_SUCCESS ? "Delivery Success" : "Delivery Fail");
}
void setup() {
  Serial.begin(9600);
  /*   */
  /* // Set device as a Wi-Fi Station */
  /* WiFi.mode(WIFI_STA); */
  /*  */
  /* if (esp_now_init() != ESP_OK) { */
  /*   Serial.println("Error initializing ESP-NOW"); return; */
  /* } */
  /* esp_now_register_send_cb(OnDataSent); */
  /*  */
  /* memcpy(peerInfo.peer_addr, broadcastAddress, 6); */
  /* peerInfo.channel = 0;   */
  /* peerInfo.encrypt = false; */
  /*  */
  /* int test = esp_now_add_peer(&peerInfo);   */
  /* if (test != ESP_OK){ */
  /*   Serial.println("Failed to add peer"); */
  /*   return; */
  /* } */
}

MovingAverage<int> ldrFilter(10);

SensorLDR ldrLeft(
    &ldrFilter,
    27
);

SensorLDR ldrFront(
    &ldrFilter,
    26
);

SensorLDR ldrRight(
    &ldrFilter,
    25
);

SensorLDR ldrBack(
    &ldrFilter,
    33
);

void loop() {
    ldrRight.read();
    ldrFront.read();
    ldrBack.read();
    ldrLeft.read();

    
    Vector2D intent(
        ldrRight.getData()/4095 - ldrLeft.getData()/4095,
        ldrFront.getData()/4095 - ldrBack.getData()/4095
    );

    char test[200];
    sprintf(test, "vector: %f %f", intent.x, intent.y);
    Serial.println(test);

    sprintf(test, "vector: %f", intent.magnitude());
    Serial.println(test);

    delay(200);

    /* Serial.println(data); */
}

/* void loop() { */
/*   // Set values to send */
/*   strcpy(data.a, "aaa"); */
/*    */
/*   // Send message via ESP-NOW */
/*   esp_err_t result = esp_now_send(broadcastAddress, (uint8_t *) &data, sizeof(data)); */
/*     */
/*   if (result == ESP_OK) { */
/*     Serial.println("Sent with success"); */
/*   } */
/*   else { */
/*     Serial.println("Error sending the data"); */
/*   } */
/*   delay(2000); */
/* } */
