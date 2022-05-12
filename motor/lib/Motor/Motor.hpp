#pragma once
#include <Arduino.h>

class Motor {
    private:
        int pinEnable;
        int channel;
        int pinInput1;
        int pinInput2;

    public:
        void init(int pinEnable_input, int pinInput1_input, int pinInput2_input, int channel);
        void runForward();
        void runWithPWM(int pwm);
        void runBackward();
        void stop();
};
