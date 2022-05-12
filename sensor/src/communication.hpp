#pragma once
#include <WiFi.h>
#include <esp_now.h>
#include <Vector2D.hpp>

namespace communication {
    void OnDataSent(const uint8_t *mac_addr, esp_now_send_status_t status);
    void setup();
    void sendMessage(Vector2D &intent);
}
