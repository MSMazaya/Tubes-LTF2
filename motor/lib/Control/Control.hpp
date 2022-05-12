#pragma once
#include <Motor.hpp>

class Control {
    private:
        Motor frontLeftMotor;
        Motor frontRightMotor;
        Motor backLeftMotor;
        Motor backRightMotor;
    public:
        void init(Motor frontRight, Motor frontLeft, Motor backRight, Motor backLeft);
        void rotateCW(float degree);
        void moveForward();
        void moveForwardWithSpeedScale(int scale);
        void stop();
};
