function [e, J_e_rob1, J_e_rob2] = error_move(rob1,rob2,d_rob_meas)
%description:
%inputs:
%   rob1: pose i of the robot (x,y, theta)
%   rob2: pose i+1 of the robot (x,y,theta)
%   d_rob_meas: robot motion measurement between t=i and t=i+1
%outputs:
%   e: error between measurement and expectation 
%   J_e_rob1: Jacobian of error wrt. robot pose 1(2x3 mat)
%   J_e_rob2: Jacobian of error wrt. robot pose 2 (2x3 mat)

%expected measurement:
[d_rob_exp, J_drobexp_rob1, J_drobexp_rob2] = betweenFrames2D(rob1, rob2);

%expectation error:
e = d_rob_exp - d_rob_meas;
J_e_drobexp = eye(3);

%chain rule to find the other jacobians:
J_e_rob1 = J_e_drobexp * J_drobexp_rob1;
J_e_rob2 = J_e_drobexp * J_drobexp_rob2;

end