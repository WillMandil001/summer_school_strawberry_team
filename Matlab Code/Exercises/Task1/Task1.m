clear;
clc;

%Serial port configuration This makes sure that the computer USB port speaks the same convention as the port on the Arduino
serialportlist
s = serialport("COM3",115200);
s.Terminator;
configureTerminator(s,"LF");

%Camera preparation
cameras = webcamlist;
cam = webcam;
%Move servo to mid position there may be a jerky movement at the start of the servo

%Now its time to take a picture
no_moves = floor(last_position/10);
for 1:no_moves
    Angle_Move(s,last_position - 10, 2);
end
Angle_Move(0);

Angle_Move(s,0,5);
img = snapshot(cam);
file_name = "front side";
folderpath = "Pictures from sides/";
imshow(img);
imwrite(img, folderpath + file_name + ".jpg");

Angle_Move(s,90,5);
img = snapshot(cam);
file_name = "left side";
imshow(img);
imwrite(img, folderpath + file_name + ".jpg");

Angle_Move(s,180,5);
img = snapshot(cam);
file_name = "behind";
imshow(img);
imwrite(img, folderpath + file_name + ".jpg");

Angle_Move(s,270,5);
img = snapshot(cam);
file_name = "right side";
imwrite(img, folderpath + file_name + ".jpg");


