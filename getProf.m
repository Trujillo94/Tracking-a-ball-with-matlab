function [ X ] = getProf (dfocus,x0,Dimball,diameter,dim0)
%getProf: returns the value of distance from camera to obejct
%we use the relation that exists between two similars triangles, one is the
%triangle with base the real diameter of object and height the distance; and
%the other is the triangle with base the distance in pixels of object and
%height the focus distance which is known in each camera.
%We need to know in a specific distance the diameter in pixels to calculate
%the px2m coeficient alpha
%   INPUTS:
%           dfocus: focus distance
%           x0: specific distance
%           Dimball: diameter in meters of object
%           diameter: diameter in pixels of the object in the frame
%           dim0: diameter in pixels at the specific distance x0
%   OUTPUTS:
%           X: distance from object to camera in meters
alpha=Dimball*dfocus/(x0*dim0); % meters/pixels
if ~isempty(diameter)
X=dfocus*Dimball/(diameter*alpha);
else
    X=[];
end
end