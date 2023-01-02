%Shishir Khanal
%01/01/2022
%Optimization using if-else
%-----------------------------

clc;clear; close all;

%function
a1 = 10;
a2 = 30;
a3 = -5;
a4 = 8;
a5 = 13;
mymax(a1, a2, a3, a4, a5);

%multiple functions
x = 3;
[result1, result2] = multipleFunctions(x);

%Inline function
f = @(x) x^5 - 3*x;
f(2);
%g = f;
%g(2)
%gives the same result as f(2)

%function plot
fplot(@complex_func,[-10 10]);
%fplot('complex_func',[-10 10])
title("Function Plot")

%multiple function plot
ft = @(t) cos(3*t);
gt = @(t) sin(2*t);
%horizontal axis is ft and vertical axis is gt
%default t is between [-5, 5]
fplot(ft,gt);

%Integration using function between 0 to pi
xmin = 0;
xmax = pi;
f = @myIntegrand;
a = integral(f, xmin,xmax)

%----------------------------------------
%functions
function max = mymax(n1, n2, n3, n4, n5)
%return max of provided five numbers
    max = n1;
    if (n2 > max)
        max = n2;
    end
    if(n3 > max)
        max = n3;
    end
    if(n4 > max)
        max = n4;
    end
    if(n5 > max)
        max = n5;
    end
end

function[r1, r2] = multipleFunctions(x)
r1 = x^3 + x^4;
r2 = mySqr(x) + x^6;
end

function ret = mySqr(y)
ret = y^2;
end

function y = complex_func(x)
y=(x-cos(x)) ./ (2 + x.^2);
end

function y = myIntegrand(x)
y = sin(x).^3;
end