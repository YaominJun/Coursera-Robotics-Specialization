function [rads1,rads2] = computeRrInverseKinematics(X,Y)

syms theta1 theta2 ;

eq1 = cos(theta1) + cos(theta1 + theta2) == X;
eq2 = sin(theta2) + sin(theta1 + theta2) == Y;

S = solve(eq1,eq2);

rads1 = double(S.theta1(1,1));
rads2 = double(S.theta2(1,1));
