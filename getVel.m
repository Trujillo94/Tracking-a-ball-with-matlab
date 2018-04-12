function [ vel ] = getVel( CG, px2m, timeFrame,nFrames,flag )
%Computes the velocity of the object knowing its position in 2 frames
%   INPUTS:
%           CG: position of the gravity center in each frame
%           px2m: convertion factor of pixels to meters [m/px]
%           timeFrame: time between consecutive frames [s]
%           nFrames: number of frames
%   OUTPUTS:
%           vel: array containing the velocity of each frame [m/s]

for i=2:nFrames-1
        vel(i).x = px2m*(CG(i+1).x-CG(i).x)/(timeFrame);
        vel(i).y = px2m*(CG(i+1).y-CG(i).y)/(timeFrame);
        vel(i).mag = sqrt(vel(i).x^2+vel(i).y^2);
        if flag==0
        vel(i).z =(CG(i-1).z-CG(i).z)/timeFrame;
        end
end

