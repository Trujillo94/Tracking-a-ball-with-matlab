function [ mov, CG, vel, acc, FPS, replay, detection, difference ] = studyOfMovement( video, back_f1, back_f2, back_fb, nb, nd, conn, pix_min, f, flag, dimBall, dfocus, z0, framedim0, SFv, SFa )
%studyOfMovement: gets the position, velocity and acceleration of a ball
%from a video file recorded with a fixed camera. The detection of this is
%based in frame substraction (a common background is susbtracted from each
%frame and then treated), so just detect moving objects of diferent
%color from background

%   INPUTS:
%           video: VideoReader file.
%           back_f1: frame index 1 (used in getBackground)
%           back_f2: frame index 2 (used in getBackground)
%           back_fb: index of the filling frame (used in getBackground)
%           nb: pixels of the structured element for dilate background
%           (used in getBackground)
%           nd: pixels of the structured element used to close ball's image
%           (used in detectBall)
%           conn: connectivity parameter (used in geTBackground and
%           detectBall)
%           pix_min: ball's minimum number of pixels  to be identified
%           (used in detectBall)
%           f: saturation parameter (used in detectBall)
%           flag: 0 for 3D case, 1 for 2D case
%           dimBall: Real diameter of the ball (used in
%           dfocus: focus distance
%           z0: distance of known distance frame (used in getProf, 3D)
%           dim0:
%           SFv: scale factor of the velocity (makeVideo)
%           SFa: scale factor of the acceleration (makeVideo)
%
%   OUPUTS:
%           mov: movie structure with fields:
%                 rgb: RGB frames
%                 gray: gray frames
%                 ball: logical matrix with the identified ball
%                 nCG: number of objects
%                 difference: substraction of frame and background
%           CG: gravity center struct with field:
%                 x: x coordinate of the gravity center
%                 y: y coordinate of the gravity center
%                 diameter: diameter detected
%           vel: velocity struct with fields:
%                 x: x component of the velocity
%                 y: y component of the velocity
%                 mag: magnitude of the velocity vector

%           acc: velocity struct with fields:
%                 x: x component of the acceleration
%                 y: y component of the acceleration
%                 mag: magnitude of the acceleration vector
%           FPS: frames per second
%           replay: movie with the CG, velocity and acceleration detected
%           detection: ball's logical matrix
%           difference: matrix susbtraction of ball and background


FPS = video.FrameRate;
timeFrame = 1/FPS;
[ mov, nFrames] = getStructure(video);

background = getBackground(mov, back_f1, back_f2, back_fb, nb);
figure, imshow(background);

for i=1:nFrames
    [ mov(i).ball, mov(i).nCG, mov(i).difference ] = detectBall( mov(i).gray, background, conn, f, pix_min, nd );
    pos = getCG(mov(i).ball);
    CG(i).diameter = getDiameter(mov(i).ball);
    if isempty(pos)
        CG(i).x = [];
        CG(i).y = [];
        if flag == 0
            CG(i).z=[];
        end
    else
        CG(i).x = pos(1);
        CG(i).y = pos(2);
    end
end
switch flag
    case 0
        dim0=CG(framedim0).diameter;
        for i=1:nFrames
            CG(i).z = getProf(dfocus, z0, dimBall, CG(i).diameter,dim0);
            px2m = dimBall/(z0*dim0);
        end
    case 1
        px2m = getpx2m( CG, dimBall ); %m(real)/pixel
end

vel = getVel(CG, px2m, timeFrame, nFrames,flag );
acc = getAcc( vel, timeFrame, nFrames,flag );

[ replay, detection, difference ] = makeVideo( mov, CG, vel, acc, nFrames, SFv, SFa );

end

