function [endeff] = computeMiniForwardKinematics(rads1,rads2)

alpha = pi + (rads1 + rads2)/2;
beta = (rads1-rads2)/2;
l1 = 1;
l2 = 2;
r = sqrt(l2^2 - (l1*sin(beta))^2) - l1*cos(beta);
endeff = [r*cos(alpha),r*sin(alpha)];