function [ ] = exportVideo( video, nFrames, width, name )
%exportVideo: write a video file from a structure containing all RGB frames
%in the 'cdata' field.

name = sprintf('%s.avi', name);
writerObj = VideoWriter(name);
open(writerObj);
for i=1:nFrames-2
    frame = video(i).cdata;
    frame(:,width+2, :) = 0;
    writeVideo(writerObj, frame);
end
close(writerObj);

end

