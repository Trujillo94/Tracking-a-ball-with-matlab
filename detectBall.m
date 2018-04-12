function [ balls, nCG, difference ] = detectBall( frame, background, conn, f, pix_min, nd )
%findBalls: detects and identifies the moving object
%   INPUTS:
%           frame: gray frame
%           background: background
%           conn: connectivity
%           f: contrast and adjust parameter
%           pix_min: minimum pixels
%           nd: disk's pixels
%
%   OUTPUTS:
%          balls: logical matrix with detected ball
%          nCG: number of objects detected
%          difference: substraction of frame and background

difference = imabsdiff(frame, background);
differenceMed = mean(mean(double(difference)));

dif = double(difference).^2-differenceMed^2;
difMed = mean(mean(dif));

bw = (dif>difMed*f);
bw = bwareaopen(bw, pix_min, conn);
SE = strel('disk', nd);
bw = imclose(bw, SE);
[balls, nCG] = bwlabeln(bw, conn);

med = 0;
for i=1:nCG
    m = mean(mean(dif(balls == i)));
    if m > med
        med = mean(mean(dif(balls == i)));
        balls = (balls == i);
    end
end

end
