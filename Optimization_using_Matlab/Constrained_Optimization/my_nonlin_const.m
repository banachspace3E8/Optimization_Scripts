function [c, ceq] = my_nonlin_const(x)
%my_nonlin_const Specification of nonlinear constraints
%   x1x2 - x1 - x2 + 1.5 <= 0
%   -x1x2 - 10 <= 0
% if equality constraints are provided, specify in ceq
    c = [x(1)*x(2) - x(1) - x(2) + 1.5, -x(1)*x(2) - 10];
    ceq = [];
end