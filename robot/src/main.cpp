#include <Arduino.h>
#include <WiFi.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

// TODO - Refactor later, dont use global definition, instead use isolated class for OLED
#define D_WIDTH   128 
#define D_HEIGHT  32 
#define D_RESET   4
#define D_ADDR    0x3C
Adafruit_SSD1306 oled(D_WIDTH, D_HEIGHT, &Wire, D_RESET);

void printMac() {
    oled.clearDisplay();

    char buff[20];
    sprintf(buff, "suuiii");

    
    oled.setTextSize(1);
    oled.setCursor(0,12);
    oled.print(WiFi.macAddress());
    Serial.println("IN");
    oled.display();
}

void setup(){
    Serial.begin(9600);
    Serial.println("\nOLED Test"); 
    if (!oled.begin(SSD1306_SWITCHCAPVCC, D_ADDR)) {
        Serial.println("OLED allocation failed");
        for (;;); // Don't proceed, loop forever
    }
    WiFi.mode(WIFI_MODE_STA);
    oled.setFont();
    oled.setTextColor(WHITE);
}

void loop(){
    printMac();
    delay(200);
}
