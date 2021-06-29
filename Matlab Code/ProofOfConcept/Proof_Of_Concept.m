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

%%Reference Point
%write(s,"1100","uint8");
pause(3)


%variables
pixel_sums = zeros(1,36);

for angle_n = 1:36
    angle = angle_n *10;
    Angle_Move(s,angle,3);
    img = snapshot(cam);
    %imshow(img);
    file_name = "Image"+ num2str(angle);
    imwrite(img, "ProofOfConceptData/" + file_name + ".jpg");
    HSV = 255 .* rgb2hsv(img);
    H = HSV(:,:,1);
    S = HSV(:,:,2);
    V = HSV(:,:,3);
    mask = (H >= 130) & (H <= 180) & (S >= 100) & (S <= 255) & (V >= 0) & (V <= 255);%range of RGB values
    pixel_sums(angle_n) = sum(sum((mask(:,:) == 1)));
    mask3 = repmat(mask,1,1,3);
    masked_image = img .* uint8(mask3);
    file_name = "Image"+ num2str(angle) + "masked";
    imwrite(masked_image, "ProofOfConceptData/" + file_name + ".jpg");
end

maximum = max(pixel_sums);
front_angle = 10 * find(pixel_sums==maximum)
Angle_Move(s, front_angle, 5);

