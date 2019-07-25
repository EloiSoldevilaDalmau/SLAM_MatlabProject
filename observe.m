function [y, J_y_rob, J_y_lmk] = observe(rob, lmk)
%description:

%input:
%   rob: robot pose
%        position and orientation of robot in global coordinates (x, y, theta)
%   lmk: position of landmark (x,y)
%output:
%   y: measure in polar coordinates of the lmk (d, theta)

%1. we transform lmk to the robot system of reference
rob
lmk
[lmk_rob, J_lmkrob_rob, J_lmkrob_lmk] = toFrame2D(rob, lmk);
%2. we transform this result to polar coordinates
lmk_rob
[y,  J_y_lmkrob] = c2p(lmk_rob)
%3. to find the jacobians we apply the chain rule
J_y_rob = J_y_lmkrob * J_lmkrob_rob;

J_y_lmk = J_y_lmkrob * J_lmkrob_lmk;
end

% function f()
% %%
% syms x y th px py real
% r = [x;y;th];
% p = [px;py];
% 
% [yy, J_y_rob, J_y_lmk] = observe(r,p);
% simplify(jacobian(yy,r) - J_y_rob)
% simplify(jacobian(yy,p) - J_y_lmk)
% end
