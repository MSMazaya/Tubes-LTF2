#pragma once
#include <Arduino.h>
#include <Vector2D.hpp>
#include <SensorLDR.hpp>
#include <Filter.hpp>
#include <ConcreteFilter.hpp>
#include "communication.hpp"
#include <EEPROM.h>
#include <ArduinoJson.h>
#include <MQTT.h>

namespace process
{
    void autonomous_setup(bool, char[], char[]);
    void main();
    void ldrReadData();
    Vector2D calculateIntent();
}
