function [F, M] = controller(t, state, des_state, params)
%CONTROLLER  Controller for the quadrotor
%
%   state: The current state of the robot with the following fields:
%   state.pos = [x; y; z], state.vel = [x_dot; y_dot; z_dot],
%   state.rot = [phi; theta; psi], state.omega = [p; q; r]
%
%   des_state: The desired states are:
%   des_state.pos = [x; y; z], des_state.vel = [x_dot; y_dot; z_dot],
%   des_state.acc = [x_ddot; y_ddot; z_ddot], des_state.yaw,
%   des_state.yawdot
%
%   params: robot parameters

%   Using these current and desired states, you have to compute the desired
%   controls


% =================== Your code goes here ===================

F = 0;
M = zeros(3,1);

% Kpphi = 90;
% Kdpsi = 8;
% 
% Kptheta = 90;
% Kdtheta = 8;
% 
% Kppsi = 90;
% Kdpsi = 8;
% 
% Kp1 = 2;
% Kd1 = 8;
% 
% Kp2 = 5;
% Kd2 = 12;
% 
% Kp3 = 25;
% Kd3 = 10;

Kpphi = 150;
Kdpsi = 2;

Kptheta = 150;
Kdtheta = 2;

Kppsi = 150;
Kdpsi = 2;

Kp1 = 32;
Kd1 = 2.4;

Kp2 = 32;
Kd2 = 3.2;

Kp3 = 800;
Kd3 = 50;


des_state_acc_x = (des_state.acc(1)) + Kd1 * (des_state.vel(1) - state.vel(1)) + Kp1 * (des_state.pos(1) - state.pos(1));
des_state_acc_y = (des_state.acc(2)) + Kd2 * (des_state.vel(2) - state.vel(2)) + Kp2 * (des_state.pos(2) - state.pos(2));
%Thrust
F = params.mass * (params.gravity + (des_state.acc(3)) + Kd3 * (des_state.vel(3) - state.vel(3)) + Kp3 * (des_state.pos(3) - state.pos(3)));

des_state_phi = ((des_state_acc_x*sin(des_state.yaw)) - (des_state_acc_y*cos(des_state.yaw)))/params.gravity;
des_state_theta = ((des_state_acc_x*cos(des_state.yaw)) + (des_state_acc_y*sin(des_state.yaw)))/params.gravity;
% Moment

M(1) = Kpphi*(des_state_phi - state.rot(1)) + Kdpsi*(0 - state.omega(1));
M(2) = Kptheta*(des_state_theta - state.rot(2)) + Kdtheta*(0 - state.omega(2));
M(3) = Kppsi*(des_state.yaw - state.rot(3)) + Kdpsi*(des_state.yawdot - state.omega(3));

% =================== Your code ends here ===================

end
