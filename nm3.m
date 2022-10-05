clear;
close all;
clc;

%{
 axis([-5 5 -5 5])
syms x, y;
hold on;
%}

%{
 for i=1:2:10
    fplot(sin(x)-taylor(sin(x),x,'Order',i))
end
%}

%{
 for i = 1:5
    fplot(taylor(sin(x), x, 'Order', i))
end
%}

[x, y] = meshgrid(-10:0.5:10);
z = log(exp(x + 1i .* y));
figure;
surf(x, y, abs(z))
