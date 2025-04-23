#include <Arduino.h>

#define LED_PIN PC13
// PC13 - Builtin LED
// LAB Report
/*
  1. 2 Problem Name: Turning on a LED & Blinking LED
  2. Program = Source Code
  3. Circuit Diagram
  # Home Task:
   - TinkerCAD simulation
   - Simulatation SS
  4. Discussion = learning reflection about the lab, active, past perfect

*/

void setup() { pinMode(LED_PIN, OUTPUT); }

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(LED_PIN, HIGH);
  delay(100);
  digitalWrite(LED_PIN, LOW);
  delay(100);
  analogRead(PC13);
}
