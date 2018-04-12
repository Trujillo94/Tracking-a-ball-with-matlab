function [ replay, detection, difference ] = makeVideo( mov, CG, vel, acc, nFrames, SFv, SFa )
%makeVideo:
%   INPUTS:
%           mov: structure with RGB and gray scale matrixes
%           CG: center of gravity structure
%           vel: velocity structure
%           acc: acceleration structure
%           nFrames:
%           SF: scale factor, increases or decreases velocity vector's size.
%   OUTPUTS:
%           replay: real video with CG, vel and acc
%           detection: video with the object moving in a logical matrix
%           difference: video with the substraccion of each image with the
%           background


% DIFFERENCE
figure
for i=1:nFrames
    imshow(mov(i).difference);
    difference(i) = getframe;
end

% DETECTION
figure
for i=1:nFrames
    imshow(mov(i).ball);
    detection(i) = getframe;
end

% REPLAY
for i=1:nFrames-2
    imshow(mov(i).rgb)
    hold on;
    if ~isempty(CG(i).x) && ~isempty(CG(i).y)
        plot(CG(i).x, CG(i).y, 'r+', 'MarkerSize', 20, 'LineWidth', 2);
        if ~isempty(vel(i).x) && ~isempty(vel(i).y)
            quiver(CG(i).x, CG(i).y, SFv*vel(i).x, SFv*vel(i).y, 'LineWidth', 1, 'Color', 'blue');
        end
        if ~isempty(acc(i).x) && ~isempty(acc(i).y)
            quiver(CG(i).x, CG(i).y, SFa*acc(i).x, SFa*acc(i).y, 'LineWidth', 1, 'Color', 'green');
        end
    end
    hold off
    replay(i) = getframe;
end

end

