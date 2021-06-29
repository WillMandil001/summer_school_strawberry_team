#include <Servo.h>
int servoPWM = 2;
Servo Servo1;

void setup() {
  // put your setup code here, to run once:
  Servo1.attach(servoPWM);
  Serial.begin(115200);

}

void loop() {
   int val = 1000;
   Servo1.writeMicroseconds(val); 
   Serial.println(val);
   delay(15000);
    
//   val = 1100;
//   Servo1.writeMicroseconds(val); 
//   Serial.println(val);
//   delay(7000); 
//
//   val = 1200;
//   Servo1.writeMicroseconds(val); 
//   Serial.println(val);
//   delay(7000); 
//
//   val = 1300;
//   Servo1.writeMicroseconds(val); 
//   Serial.println(val);
//   delay(7000); 
//
//   val = 1400;
//   Servo1.writeMicroseconds(val); 
//   Serial.println(val);
//   delay(7000); 
//
//   val = 1500;
//   Servo1.writeMicroseconds(val); 
//   Serial.println(val);
//   delay(7000); 
//
//   val = 1600;
//   Servo1.writeMicroseconds(val); 
//   Serial.println(val);
//   delay(7000); 
//
//   val = 1700;
//   Servo1.writeMicroseconds(val); 
//   Serial.println(val);
//   delay(7000); 
//
//   val = 1800;
//   Servo1.writeMicroseconds(val); 
//   Serial.println(val);
//   delay(7000); 
//
//   val = 1900;
//   Servo1.writeMicroseconds(val); 
//   Serial.println(val);
//   delay(7000); 

   val = 2000;
   Servo1.writeMicroseconds(val); 
   Serial.println(val);
   delay(15000); 

}
