#include "Control.hpp"

void Control::init(Motor frontRight, Motor frontLeft, Motor backRight, Motor backLeft) {
    frontRightMotor = frontRight;
    frontLeftMotor = frontLeft;
    backRightMotor = backRight;
    backLeftMotor = backLeft;
}

void Control::rotateCW(float degree) {
    frontRightMotor.runBackward();
    frontLeftMotor.runForward();
    backLeftMotor.runBackward();
    backRightMotor.runForward();
}

void Control::moveForward() {
    backLeftMotor.runForward();
    backRightMotor.runForward();
    frontLeftMotor.runForward();
    frontRightMotor.runForward();
}

void Control::stop() {
    backLeftMotor.stop();
    backRightMotor.stop();
    frontLeftMotor.stop();
    frontRightMotor.stop();
}
