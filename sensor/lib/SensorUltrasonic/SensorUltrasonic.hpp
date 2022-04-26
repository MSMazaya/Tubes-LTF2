#pragma once
#include <Arduino.h>
#include <Filter.hpp>

class SensorUltrasonic {
    private:
        Filter<int>* filter;        
        int pinTrig;
        int pinEcho;
        int data_index=0;
        int data[];

    public:
        void read();
        float getData();
        SensorUltrasonic(Filter<int> filter_input, int pinTrig, int pinEcho);
};
