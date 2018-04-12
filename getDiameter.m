function [ diameter ] = getDiameter( body )
%getDiameter: returns the value of the diameter of the object in the frame
%we use the function REGIONPROPS and the value of 'MajorAxisLength'
%   INPUTS:
%           body: logical matrix of the frames
%   OUTPUTS:
%           diameter: value of the diameter of the object
if max(max(body))==0
    diameter = [];
else
    measurements = regionprops(body, 'MajorAxisLength');
    diameter =(measurements.MajorAxisLength);
end

end

