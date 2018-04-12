%   ASSIGNMENT 2 - STUDY OF MOVEMENT: GET PATH, VELOCITY AND ACCELERATION

% Eric López: ericlopen@gmail.com
% Oriol Trujillo: trujillo.oriol@gmail.com

clear
close all

dfocus = 0.035; %Focal distance in m

%VIDEO 3
video3 = VideoReader('bola2.mov');
[ mov3, CG3, vel3, acc3, FPS3, replay3, detection3, difference3 ] = studyOfMovement( video3, 1, floor(video3.NumberOfFrames/2),video3.NumberOfFrames, 20, 10, 26, 500, 25, 1, 0.065, dfocus, 1, 1, 100, 20 );

implay(difference3, FPS3);
implay(detection3, FPS3);
implay(replay3, FPS3);

writeReport('Video3REPORT',vel3,acc3,1);
exportVideo(replay3,video3.NumberOfFrames,video3.Width,'Video3Replay');

graphics(CG3, vel3, acc3, video3.NumberOfFrames, 1, 40, 10,1);


% VIDEO2
video2 = VideoReader('VideoGrav3.4.mov');
[ mov2, CG2, vel2, acc2, FPS2, replay2, detection2, difference2 ] = studyOfMovement( video2, 2, video2.NumberOfFrames, 2, 20, 20, 26, 222, 370, 1, 0.065, dfocus, 1, 1, 100, 20 );

implay(difference2, FPS2);
implay(detection2, FPS2);
implay(replay2, FPS2);

writeReport('Video2REPORT',vel2,acc2,1);

graphics(CG2, vel2, acc2, video2.NumberOfFrames, 1, 50, 10,1);

g = 9.81; %m/s2
vy = @(t) g*t;
fi = 13;
fe = 30;
figure
hold on
for i=fi:fe
    t = (i-fi)/FPS2;
    plot(t, vy(t), '.b', 'MarkerSize', 10);
    if ~isempty(vel2(i).y)
        plot(t, vel2(i).y, '.r', 'MarkerSize', 10);
    end
end
grid, hold off


% VIDEO 1
video1 = VideoReader('VideoEx1.mov');
[ mov1, CG1, vel1, acc1, FPS1, replay1, detection1, difference1] = studyOfMovement( video1, 1, video1.NumberOfFrames, floor(video1.NumberOfFrames/2), 20, 1, 26, 200, 100, 1, 1, 0.065, dfocus, 1, 5, 0.6 );

implay(difference1, FPS1);
implay(detection1, FPS1);
implay(replay1, FPS1);

writeReport('Video1REPORT',vel1,acc1,1);


graphics(CG1, vel1, acc1, video1.NumberOfFrames, 1, 1, 0.3,1)

%VIDEO 4
video4 = VideoReader('VideoProf11.mov');
[ mov4, CG4, vel4, acc4, FPS4, replay4, detection4, difference4 ] = studyOfMovement( video4, 1, floor(video4.NumberOfFrames/2),video4.NumberOfFrames, 20, 100, 26, 500, 70, 0, 0.065, dfocus, 1.75, 1, 100, 20 );

implay(difference4, FPS4);
implay(detection4, FPS4);
implay(replay4, FPS4);
writeReport('Video4REPORT',vel4,acc4,1);



graphics(CG4, vel4, acc4, video4.NumberOfFrames, 0, 8, 2,500);
