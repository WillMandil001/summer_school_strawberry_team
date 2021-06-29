#include <Servo.h>
int servoPWM = 10;
Servo Servo1;

void setup() {
  // put your setup code here, to run once:
  Servo1.attach(servoPWM);
  Serial.begin(115200);

}

void loop() {
   int val = 1100;
   Servo1.writeMicroseconds(val); 
   Serial.println(val);
   delay(7000);

   val = val + 174;
   Servo1.writeMicroseconds(val); 
   Serial.println(val);
   delay(7000);

   val = val + 174;
   Servo1.writeMicroseconds(val); 
   Serial.println(val);
   delay(7000);

   val = val + 174;
   Servo1.writeMicroseconds(val); 
   Serial.println(val);
   delay(7000);

   val = val + 174;
   Servo1.writeMicroseconds(val); 
   Serial.println(val);
   delay(7000);

}
