function [c, J_c_p] = p2c(p)
%this function transform a point from polar coordinates to cartesians

%input:
%   p: point in polar coordinates
%output:
%   c: point in cartesian coordinates
%   J_c_p: jacobian of the transformation

d = p(1);
a = p(2);

x = d*cos(a);
y = d*sin(a);
c = [x,y];

J_c_p = [cos(a) -d*sin(a); sin(a) d*cos(a)];
       %[dx/dd    dx/da;   dy/dd    dy/da]

end       
       
%%
function f()
%%
syms a d real
p = [d; a];
[c,J_c_p] = p2c(p)

simplify(jacobian(c,p) - J_c_p)
end