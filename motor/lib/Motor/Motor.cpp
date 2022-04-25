#include<Motor.hpp>

void Motor::init(int pinEnable_input, int pinInput1_input, int pinInput2_input) {
    pinEnable = pinEnable_input;
    pinInput1 = pinInput1_input;
    pinInput2 = pinInput2_input;
    pinMode(pinEnable, OUTPUT); 
    pinMode(pinInput1, OUTPUT); 
    pinMode(pinInput2, OUTPUT); 
}

void Motor::runForward() {
    digitalWrite(pinEnable, HIGH);
    digitalWrite(pinInput1, HIGH);
    digitalWrite(pinInput2, LOW);
}

void Motor::runBackward() {
    digitalWrite(pinEnable, HIGH);
    digitalWrite(pinInput1, LOW);
    digitalWrite(pinInput2, HIGH);
}

void Motor::stop() {
    digitalWrite(pinEnable, LOW);
    digitalWrite(pinInput1, LOW);
    digitalWrite(pinInput2, LOW);
}
