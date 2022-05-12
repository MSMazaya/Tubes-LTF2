#pragma once
#include <Arduino.h>
#include <Motor.hpp>

namespace test{
    void pwm(Motor frontLeft, Motor backRight) {
        float counter = -1;
        bool s = true;
        while(true) {
            Serial.println(counter);
            frontLeft.runWithPWM(counter*255);
            backRight.runWithPWM(counter*255);
            /* frontRight.runWithPWM(counter*255); */
            /* backLeft.runWithPWM(counter*255); */
            /* control.moveForwardWithSpeedScale(counter); */
            if(s) {
                if(counter >= 0.99) {
                    s=!s;
                }
                counter+=0.01;
            } else {
                if(counter <= -0.99) {
                    s=!s;
                }
                counter-=0.01;
            }
            delay(100);
        }
    }
}
