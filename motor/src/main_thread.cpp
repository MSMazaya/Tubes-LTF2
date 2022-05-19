#include "pins.h"
#include "main_thread.hpp"

namespace main_thread {
    Control control;
    Motor frontLeft;
    Motor frontRight;
    Motor backLeft;
    Motor backRight;

    void setup() {
        backRight.init(
            MA_EN1,
            MA_IN1,
            MA_IN2,
            0
        );

        // MA_EN2
        frontRight.init(
            MA_EN2,
            MA_IN3,
            MA_IN4,
            1
        );

        // MB_EN1
        frontLeft.init( 
            MB_EN1, 
            MB_IN1,
            MB_IN2,
            2
        );

        // MB_EN2
        backLeft.init(
            MB_EN2,
            MB_IN3,
            MB_IN4,
            3
        );

        control.init(
            frontRight,
            frontLeft,
            backRight,
            backLeft
        );
    }

    void test_move() {
    }
}
