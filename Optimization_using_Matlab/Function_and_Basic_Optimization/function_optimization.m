%Shishir Khanal
%01/01/2022
%Optimization using fminbnd
%fminbnd can't be used to compute optimum of multivariable functions
%-----------------------------

clc; close all; clear;
f = @(x) x.^3 + 4*x;
%fplot(f)
axis([-3 3 -15 15])

x = -3:0.1:3;
plot(x, f(x))

%local minimum
%computes most minimum value among all critical points
[xmin, fmin] = fminbnd(f, -3, 3);

%-----------------------------

clc; close all; clear;

f = @(x) x.^2 +  4*sin(5*x);
%fplot(f)
axis([-3 3 -15 15])

x = -5:0.1:5;
plot(x, f(x))

%local minimum
%computes min value of critical point
[xmin1, fmin1] = fminbnd(f, -3.5, -2.5);

[xmin2, fmin2] = fminbnd(f, 3, 4.5);

%-----------------------------

clc; close all; clear;

f = @(x) x.^3 - 4*x;
%interval
x1 = -3;
x2 = 3;
%Display the iterations of optimization
options = optimset('Display', 'iter');
[xmin1, fmin1] = fminbnd(f, x1, x2, options);


%-----------------------------

clc; close all; clear;

y = @(x) humps(x);
x = -1:0.01:2;
plot(x,y(x))
xlabel('x')
ylabel('humps(x)')
grid on

%interval
x1 = 0.3;
x2 = 1;
%Display the iterations of optimization
options = optimset('Display', 'iter');
[xmin1, fmin1] = fminbnd(y, x1, x2, options);

