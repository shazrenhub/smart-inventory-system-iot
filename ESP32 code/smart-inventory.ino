#define BLYNK_TEMPLATE_ID "TMPL6DaVyZMes"
#define BLYNK_TEMPLATE_NAME "SmartInventory"
#define BLYNK_AUTH_TOKEN "iQ5yHTT7Jghg4Y1aU9mr_ICYREFaHS6R"

#define BLYNK_PRINT Serial

#include <WiFi.h>
#include <BlynkSimpleEsp32.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include "HX711.h"

// WiFi
char ssid[] = "sixseven";
char pass[] = "m9029084";

// OLED
#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define OLED_RESET -1
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

// HX711
#define DT 18
#define SCK 19
HX711 scale;

// Calibration factor
float calibration_factor = 1;

// Noise filter
float previousWeight = 0;
float noiseThreshold = 3.0;

void setup() {
  Serial.begin(9600);

  // OLED start
  if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
    Serial.println("OLED not found");
    while (true);
  }

  display.clearDisplay();
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(0, 0);
  display.println("Initializing...");
  display.display();

  // HX711
  scale.begin(DT, SCK);
  scale.set_scale(calibration_factor);

  delay(2000);
  scale.tare();

  display.clearDisplay();
  display.setCursor(0, 0);
  display.println("Scale Ready");
  display.display();

  delay(1000);

  // Connect to Blynk
  Blynk.begin(BLYNK_AUTH_TOKEN, ssid, pass);

  display.clearDisplay();
  display.setCursor(0, 0);
  display.println("Blynk Connected");
  display.display();
  delay(1000);
}

void loop() {
  Blynk.run();

  static unsigned long lastRead = 0;

  // baca setiap 1.5 saat (bagi stabil)
  if (millis() - lastRead > 1500) {

    float weight = scale.get_units(10);
    Serial.println(weight);
    delay(500);

    // remove noise
    if (weight < 20) weight = 0;

    // smoothing
    weight = (weight + previousWeight) / 2;

    int pieces = 0;
    bool stockCukup = false;
    String statusText = "";

    if (weight >= 150 && weight < 340) {
      pieces = 1;
      statusText = "1 unit";
    }
    else if (weight >= 340 && weight < 500) {
      pieces = 2;
      statusText = "2 units";
    }
    else if (weight >= 500 && weight < 600) {
      pieces = 3;
      statusText = "3 units";
    }
    else if (weight >= 600) {
      stockCukup = true;
      statusText = "Stock Available";
    }
    else {
      pieces = 0;
      statusText = "No item";
    }

    // Serial
    Serial.print("Weight: ");
    Serial.print(weight);
    Serial.print(" g | ");
    Serial.println(statusText);
    Serial.println(scale.get_units());

    // Blynk (slow update)
    Blynk.virtualWrite(V0, weight);
    Blynk.virtualWrite(V1, pieces);
    Blynk.virtualWrite(V2, statusText);

    // OLED
    display.clearDisplay();
    display.setTextColor(WHITE);

    if (stockCukup) {
      display.setTextSize(2);
      display.setCursor(0, 20);
      display.println("Stock");
      display.println("Available");
    } else {
      display.setTextSize(2);
      display.setCursor(0, 20);
      display.print("Unit: ");
      display.print(pieces);
    }

    display.display();

    previousWeight = weight;
    lastRead = millis();
  }
}