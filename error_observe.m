function [e, J_e_rob, J_e_lmk] = error_observe (rob, lmk, y)

%description:
% inputs:
%   rob: robot pose (x, y, theta)
%   lmk: position of landmark (px, py)
%   y: measurement in polars (d,a)
% outputs:
%   e: estimation error
%   J_e_rob: Jacobian of error wrt. robot pose (2x3 mat)
%   J_e_lmk: Jacobian of error wrt. lmk position (2x2 mat)

%expected measurement
[h, J_h_rob J_h_lmk] = observe(rob, lmk);

%error
e = h - y; %it could also be written as y - h
J_e_h = eye(2); %identity
%J_e_y = -eye(2);

%we use the chain rule to find the other jacobians
J_e_rob = J_e_h * J_h_rob;
J_e_lmk = J_e_h * J_h_lmk;

end


