%Shishir Khanal
%01/01/2022
%Optimization using fminunc
%fminunc finds min of unconstrained multivariable function using
%gradient-based method
%can handle both continuous and discontinuous functions
%uses 'quasi-newton'(default) or 'trust-region' algorithms
%-----------------------------

clc;clear;close all;

fun = @(x) 3*x(1)^2 + 2*x(1)*x(2) + x(2)^2 - 4*x(1) + 5*x(2);
x0 = [1, 1];
[x, fval] = fminunc(fun, x0)

%Rosenbrock function optimization
clc;clear;close all;
x0 = [-1,2];
tic
fnc = @rosenbrock_func_with_grad;
%Quasi-Newton
[xmin, fmin] = fminunc(fnc, x0)
%Converges slower
toc

options = optimoptions('fminunc', 'Algorithm','trust-region','SpecifyObjectiveGradient',true);
tic
%Trust-region
fnc = @rosenbrock_func_with_grad;
%Converges faster
[xmin,fmin] = fminunc(fnc, x0, options)
toc

clc;clear;close all;
%Exponential Function
fun = @(x) x(1)*exp(-(x(1)^2 + x(2)^2)) + (x(1)^2 + x(2)^2)/20;
%fun = @(x,y) x*exp(-(x^2 + y^2)) + (x^2 + y^2)/20;
options = optimoptions(@fminunc,'Display','iter','Algorithm','quasi-newton');
x0 = [1,2];
[x, fval, exitflag, output] = fminunc(fun,x0, options);


clc;clear;close all;
options = optimoptions(@fminunc,'Algorithm','quasi-newton');
x0 = [-1,1]; %Starting guess
[x, fval, exitflag, output] = fminunc(@objfun,x0,options)


%-----------------------------
%functions
function [f, g] = rosenbrock_func_with_grad(x)
%fminunc converges faster if gradient information is provided
%this function can be implemented as both:
% [f, g] = rosenbrock_func_with_grad(x)
% f = rosenbrock_func_with_grad(x)
f = (1 - x(1)).^2 + 100.*(x(2) - x(1).^2).^2;

if nargout > 1
    %compute this if g is requested in the function request line
    g = [-400*(x(2) - x(1)^2)*x(1) - 2*(1 - x(1)); 200*(x(2) - x(1)^2)];
end
end

function f = objfun(x)
    f = exp(x(1)) * (4*x(1)^2 + 2*x(2)^2 + 4*x(1)*x(2) + 2*x(2) + 1);
end
