function [ background ] = getBackground( mov, fr_ind1, fr_ind2, back_ind, n )
%getBackground: returns a gray background based in frame differences. 
%Substracts frame1 and frame2 and fills the empty space with otherFrame.
%   INPUTS:
%           mov: movie structure. Must contain gray field.
%           fr_ind1: index of the first frame
%           fr_ind2: index of the second frame
%           back_ind: index of the filler frame. The ball must be in a
%           different place of frame 1 and 2.
%           n: dilate parameter (side of the square structured element
%           used to dilate the substraction of frames, in pixels).
%   OUTPUTS:
%           background: the resulting gray frame of substracting frame1 and
%           frame 2 and filling the empty space with otherFrame.

frame1 = mov(fr_ind1).gray;
frame2 = mov(fr_ind2).gray;
back = mov(back_ind).gray;

sz = size(frame1);
background = zeros(sz(1), sz(2));

%----------------SUBSTRACT FRAMES------------------------------------------
difference = imabsdiff(frame1,frame2);
thresh = graythresh(difference); %Computes the gray intensity of the difference image
bw = (difference >= thresh * 255);
pix = 20; conn = 26;
% removes from a binary image all connected components (objects) that have
% fewer than P pixels
subs = bwareaopen(bw, pix, conn);




%--------------------------------------------------------------------------


subs = imdilate(subs, ones(n,n));
background(~subs) = frame1(~subs);
background(subs) = back(subs);
background = uint8(background);


end

