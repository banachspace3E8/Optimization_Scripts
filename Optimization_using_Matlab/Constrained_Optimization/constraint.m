function [c, ceq] = constraint(x)
%constraint Specification of nonlinear and linear constraints
%   x^2 + y^2 <= 1
% if equality constraints are provided, specify in ceq
c = 2*x(3)^2 - x(2)^2;
ceq = x(1)^2 + x(2)^2 + x(3)^2 - 1;
end

