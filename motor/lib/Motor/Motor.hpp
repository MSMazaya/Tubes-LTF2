#pragma once
#include <Arduino.h>

class Motor {
    private:
        int pinEnable;
        int pinInput1;
        int pinInput2;

    public:
        void init(int pinEnable_input, int pinInput1_input, int pinInput2_input);
        void runForward();
        void runBackward();
        void stop();
};
