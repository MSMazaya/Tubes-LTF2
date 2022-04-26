#include "SensorUltrasonic.hpp"
#include <Arduino.h>

SensorUltrasonic::SensorUltrasonic(Filter<int> filter_input, int pinTrig, int pinEcho) : filter(&filter_input) {
    pinMode(pinTrig, OUTPUT);
    pinMode(pinEcho, INPUT);
}

void SensorUltrasonic::read() {
    if(data_index > filter->getWindow()) {
        data_index = 0; 
    }

    digitalWrite(pinTrig, LOW);
    delayMicroseconds(2);
    digitalWrite(pinTrig, HIGH);
    delayMicroseconds(10);
    digitalWrite(pinTrig, LOW);

    float duration = pulseIn(pinEcho, HIGH);

    float distance = duration * 0.034 / 2;

    data[data_index] = distance;
    data_index++;
}

float SensorUltrasonic::getData() {
    return filter->getFiltered(data);
}
