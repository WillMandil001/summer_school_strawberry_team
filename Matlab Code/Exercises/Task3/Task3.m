%Clear the workspace
clear;
clc;

%Connect to arduino serial port
serialportlist
s = serialport("COM3",115200);
s.Terminator;
configureTerminator(s,"LF");

%Prepare Camera
cameras = webcamlist;
cam = webcam;


%Take a picture
img = snapshot(cam);
imshow(img);

%Specify tag family
tagFamily = ["tag36h11"];
%Specify tag size 
tagSize = 0.06;
data = load("camIntrinsicsAprilTag.mat");
intrinsics = data.intrinsics;
[id,loc,pose] = readAprilTag(img,"tag36h11",intrinsics,tagSize);
worldPoints = [0 0 0; tagSize/2 0 0; 0 tagSize/2 0; 0 0 tagSize/2];

for i = 1:length(pose)
    % Get image coordinates for axes.
    imagePoints = worldToImage(intrinsics,pose(i).Rotation, pose(i).Translation,worldPoints);

    % Draw colored axes.
    img3 = insertShape(img,"Line",[imagePoints(1,:) imagePoints(2,:); ...
        imagePoints(1,:) imagePoints(3,:); imagePoints(1,:) imagePoints(4,:)], "Color",["red","green","blue"],"LineWidth",7);

    img3 = insertText(img3,loc(1,:,i),id(i),"BoxOpacity",1,"FontSize",25);
    imshow(img3);
end

disp(pose)

pose.Rotation

% eulZYX = rotm2eul(pose.Rotation);
% eulZYX(1)



