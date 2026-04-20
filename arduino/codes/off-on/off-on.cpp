#include <Arduino.h>

int buttonPin = 9;
int onlinePin = 2;
int offlinePin = 7;

void setup() {
    pinMode(buttonPin, INPUT_PULLUP);
    pinMode(onlinePin, OUTPUT);
    pinMode(offlinePin, OUTPUT);
    digitalWrite(offlinePin, HIGH);
    Serial.begin(9600);
}

int buttonStatus = 0;

void loop() {
    int pinValue = digitalRead(buttonPin);
    delay(10);
    if(buttonStatus != pinValue) {
        buttonStatus = pinValue;
        Serial.println(buttonStatus);
        if(buttonStatus == 0) {
            digitalWrite(onlinePin, HIGH);
            digitalWrite(offlinePin, LOW);
        }
        else {
            digitalWrite(onlinePin, LOW);
            digitalWrite(offlinePin, HIGH);
        }
    }
}