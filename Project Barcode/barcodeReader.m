%Read a csv file and convert it to binary and then a number: 0 to 15.
clc
clear
close all

%import csv file as a matrix; file name may need to be changed;
colourVals = csvread("physicalTest1.csv",3);

%The data needed is in col 4, adjust matrix
colourVals = colourVals(:,4);

%Find the average colour values in a window
windowSize = 3;
for i = 1:length(colourVals)-(windowSize-1)
    colourValAvg(i) = sum(colourVals(i:i+(windowSize-1)))/windowSize;
end

%Find the derivative of each point in the avg
for i = 1:length(colourValAvg)-1
    avgDer(i) = colourValAvg(i+1)-colourValAvg(i);
end

%Plot everything in 2 graphs; find the abs peaks of derivative
figure
subplot(2,1,1), plot(colourVals); hold on;
subplot(2,1,1),plot(colourValAvg,'r'); hold on;
subplot(2,1,2), plot(avgDer); hold on;
findpeaks(abs(avgDer),'MinPeakHeight',2);
[~,locs]=findpeaks(abs(avgDer),'MinPeakHeight',5);%for physical min=5, for vw min=1.2

%Distance b/w peaks determines 0(short) or 1(long); store in plessy vector 
i=1;
indx=1;
plessy = [0 0 0 0];
while i < length(locs) 
    if locs(i+1)-locs(i)>5
        plessy(indx)=1;
    else
        plessy(indx)=0;
    end
    i=i+2;
    indx=indx+1;
end

%convert to a string
plessyString = num2str(plessy);

%flip to bin
binString = flip(plessyString);

%Output the number
output = bin2dec(binString);
fprintf("The barcode is for the number: %d \n", output);



