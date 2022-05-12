#include<Motor.hpp>

void Motor::init(int pinEnable_input, int pinInput1_input, int pinInput2_input, int channel_input) {
    pinEnable = pinEnable_input;
    pinInput1 = pinInput1_input;
    pinInput2 = pinInput2_input;
    channel = channel_input;
    ledcSetup(channel, 5000, 8);
    ledcAttachPin(pinEnable, channel);
    pinMode(pinEnable, OUTPUT); 
    pinMode(pinInput1, OUTPUT); 
    pinMode(pinInput2, OUTPUT); 
}

void Motor::runForward() {
    digitalWrite(pinEnable, HIGH);
    digitalWrite(pinInput1, HIGH);
    digitalWrite(pinInput2, LOW);
}

void Motor::runWithPWM(int pwm) {
    ledcWrite(channel, abs(pwm));

    if(pwm < 0) {
        digitalWrite(pinInput1, HIGH);
        digitalWrite(pinInput2, LOW);
    } else {
        digitalWrite(pinInput1, LOW);
        digitalWrite(pinInput2, HIGH);
    }
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
