clear all, close all, clc

dx = .01;

a = 0.93;
mu = .5;

xp = dx:dx:2;
yp = a*xp + mu + 1;

xn = -2:dx:-dx;
yn = a*xn + mu - 1;

plot(xp,yp,'k',xn,yn,'k')
xlabel('xn')
ylabel('x(n+1)')