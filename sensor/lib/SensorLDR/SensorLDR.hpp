#pragma once
#include <Arduino.h>
#include <Filter.hpp>

class SensorLDR {
    private:
        Filter<int> *filter;        
        int pin;
        int data_index=0;
        int* data;

    public:
        void read();
        float getData();
        SensorLDR(Filter<int> *filter_input, int pin);
};
