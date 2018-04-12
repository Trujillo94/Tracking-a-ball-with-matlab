function [ substraction ] = substractFrames( frame1, frame2 )
%substractFrames: subtract frames(giving the absolute value) and remove
%noise of the input frames
%   INPUTS:
%          frame1: first frame
%          frame2: second frame
%   OUTPUTS:
%           substraction: image that is the substraction between two frames


difference = imabsdiff(frame1,frame2);

CV = cov(difference);
CVmed = mean(mean(COV));

bw = (difference > f*CVmed);

substraction = bwareaopen(bw, pix, conn);

end

