function [e, J_e_rob] = error_pose(rob, y)
% description:
%     function that mesures the error of the measure of the pose
% inputs:
%     rob: pose of the robot
%     y: measurement of the pose of the robot
% outputs:
%     e: estimation error
%     J_e_rob: Jacobian of e wrt. robot pose

e = rob - y;

        while e(3) > pi
            e(3) = e(3) - 2*pi;
        end
        while e(3) < -pi
            e(3) = e(3) + 2*pi;
        end

J_e_rob = eye(3);

end