#pragma once
#include <Arduino.h>
#include <Vector2D.hpp>
#include <SensorLDR.hpp>
#include <Filter.hpp>
#include <ConcreteFilter.hpp>
#include "communication.hpp"

namespace process {
    void setup();
    void main();
    void ldrReadData();
    Vector2D calculateIntent();
}
