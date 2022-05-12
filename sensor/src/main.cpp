#include <Arduino.h>
#include <Vector2D.hpp>
#include <SensorLDR.hpp>
#include <Filter.hpp>
#include <ConcreteFilter.hpp>
#include "process.hpp"
#include "communication.hpp"

void setup() {
    Serial.begin(9600);   
    communication::setup();
}


void loop() {
    process::main();
    delay(200);
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
