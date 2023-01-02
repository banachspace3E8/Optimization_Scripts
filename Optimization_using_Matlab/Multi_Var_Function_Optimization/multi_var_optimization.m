%Shishir Khanal
%01/01/2022
%Optimization using fminsearch
%fminsearch finds min of unconstrained multivariable function using
%derivative-free method
%can handle both continuous and discontinuous functions
%-----------------------------

clc;clear;close all;
 
[x,y] = meshgrid(-2:0.1:2 -1:0.1:3);
f = (1 - x).^2 + 100 .* (y - x.^2).^2;

mesh(x,y,f);
xlabel('x')
ylabel('y')
zlabel('f(x,y)')

%Function of two variables
%By looking at the plot, it is known that the function has minimum near (-1.2, 1)
[x, fval] = fminsearch(@rosenbrock_func, [-1.2;1]);

v = [-0.6, -1.2, 0.135];
a = fminsearch(@three_var, v);


%piecewise continuous function
clc;clear;close all;
x = 0.01:0.01:5;
fx_array = zeros(1, length(x));

for indx = 1:length(x)
    fx_array(1, indx) = fnc(x(1, indx));
end

plot(x, fx_array)
xlabel('x')
ylabel('f(x)')

x = 3.06;
[min, fmin] = fminsearch(@fnc, x)


%-----------------------------
%functions
function f = rosenbrock_func(x)

f = (1 - x(1)).^2 + 100.*(x(2) - x(1).^2).^2;
end

function b = three_var(v)
x = v(1);
y = v(2);
z = v(3);
b = x.^2 + 2.5*sin(y) - z^2 * x^2 * y^2;
end

%piecewise continuous function
function f = fnc(x)

if(x > 0 && x <= 4)
    f = 0.5 * log(x) - (0.02 * x.^2) + 1/(1 + x).^(5/3);
elseif (x > 4)
    f = 0.5 * log(x) - (0.02 * x.^2) + ((1/(1 + x).^(5/3)) + 1); 
end

end

