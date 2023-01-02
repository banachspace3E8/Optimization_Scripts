%Shishir Khanal
%01/01/2022
%Constrained optimization using fmincon 
%Order of placing constraints in the fmincon fnction
% 1. Linear Inequality Constraints
% 2. Linear Equality Constraints
% 3. Lower Bounds
% 4. Upper Bounds
% 5. Nonlinear Constraints
%If certain constraints are not provided in the problem,
%they should be replaced with '[]'
%-----------------------------

clc;clear;close all;
warning off;

fun = @(x) -x(1)*x(2)*x(3);
x0 = [10 10 10]; %initial value

%Ax<=b
A = [-1 -2 -2; 1 2 2];
b = [0 72];
[xmin, fmin] = fmincon(fun, x0, A, b);
 

clc;clear;close all;
warning off;

fun = @(x) exp(x(1)) * (4*x(1)^2 + 2*x(2)^2 + 4*x(1)*x(2) + 2*x(2) + 1);
x0 = [-1, -1]; %initial value

%Ax<=b
A = [-1 -2 -2; 1 2 2];
b = [0 72];
%no linear constraints hence empty set
[xmin, fmin] = fmincon(fun, x0,[], [], [], [], [], [], @my_nonlin_const)

clc;clear close all;
warning off;
x0=[0,0];
[x, fval] = fmincon(@objfun, x0,[],[],[],[],[0; -Inf],[Inf; 0]);

clc;clear close all;
warning off;
x0=[0, 1, 2];
[x, fval] = fmincon(@myfunc_1, x0,[],[],[],[],[0; -Inf; -Inf],[Inf; Inf; 0],'constraint')

%-------------------------------------
%Functions
function f = objfun(x)
    f = x(1)^4 - x(1)^2 + x(2)^2 - 2 * x(1) + x(2);
end

function f = myfunc_1(x)
    f = x(1)^3 + x(2)^3 + x(3)^3;
end
