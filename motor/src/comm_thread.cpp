#include <WiFi.h>
#include <SPI.h>
#include <MQTT.h>
#include <ArduinoJson.h>
#include <EEPROM.h>

namespace comm_thread
{
  const char *clientID = "TUBES-LTF2/Light-Follower";

  WiFiClient net;
  MQTTClient client;

  unsigned long lastMillis = 0;

  void connect()
  {
    Serial.print("checking wifi...");
    while (WiFi.status() != WL_CONNECTED)
    {
      Serial.print(".");
      delay(1000);
    }

    Serial.print("\nconnecting...");
    while (!client.connect("Tubes-LTF2", "Light-Follower"))
    {
      Serial.print(".");
      delay(1000);
    }

    Serial.println("\nconnected!");

    client.subscribe("/hello");
  }

  void messageReceived(String &topic, String &payload)
  {
    Serial.println("incoming: " + topic + " - " + payload);

    /* Serial.println(WiFi.macAddress()); */
    /* int bytesAvailable = SerialBT.available(); */
    /* if(autonomously) { */
    /*  */
    /* } else { */
    /*     if(bytesAvailable) { */
    /*         String json = SerialBT.readString(); */
    /*  */
    /*         char buff[1024]; */
    /*         json.toCharArray(buff, 1024); */
    /*  */
    /*         DynamicJsonDocument doc(1024); */
    /*         deserializeJson(doc, buff); */
    /*  */
    /*         const char* type = doc["type"]; */
    /*  */
    /*         if(strcmp(type,"SETUP") == 0) { */
    /*             autonomously = !autonomously; */
    /*         }  */
    /*  */
    /*         if(strcmp(type,"COMMAND") == 0) { */
    /*             const char* payload = doc["payload"]; */
    /*             if(strcmp(payload, "FORWARD") == 0) { */
    /*                 Serial.println("MOVING FORWARD"); */
    /*                 control.moveForward(); */
    /*             } else if (strcmp(payload, "BACKWARD") == 0) { */
    /*                 Serial.println("MOVING BACKWARD"); */
    /*                 control.moveBackward(); */
    /*             } else if (strcmp(payload, "ROTATE") == 0) { */
    /*                 Serial.println("ROTATING"); */
    /*                 control.rotateCW(0); */
    /*             } else if (strcmp(payload,"STOP") == 0) { */
    /*                 Serial.println("STOPPING"); */
    /*                 control.stop(); */
    /*             } */
    /*         } */
    /*     } */
    /* } */
  }

  void setup(bool autonomous, const char* ssid, const char* pass)
  {
    if (!autonomous)
    {
      Serial.println("NON AUTO");
      EEPROM.put(300, true);
      WiFi.begin(ssid, pass);
      client.begin("iot.tf.itb.ac.id", net);
      client.onMessage(messageReceived);

      connect();
    }
  }

  void loop()
  {
    client.loop();

    // publish a message roughly every second.
    if (millis() - lastMillis > 1000)
    {
      lastMillis = millis();
      client.publish("LABTF2/Tubes-LTF2/Light-Follower", "{}");
    }
  }

}
