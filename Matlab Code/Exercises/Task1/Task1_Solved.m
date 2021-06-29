clear;
clc;

%Serial port configuration
%This makes sure that the computer USB port speaks the same convention as
%the port on the Arduino
serialportlist
s = serialport("COM4",115200);
s.Terminator;
configureTerminator(s,"LF");

%Camera preparation
cameras = webcamlist
cam = webcam

%Move servo to mid position
%There may be a jerky movement at the start of the servo
Angle_Move(s,0,8);

%Now its time to take a picture
img = snapshot(cam);
imshow(img);

%save picture
file_name = "front side";
folderpath = "Pictures from sides/"
imwrite(img, folderpath + file_name + ".jpg");


Angle_Move(s,90,5);
img = snapshot(cam);
imshow(img);
file_name = "left side";
imwrite(img, "Pictures from sides/" + file_name + ".jpg");

Angle_Move(s,180,5);
img = snapshot(cam);
imshow(img);
file_name = "behind";
imwrite(img, "Pictures from sides/" + file_name + ".jpg");

Angle_Move(s,270,5);
img = snapshot(cam);
imshow(img);
file_name = "right side";
imwrite(img, "Pictures from sides/" + file_name + ".jpg");


