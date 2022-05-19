#include <Arduino.h>
#include <Motor.hpp>
#include <Control.hpp>
#include <WiFi.h>
#include <esp_now.h>

namespace main_thread {
    void loop();
    void setup();
    void test_move();
}
