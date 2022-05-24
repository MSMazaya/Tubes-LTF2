#pragma once
#include <Arduino.h>

namespace comm_thread {
    void connect();
    void setup(bool, String, String);
    void loop();
}
