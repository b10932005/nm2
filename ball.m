close all;
clc;clear;
format long;

a=-9.8;
r=-1;
t=0;
dt=5e-3;
dvy=0;
vy=5;
y=0;
axis([0 3 0 0.7])
hold on
for i = 1:600
    plot(t,y,'o','MarkerFaceColor','b','MarkerSize',8)
    M(i)=getframe;
    t=t+dt;
    y=y+vy*dt;
    dvy=a*dt+vy^2*r*sign(y)*dt;
    vy=vy+dvy;
    fprintf("%f %f %f %f\n",t,y,vy,dvy)
    if y+vy*dt<=0
        vy=(-vy+dvy)*0.7;
    end
end