#include <Servo.h>
int servoPWM = 10;
Servo Servo1;

void setup() {
  // put your setup code here, to run once:
  Servo1.attach(servoPWM);
  Serial.begin(115200);
  delay(1000);
}

void loop() {
  // put your main code here, to run repeatedly:
  int milis = input();
  move(milis);
}



 int input() {
  String inString = "";
  while(Serial.available() == 0) { }
  delay(100);
  while (Serial.available() > 0) {
    delay(100);  
    int inChar = Serial.read();
    //Serial.println("Read Char: " + String(inChar));
    inString += (char)inChar;
  }
  int output = inString.toInt();
  //Serial.println("The output is:" + String(output));  
  Serial.println(output); 
  return output;
}


void move(int milis) {
  Servo1.writeMicroseconds(milis); 
  //Serial.println("Moving to lilis: ");
  //Serial.println(milis);
  //delay(3000); 
}
