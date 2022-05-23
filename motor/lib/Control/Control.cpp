#include "Control.hpp"

Control::Control(Motor* frontRight, Motor* frontLeft, Motor* backRight, Motor* backLeft) {
    frontRightMotor = frontRight;
    frontLeftMotor = frontLeft;
    backRightMotor = backRight;
    backLeftMotor = backLeft;
}

void Control::rotateCW(float degree) {
    frontRightMotor->runBackward();
    frontLeftMotor->runForward();
    backLeftMotor->runBackward();
    backRightMotor->runForward();
}

void Control::moveForward() {
    backLeftMotor->runForward();
    backRightMotor->runForward();
    frontLeftMotor->runForward();
    frontRightMotor->runForward();
}

void Control::moveBackward() {
    backLeftMotor->runBackward();
    backRightMotor->runBackward();
    frontLeftMotor->runBackward();
    frontRightMotor->runBackward();
}

void Control::moveForwardWithSpeedScale(int scale) {
    int pwm = scale*255;
    backLeftMotor->runWithPWM(pwm);
    backRightMotor->runWithPWM(pwm);
    frontLeftMotor->runWithPWM(pwm);
    frontRightMotor->runWithPWM(pwm);
}

void Control::stop() {
    backLeftMotor->stop();
    backRightMotor->stop();
    frontLeftMotor->stop();
    frontRightMotor->stop();
}
