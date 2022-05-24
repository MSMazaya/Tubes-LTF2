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
    communication::non_autonomous_loop();
    delay(200);
}
