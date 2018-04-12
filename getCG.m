function [ centroids ] = getCG( body )
%getCG: returns the position the gravity center of the object
%we use the function REGIONPROPS and the value of 'Centroids'
%   INPUTS:
%           body: logical matrix of the frames
%   OUTPUTS:
%           centroids: position of the center of gravity of the object
if max(max(body))==0
    centroids = [];
else
    measurements = regionprops(body, 'Centroid');
    centroids = cat(3,measurements.Centroid);
end

end

