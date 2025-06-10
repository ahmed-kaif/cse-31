#include <Arduino.h>
#define POT_PIN PA0
#define LED PB0
#define LDR PB1
void setup() {
  pinMode(POT_PIN, INPUT);
  pinMode(LED, OUTPUT);
  pinMode(LDR, INPUT);
}

/*
LDR,
Potentiometer,
Temperature Sensor
Next Lab TinkerCAD test
*/
void loop() {
  int value = analogRead(LDR);
  value = map(value, 0, 1023, 255, 0);
  analogWrite(LED, value);
  delay(500);
}
