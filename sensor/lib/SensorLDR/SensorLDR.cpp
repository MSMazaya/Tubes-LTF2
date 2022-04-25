#include "SensorLDR.hpp"
#include <Arduino.h>

SensorLDR::SensorLDR(Filter<int>& filter_input, int pin) : filter(filter_input) {
    pinMode(pin, INPUT);
}

void SensorLDR::read() {
    if(data_index > filter.getWindow()) {
        data_index = 0;
    }

    int sensor_data = analogRead(pin);
    data[data_index] = sensor_data;
    data_index++;
}

float SensorLDR::getData() {
    return filter.getFiltered(data);
}
