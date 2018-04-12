function [ px2m ] = getpx2m( CG, Dimball )
%getpx2m: returns the coeficient of meters/pixel
%we use divide the diameter in meters of the real object by
%the pixels of the maximum diameter in the image( we use maximimun because
%sometimes it doesn't detect que total ball, so we unse the maximum)
%   INPUTS:
%           CG: structure that contains the array of the diameters of each
%           image
%           Dimball: value of the diameter of the real object in meters
%   OUTPUTS:
%           px2m: value of the coeficient m/px
%diamax = max([CG.diameter]);
diamean=mean([CG.diameter]);
px2m = Dimball/diamean;

end

