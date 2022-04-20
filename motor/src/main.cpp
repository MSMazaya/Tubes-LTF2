#include <Arduino.h>
#include <Motor.hpp>
#include <Control.hpp>

#define MA_EN1 33
#define MA_EN2 13

#define MA_IN1 25
#define MA_IN2 26
#define MA_IN3 27
#define MA_IN4 32

#define MB_EN1 22
#define MB_EN2 16

#define MB_IN1 21
#define MB_IN2 19
#define MB_IN3 17
#define MB_IN4 4

Control control;
Motor frontLeft;
Motor frontRight;
Motor backLeft;
Motor backRight;

void setup() {
  Serial.begin(9600);

  frontLeft.init(
    MA_EN1,
    MA_IN1,
    MA_IN2 
  );

  frontRight.init(
    MA_EN2,
    MA_IN3,
    MA_IN4
  );

  backLeft.init(
    MB_EN1,
    MB_IN1,
    MB_IN2
  );

  backRight.init(
    MB_EN2,
    MB_IN3,
    MB_IN4
  );

  control.init(
    frontRight,
    frontLeft,
    backRight,
    backLeft
  );

  Serial.println("Setup End");
}

void loop()   
{    
    control.rotateCW(2);
    delay(2000);
} 
