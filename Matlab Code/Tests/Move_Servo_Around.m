clear;
clc;
%%Servo can be cotrolled by sending microsecounds pulse width over USB. 
%%Full rotation is around 180 us
%%Limit urself to 1100-1900 us to have good accuracy 


%Camera preparation
cameras = webcamlist
cam = webcam
%img = snapshot(cam);
%imshow(img);

%Serial port preparation
port_list = serialportlist
s = serialport("COM4",115200);
s.Terminator;
configureTerminator(s,"LF");

Angle_Move(s,0,30);
Angle_Move(s,180,6);
Angle_Move(s,2*180,6);
Angle_Move(s,3*180,6);
Angle_Move(s,4*180,6);
Angle_Move(s,5*180,6);
Angle_Move(s,6*180,6);
Angle_Move(s,7*180,6);
Angle_Move(s,8*180,6);
