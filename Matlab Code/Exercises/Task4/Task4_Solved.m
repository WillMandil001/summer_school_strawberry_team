%Clear the workspace
clear;
clc;

%Connect to arduino serial port
serialportlist
s = serialport("COM4",115200);
s.Terminator;
configureTerminator(s,"LF");

%Prepare Camera
cameras = webcamlist
cam = webcam

last_angle = Angle_Move(s,0,2);


while 1    
    %Take a picture
    img = snapshot(cam);
    %imshow(img);

    %Specify tag family
    tagFamily = ["tag36h11"];
    %Specify tag size 
    tagSize = 0.06;
    data = load("camIntrinsicsAprilTag.mat");
    intrinsics = data.intrinsics;
    worldPoints = [0 0 0; tagSize/2 0 0; 0 tagSize/2 0; 0 0 tagSize/2];
    %Read tag location
    [id,loc,pose] = readAprilTag(img,"tag36h11",intrinsics,tagSize);

    %Add the axis drawing to the picture, in for loop if multiple tags
    for i = 1:length(pose)
        % Get image coordinates for axes.
        imagePoints = worldToImage(intrinsics,pose(i).Rotation, pose(i).Translation,worldPoints);

        % Draw colored axes.
        img3 = insertShape(img,"Line",[imagePoints(1,:) imagePoints(2,:); ...
            imagePoints(1,:) imagePoints(3,:); imagePoints(1,:) imagePoints(4,:)], "Color",["red","green","blue"],"LineWidth",7);

        img3 = insertText(img3,loc(1,:,i),id(i),"BoxOpacity",1,"FontSize",25);
        imshow(img3);
    end
    try
        %Change rotation to Euler angles
        eulZYX = rotm2eul(pose.Rotation);
        eulZYX
        
        if eulZYX(1)> 0.5
           last_angle = Angle_Move(s,last_angle + 5 ,1); 
          elseif eulZYX(1)> 0.2
           last_angle = Angle_Move(s,last_angle + 5 ,2);
        elseif eulZYX(1)< -0.2
           last_angle = Angle_Move(s,last_angle - 5 ,2);
        elseif eulZYX(1)< -0.5
           last_angle = Angle_Move(s,last_angle - 5 ,1);
        end
        
    end
    
    
    
    
        
    
    
end

