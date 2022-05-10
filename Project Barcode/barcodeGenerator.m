% create a jpg of a 4 bit plessey code number 0 to 15
clc
clear
close all

% get user input, verify bounds
userInput = input('Enter a number from 0-15: ');
while (userInput < 0) || (userInput > 15)
    disp('Invalid entry!');
    userInput = input('Enter a number from 0-15: ');
end

% Convert to a binary string
userInputBin = dec2bin(userInput,4);

% Convert to plessey
plesseyCode = flip(userInputBin);

% Generate a jpg image using plessey code
% '0' = narrow bar, wide space. '1' = wide bar, narrow space
A=ones(1080,1920);
Edge = [1 480 960 1440 1920];
narrow=120;
wide=360;
n=1;
while n<5
    if plesseyCode(n) == '1'
        A(:,Edge(n):Edge(n)+wide)=0;
    else
        A(:,Edge(n):Edge(n)+narrow)=0;
    end
    n=n+1;
end

% blur the image a bit
Blur = input('From 0(no blur) to 10(very blurry), enter how blurry do you want the image: ');
while (Blur < 0) || (Blur > 10)
    disp('Invalid entry!');
    Blur = input('From 0(no blur) to 10(very blurry), enter how blurry do you want the image: ');
end
A=A+Blur*rand(1080,1920);

% Create jpg barcode image
imwrite(A,"Barcode.jpg");