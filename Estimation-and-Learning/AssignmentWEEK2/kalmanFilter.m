function [ predictx, predicty, state, param ] = kalmanFilter( t, x, y, state, param, previous_t )
%UNTITLED Summary of this function goes here
%   Four dimensional state: position_x, position_y, velocity_x, velocity_y

    %% Place parameters like covarainces, etc. here:
     
     dt = t - previous_t;
     A = [1 0 dt 0; 0 1 0 dt;0 0 1 0;0 0 0 1];
     C = [1 0 0 0; 0 1 0 0];
     sigmao = eye(2);
     sigmam = 0.01*eye(4);
     
    % Check if the first time running this function
    if previous_t<0
        state = [x, y, 0, 0];
        predictx = x;
        predicty = y;
        P = 3*eye(4);
        param.P = P;
        return;
    end
    
    P = A*param.P*A' + sigmam;
    R = C*P*C' + sigmao;
    K = P*C'/(R + C*P*C');
    
    %% TODO: Add Kalman filter updates
    % As an example, here is a Naive estimate without a Kalman filter
    % You should replace this code
    z = [x;y];
    state_t  = A*state' + K*(z - C*A*state');
    vx = state_t(3);
    vy = state_t(4);
    
    predictx = state_t(1) + vx*10*dt;
    predicty = state_t(2) + vy*10*dt;
    
    param.P = P - K*C*P;
    state = state_t';
    %state = [x y vx vy];
end
