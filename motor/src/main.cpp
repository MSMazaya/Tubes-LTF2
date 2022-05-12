#include <Arduino.h>
#include <Motor.hpp>
#include <Control.hpp>
#include <WiFi.h>
#include <esp_now.h>
#include "test.hpp"

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

Control control;
Motor frontLeft;
Motor frontRight;
Motor backLeft;
Motor backRight;

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
  control.stop();
}
 

void setup() {
  Serial.begin(9600);

  // MA_EN1
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

  WiFi.mode(WIFI_AP_STA);

  // Init ESP-NOW
  if (esp_now_init() != ESP_OK) {
    Serial.println("Error initializing ESP-NOW");
    return;
  }
  
  // Once ESPNow is successfully Init, we will register for recv CB to
  // get recv packer info
  esp_now_register_recv_cb(OnDataRecv);

  /* WiFi.begin("BAMBANG57", "bambang57"); */
  /* Serial.print("Connecting to WiFi .."); */
  /* while (WiFi.status() != WL_CONNECTED) { */
  /*   Serial.print('.'); */
  /*   delay(1000); */
  /* } */
  /* Serial.println(WiFi.localIP()); */

  /* control.rotateCW(2); */
  /* frontLeft.runForward(); */
  /* frontRight.runForward(); */
  test::pwm(frontLeft, backRight);
}

void loop()   
{    
} 
