function [ acc ] = getAcc( vel, timeFrame, nFrames,flag )
%getAcc: computes the velocity of the object knowing its position in 2 frames
%   INPUTS:
%           vel: velocity of the gravity center in each frame [m/s]
%           nFrames: number of frames
%   OUTPUTS:
%           acc: array containing the acceleration of each frame [m/s2]

for i=2:nFrames-2
        acc(i).x = (vel(i).x-vel(i-1).x)/(timeFrame);
        acc(i).y = (vel(i).y-vel(i-1).y)/(timeFrame);
        acc(i).mag = sqrt(acc(i).x^2+acc(i).y^2);
        if flag==0
            acc(i).z=(vel(i).z-vel(i-1).z)/(timeFrame);
        end
end

