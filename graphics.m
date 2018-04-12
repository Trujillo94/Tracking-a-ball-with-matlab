function [ ] = graphics( CG, vel, acc, nFrames, flag, SFv, SFa,SFp )
%Makes the graphics of CG, vel and acc in 2D and 3D
%   INPUTS:
%           mov: structure with RGB and gray scale matrixes
%           CG: center of gravity structure
%           vel: velocity structure
%           acc: acceleration structure
%           nFrames: numer of Frames
%           SFv: scale factor, increases or decreases velocity vector's size.
%           SFa: scale factor, increases or decreases acceleration vector's size.
%           SFp: scale factor, increases or decreases position's size.


switch flag
    case 0
        % POSITION
        figure, hold on
        for i=1:nFrames
            if ~isempty(CG(i).x)
                scatter3(CG(i).x, -CG(i).y, CG(i).z,'MarkerFaceColor', 'r');
            end
        end
        title('Position');
        xlabel('X-CG');
        ylabel('Y-CG');
        grid, hold off
        view(-86, 20);
        % VELOCITY
        figure, hold on
        for i=2:nFrames-2
            if ~isempty(vel(i).x)
                quiver3(CG(i).x,-CG(i).y, CG(i).z*SFp, SFv*vel(i).x, -SFv*vel(i).y,SFv*vel(i).z,'b', 'MarkerSize',50);
            end
        end
        title('Velocity');
        xlabel('X-Velocity');
        ylabel('Y-Velocity');
        zlabel('Z-Velocity');
        grid, hold off
        view(0, 0);
        % ACCELERATION
        figure, hold on
        for i=3:nFrames-3
            if ~isempty(acc(i).x)
                quiver3(CG(i).x, -CG(i).y, CG(i).z*SFp, SFa*acc(1,i).x, -SFa*acc(1,i).y ,SFa*acc(1,i).z, 'g', 'MarkerSize', 10 );
            end
        end
        title('Acceleration');
        xlabel('X-Accelerations');
        ylabel('Y-Acceleration');
        zlabel('Z-Acceleration');
        grid, hold off
        view(0, 0);
        %CG, VEL AND ACC ALL IN ONE
        figure, hold on
        for i=3:nFrames-3
            if ~isempty(CG(i).x)
                scatter3(CG(i).x, -CG(i).y,CG(i).z*SFp,'MarkerFaceColor', 'r');
                quiver3(CG(i).x,-CG(i).y, CG(i).z*SFp, SFv*vel(i).x, -SFv*vel(i).y ,SFv*vel(i).z,'b', 'MarkerSize',50);
                quiver3(CG(i).x,-CG(i).y, CG(i).z*SFp, SFa*acc(i).x, -SFa*acc(i).y ,SFa*acc(i).z, 'g', 'MarkerSize', 10);
                title('Position, Velocity and Acceleration');
            end
        end
        title('Total');
        xlabel('X');
        ylabel('Y');
        zlabel('Z');
        grid, hold off
        view(-86, 20);
    case 1
        % POSITION
        figure, hold on
        for i=1:nFrames
           if ~isempty(CG(i).x )
                plot(CG(i).x, -CG(i).y, '.-r', 'MarkerSize', 10);
            end
        end
        title('Position');
        xlabel('X-CG');
        ylabel('Y-CG');
        
        grid, hold off
        
        % VELOCITY
        figure, hold on
        for i=1:nFrames-2
            if ~isempty(vel(i).x)
                quiver(CG(i).x, -CG(i).y, SFv*vel(i).x, -SFv*vel(i).y ,'b', 'MarkerSize',50,'MaxHeadSize', 5);
            end
        end
        title('Velocity');
        xlabel('X-Velocity');
        ylabel('Y-Velocity');
        grid, hold off
        
        % ACCELERATION
        figure, hold on
        for i=1:nFrames-2
            if ~isempty(acc(i).x)
                quiver(CG(i).x, -CG(i).y, SFa*acc(1,i).x, -SFa*acc(1,i).y , 'g', 'MarkerSize', 10,'MaxHeadSize', 5);
            end
        end
        title('Acceleration');
        xlabel('X-Accelerations');
        ylabel('Y-Acceleration');
        grid, hold off
        
        %CG, VEL AND ACC ALL IN ONE
        figure, hold on
        for i=1:nFrames-2
            if ~isempty(acc(i).y)
                plot(CG(i).x, -CG(i).y, '.-r', 'MarkerSize', 10);
                quiver(CG(i).x,-CG(i).y, SFv*vel(i).x, -SFv*vel(i).y ,'b', 'MarkerSize',50,'MaxHeadSize', 5);
                quiver(CG(i).x,-CG(i).y, SFa*acc(1,i).x, -SFa*acc(1,i).y , 'g', 'MarkerSize', 10,'MaxHeadSize', 5);
                title('Position, Velocity and Acceleration');
            end
        end
        grid, hold off
end

end

