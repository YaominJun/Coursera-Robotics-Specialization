function [ desired_state ] = traj_generator(t, state, waypoints)
% TRAJ_GENERATOR: Generate the trajectory passing through all
% positions listed in the waypoints list
%
% NOTE: This function would be called with variable number of input arguments.
% During initialization, it will be called with arguments
% trajectory_generator([], [], waypoints) and later, while testing, it will be
% called with only t and state as arguments, so your code should be able to
% handle that. This can be done by checking the number of arguments to the
% function using the "nargin" variable, check the MATLAB documentation for more
% information.
%
% t,state: time and current state (same variable as "state" in controller)
% that you may use for computing desired_state
%
% waypoints: The 3xP matrix listing all the points you much visited in order
% along the generated trajectory
%
% desired_state: Contains all the information that is passed to the
% controller for generating inputs for the quadrotor
%
% It is suggested to use "persistent" variables to store the waypoints during
% the initialization call of trajectory_generator.


%% Example code:
% Note that this is an example of naive trajectory generator that simply moves
% the quadrotor along a stright line between each pair of consecutive waypoints
% using a constant velocity of 0.5 m/s. Note that this is only a sample, and you
% should write your own trajectory generator for the submission.


persistent traj_time constants_final T

if nargin > 2
    x_constants = sym('alphax',[1,32]);
    y_constants = sym('alphay',[1,32]);
    z_constants = sym('alphaz',[1,32]);
    
    T = 1.0;
    traj_time = [0,1.0,2.0,3.0,4.0];
    constants_final = zeros(32,3);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %X position
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    j = 1;
    for i = 1:1:8     
    t_index = j;
    w_no = i - j + 1;
    t = traj_time(w_no);
    eqn(i) = x_constants(8*(t_index-1) + 1) + x_constants(8*(t_index-1) + 2)*((t - traj_time(t_index))/T) + x_constants(8*(t_index-1) + 3)*((t - traj_time(t_index))/T)^2 + x_constants(8*(t_index-1) + 4)*((t - traj_time(t_index))/T)^3 + x_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/T)^4 + x_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/T)^5 + x_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/T)^6 + x_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/T)^7 == waypoints(1,w_no);
    if(~mod(i,2))
        j = j + 1;
    end
    end
    
    for i=9:1:10
    if(i == 9)
        t = traj_time(1);
        t_index = 1;
    else
        t = traj_time(5);
        t_index = 4;
    end
    eqn(i) = x_constants(8*(t_index-1) + 2)*(1/T) + 2*x_constants(8*(t_index-1) + 3)*((t - traj_time(t_index))/(T*T)) + 3*x_constants(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T))^2 + 4*x_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T))^3 + 5*x_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T))^4 + 6*x_constants(8*(t_index-1) +  7)*((t - traj_time(t_index))/(T*T))^5 + 7*x_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T))^6 == 0;
    end
    
    for i=11:1:12
    if(i == 11)
        t = traj_time(1);
        t_index = 1;
    else
        t = traj_time(5);
        t_index = 4;
    end
    eqn(i) = 2*x_constants(8*(t_index-1) + 3)*(1/(T*T)) + 6*x_constants(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T*T)) + 12*x_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T*T))^2 + 20*x_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T))^3 + 30*x_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T))^4 + 42*x_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T))^5 == 0;
    end
    
    for i=13:1:14
    if(i == 13)
        t = traj_time(1);
        t_index = 1;
    else
        t = traj_time(5);
        t_index = 4;
    end
    eqn(i) = 6*x_constants(8*(t_index-1) + 4)*(1/(T*T*T)) + 24*x_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T*T*T)) + 60*x_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T*T))^2 + 120*x_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T*T))^3 + 210*x_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T*T))^4 == 0;
    end
    
    t_index = 1;
    for i=15:1:17
    t = traj_time(t_index + 1);
    eqn(i) = x_constants(8*(t_index-1) + 2)*(1/T) + 2*x_constants(8*(t_index-1) + 3)*((t - traj_time(t_index))/(T*T)) + 3*x_constants(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T))^2 + 4*x_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T))^3 + 5*x_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T))^4 + 6*x_constants(8*(t_index-1) +  7)*((t - traj_time(t_index))/(T*T))^5 + 7*x_constants(8*(t_index - 1) + 8)*((t - traj_time(t_index))/(T*T))^6 == x_constants(8*(t_index) + 2)*(1/T) + 2*x_constants(8*(t_index) + 3)*((t - traj_time(t_index + 1))/(T*T)) + 3*x_constants(8*(t_index) + 4)*((t - traj_time(t_index + 1))/(T*T))^2 + 4*x_constants(8*(t_index) + 5)*((t - traj_time(t_index + 1))/(T*T))^3 + 5*x_constants(8*(t_index) + 6)*((t - traj_time(t_index + 1))/(T*T))^4 + 6*x_constants(8*(t_index) +  7)*((t - traj_time(t_index + 1))/(T*T))^5 + 7*x_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T))^6;
    t_index = t_index + 1;
    end
    
    t_index = 1;
    for i=18:1:20
    t = traj_time(t_index + 1);
    eqn(i) = 2*x_constants(8*(t_index-1) + 3)*(1/(T*T)) + 6*x_constants(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T*T)) + 12*x_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T*T))^2 + 20*x_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T))^3 + 30*x_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T))^4 + 42*x_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T))^5 == 2*x_constants(8*(t_index) + 3)*(1/(T*T)) + 6*x_constants(8*(t_index) + 4)*((t - traj_time(t_index + 1))/(T*T*T)) + 12*x_constants(8*(t_index) + 5)*((t - traj_time(t_index + 1))/(T*T*T))^2 + 20*x_constants(8*(t_index) + 6)*((t - traj_time(t_index + 1))/(T*T*T))^3 + 30*x_constants(8*(t_index) + 7)*((t - traj_time(t_index + 1))/(T*T*T))^4 + 42*x_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T*T))^5;
    t_index = t_index + 1;
    end
    
    t_index = 1;
    for i=21:1:23
    t = traj_time(t_index + 1);
    eqn(i) = 6*x_constants(8*(t_index-1) + 4)*(1/(T*T*T)) + 24*x_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T*T*T)) + 60*x_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T*T))^2 + 120*x_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T*T))^3 + 210*x_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T*T))^4 == 6*x_constants(8*(t_index) + 4)*(1/(T*T*T)) + 24*x_constants(8*(t_index) + 5)*((t - traj_time(t_index + 1))/(T*T*T*T)) + 60*x_constants(8*(t_index) + 6)*((t - traj_time(t_index + 1))/(T*T*T*T))^2 + 120*x_constants(8*(t_index) + 7)*((t - traj_time(t_index + 1))/(T*T*T*T))^3 + 210*x_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T*T*T))^4;
    t_index = t_index + 1;
    end
    
    t_index = 1;
    for i=24:1:26
    t = traj_time(t_index + 1);
    eqn(i) = 24*x_constants(8*(t_index-1) + 5)*(1/(T*T*T*T)) + 120*x_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T*T*T)) + 360*x_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T*T*T))^2 + 840*x_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T*T*T))^3 == 24*x_constants(8*(t_index) + 5)*(1/(T*T*T*T)) + 120*x_constants(8*(t_index) + 6)*((t - traj_time(t_index + 1))/(T*T*T*T*T)) + 360*x_constants(8*(t_index) + 7)*((t - traj_time(t_index + 1))/(T*T*T*T*T))^2 + 840*x_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T*T*T*T))^3;
    t_index = t_index + 1;
    end
    
    t_index = 1;
    for i=27:1:29
    t = traj_time(t_index + 1);
    eqn(i) = 120*x_constants(8*(t_index-1) + 6)*(1/(T*T*T*T*T)) + 720*x_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T*T*T*T)) + 2520*x_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T*T*T*T))^2 == 120*x_constants(8*(t_index) + 6)*(1/(T*T*T*T*T*T)) + 720*x_constants(8*(t_index) + 7)*((t - traj_time(t_index + 1))/(T*T*T*T*T*T)) + 2520*x_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T*T*T*T*T))^2;
    t_index = t_index + 1;
    end
    
    t_index = 1;
    for i=30:1:32
    t = traj_time(t_index + 1);
    eqn(i) = 720*x_constants(8*(t_index-1) + 7)*(1/(T*T*T*T*T*T)) + 5040*x_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T*T*T*T*T)) == 720*x_constants(8*(t_index) + 7)*(1/(T*T*T*T*T*T*T)) + 5040*x_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T*T*T*T*T*T));
    t_index = t_index + 1;
    end
    
    [A,B] = equationsToMatrix(eqn,x_constants);
    constants_x = A\B;
    digits(5);
    constants_x = vpa(constants_x);
   
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Y position
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    j = 1;
    for i = 1:1:8     
    t_index = j;
    w_no = i - j + 1;
    t = traj_time(w_no);
    eqn(i) = y_constants(8*(t_index-1) + 1) + y_constants(8*(t_index-1) + 2)*((t - traj_time(t_index))/T) + y_constants(8*(t_index-1) + 3)*((t - traj_time(t_index))/T)^2 + y_constants(8*(t_index-1) + 4)*((t - traj_time(t_index))/T)^3 + y_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/T)^4 + y_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/T)^5 + y_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/T)^6 + y_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/T)^7 == waypoints(2,w_no);
    if(~mod(i,2))
        j = j + 1;
    end
    end
    
    for i=9:1:10
    if(i == 9)
        t = traj_time(1);
        t_index = 1;
    else
        t = traj_time(5);
        t_index = 4;
    end
    eqn(i) = y_constants(8*(t_index-1) + 2)*(1/T) + 2*y_constants(8*(t_index-1) + 3)*((t - traj_time(t_index))/(T*T)) + 3*y_constants(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T))^2 + 4*y_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T))^3 + 5*y_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T))^4 + 6*y_constants(8*(t_index-1) +  7)*((t - traj_time(t_index))/(T*T))^5 + 7*y_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T))^6 == 0;
    end
    
    for i=11:1:12
    if(i == 11)
        t = traj_time(1);
        t_index = 1;
    else
        t = traj_time(5);
        t_index = 4;
    end
    eqn(i) = 2*y_constants(8*(t_index-1) + 3)*(1/(T*T)) + 6*y_constants(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T*T)) + 12*y_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T*T))^2 + 20*y_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T))^3 + 30*y_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T))^4 + 42*y_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T))^5 == 0;
    end
    
    for i=13:1:14
    if(i == 13)
        t = traj_time(1);
        t_index = 1;
    else
        t = traj_time(5);
        t_index = 4;
    end
    eqn(i) = 6*y_constants(8*(t_index-1) + 4)*(1/(T*T*T)) + 24*y_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T*T*T)) + 60*y_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T*T))^2 + 120*y_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T*T))^3 + 210*y_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T*T))^4 == 0;
    end
    
    t_index = 1;
    for i=15:1:17
    t = traj_time(t_index + 1);
    eqn(i) = y_constants(8*(t_index-1) + 2)*(1/T) + 2*y_constants(8*(t_index-1) + 3)*((t - traj_time(t_index))/(T*T)) + 3*y_constants(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T))^2 + 4*y_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T))^3 + 5*y_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T))^4 + 6*y_constants(8*(t_index-1) +  7)*((t - traj_time(t_index))/(T*T))^5 + 7*y_constants(8*(t_index - 1) + 8)*((t - traj_time(t_index))/(T*T))^6 == y_constants(8*(t_index) + 2)*(1/T) + 2*y_constants(8*(t_index) + 3)*((t - traj_time(t_index + 1))/(T*T)) + 3*y_constants(8*(t_index) + 4)*((t - traj_time(t_index + 1))/(T*T))^2 + 4*y_constants(8*(t_index) + 5)*((t - traj_time(t_index + 1))/(T*T))^3 + 5*y_constants(8*(t_index) + 6)*((t - traj_time(t_index + 1))/(T*T))^4 + 6*y_constants(8*(t_index) +  7)*((t - traj_time(t_index + 1))/(T*T))^5 + 7*y_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T))^6;
    t_index = t_index + 1;
    end
    
    t_index = 1;
    for i=18:1:20
    t = traj_time(t_index + 1);
    eqn(i) = 2*y_constants(8*(t_index-1) + 3)*(1/(T*T)) + 6*y_constants(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T*T)) + 12*y_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T*T))^2 + 20*y_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T))^3 + 30*y_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T))^4 + 42*y_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T))^5 == 2*y_constants(8*(t_index) + 3)*(1/(T*T)) + 6*y_constants(8*(t_index) + 4)*((t - traj_time(t_index + 1))/(T*T*T)) + 12*y_constants(8*(t_index) + 5)*((t - traj_time(t_index + 1))/(T*T*T))^2 + 20*y_constants(8*(t_index) + 6)*((t - traj_time(t_index + 1))/(T*T*T))^3 + 30*y_constants(8*(t_index) + 7)*((t - traj_time(t_index + 1))/(T*T*T))^4 + 42*y_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T*T))^5;
    t_index = t_index + 1;
    end
    
    t_index = 1;
    for i=21:1:23
    t = traj_time(t_index + 1);
    eqn(i) = 6*y_constants(8*(t_index-1) + 4)*(1/(T*T*T)) + 24*y_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T*T*T)) + 60*y_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T*T))^2 + 120*y_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T*T))^3 + 210*y_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T*T))^4 == 6*y_constants(8*(t_index) + 4)*(1/(T*T*T)) + 24*y_constants(8*(t_index) + 5)*((t - traj_time(t_index + 1))/(T*T*T*T)) + 60*y_constants(8*(t_index) + 6)*((t - traj_time(t_index + 1))/(T*T*T*T))^2 + 120*y_constants(8*(t_index) + 7)*((t - traj_time(t_index + 1))/(T*T*T*T))^3 + 210*y_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T*T*T))^4;
    t_index = t_index + 1;
    end
    
    t_index = 1;
    for i=24:1:26
    t = traj_time(t_index + 1);
    eqn(i) = 24*y_constants(8*(t_index-1) + 5)*(1/(T*T*T*T)) + 120*y_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T*T*T)) + 360*y_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T*T*T))^2 + 840*y_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T*T*T))^3 == 24*y_constants(8*(t_index) + 5)*(1/(T*T*T*T)) + 120*y_constants(8*(t_index) + 6)*((t - traj_time(t_index + 1))/(T*T*T*T*T)) + 360*y_constants(8*(t_index) + 7)*((t - traj_time(t_index + 1))/(T*T*T*T*T))^2 + 840*y_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T*T*T*T))^3;
    t_index = t_index + 1;
    end
    
    t_index = 1;
    for i=27:1:29
    t = traj_time(t_index + 1);
    eqn(i) = 120*y_constants(8*(t_index-1) + 6)*(1/(T*T*T*T*T)) + 720*y_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T*T*T*T)) + 2520*y_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T*T*T*T))^2 == 120*y_constants(8*(t_index) + 6)*(1/(T*T*T*T*T*T)) + 720*y_constants(8*(t_index) + 7)*((t - traj_time(t_index + 1))/(T*T*T*T*T*T)) + 2520*y_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T*T*T*T*T))^2;
    t_index = t_index + 1;
    end
    
    t_index = 1;
    for i=30:1:32
    t = traj_time(t_index + 1);
    eqn(i) = 720*y_constants(8*(t_index-1) + 7)*(1/(T*T*T*T*T*T)) + 5040*y_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T*T*T*T*T)) == 720*y_constants(8*(t_index) + 7)*(1/(T*T*T*T*T*T*T)) + 5040*y_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T*T*T*T*T*T));
    t_index = t_index + 1;
    end
    
    [A,B] = equationsToMatrix(eqn,y_constants);
    constants_y = A\B;
    digits(5);
    constants_y = vpa(constants_y);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Z position
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    j = 1;
    for i = 1:1:8     
    t_index = j;
    w_no = i - j + 1;
    t = traj_time(w_no);
    eqn(i) = z_constants(8*(t_index-1) + 1) + z_constants(8*(t_index-1) + 2)*((t - traj_time(t_index))/T) + z_constants(8*(t_index-1) + 3)*((t - traj_time(t_index))/T)^2 + z_constants(8*(t_index-1) + 4)*((t - traj_time(t_index))/T)^3 + z_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/T)^4 + z_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/T)^5 + z_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/T)^6 + z_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/T)^7 == waypoints(3,w_no);
    if(~mod(i,2))
        j = j + 1;
    end
    end
    
    for i=9:1:10
    if(i == 9)
        t = traj_time(1);
        t_index = 1;
    else
        t = traj_time(5);
        t_index = 4;
    end
    eqn(i) = z_constants(8*(t_index-1) + 2)*(1/T) + 2*z_constants(8*(t_index-1) + 3)*((t - traj_time(t_index))/(T*T)) + 3*z_constants(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T))^2 + 4*z_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T))^3 + 5*z_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T))^4 + 6*z_constants(8*(t_index-1) +  7)*((t - traj_time(t_index))/(T*T))^5 + 7*z_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T))^6 == 0;
    end
    
    for i=11:1:12
    if(i == 11)
        t = traj_time(1);
        t_index = 1;
    else
        t = traj_time(5);
        t_index = 4;
    end
    eqn(i) = 2*z_constants(8*(t_index-1) + 3)*(1/(T*T)) + 6*z_constants(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T*T)) + 12*z_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T*T))^2 + 20*z_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T))^3 + 30*z_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T))^4 + 42*z_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T))^5 == 0;
    end
    
    for i=13:1:14
    if(i == 13)
        t = traj_time(1);
        t_index = 1;
    else
        t = traj_time(5);
        t_index = 4;
    end
    eqn(i) = 6*z_constants(8*(t_index-1) + 4)*(1/(T*T*T)) + 24*z_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T*T*T)) + 60*z_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T*T))^2 + 120*z_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T*T))^3 + 210*z_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T*T))^4 == 0;
    end
    
    t_index = 1;
    for i=15:1:17
    t = traj_time(t_index + 1);
    eqn(i) = z_constants(8*(t_index-1) + 2)*(1/T) + 2*z_constants(8*(t_index-1) + 3)*((t - traj_time(t_index))/(T*T)) + 3*z_constants(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T))^2 + 4*z_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T))^3 + 5*z_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T))^4 + 6*z_constants(8*(t_index-1) +  7)*((t - traj_time(t_index))/(T*T))^5 + 7*z_constants(8*(t_index - 1) + 8)*((t - traj_time(t_index))/(T*T))^6 == z_constants(8*(t_index) + 2)*(1/T) + 2*z_constants(8*(t_index) + 3)*((t - traj_time(t_index + 1))/(T*T)) + 3*z_constants(8*(t_index) + 4)*((t - traj_time(t_index + 1))/(T*T))^2 + 4*z_constants(8*(t_index) + 5)*((t - traj_time(t_index + 1))/(T*T))^3 + 5*z_constants(8*(t_index) + 6)*((t - traj_time(t_index + 1))/(T*T))^4 + 6*z_constants(8*(t_index) +  7)*((t - traj_time(t_index + 1))/(T*T))^5 + 7*z_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T))^6;
    t_index = t_index + 1;
    end
    
    t_index = 1;
    for i=18:1:20
    t = traj_time(t_index + 1);
    eqn(i) = 2*z_constants(8*(t_index-1) + 3)*(1/(T*T)) + 6*z_constants(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T*T)) + 12*z_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T*T))^2 + 20*z_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T))^3 + 30*z_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T))^4 + 42*z_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T))^5 == 2*z_constants(8*(t_index) + 3)*(1/(T*T)) + 6*z_constants(8*(t_index) + 4)*((t - traj_time(t_index + 1))/(T*T*T)) + 12*z_constants(8*(t_index) + 5)*((t - traj_time(t_index + 1))/(T*T*T))^2 + 20*z_constants(8*(t_index) + 6)*((t - traj_time(t_index + 1))/(T*T*T))^3 + 30*z_constants(8*(t_index) + 7)*((t - traj_time(t_index + 1))/(T*T*T))^4 + 42*z_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T*T))^5;
    t_index = t_index + 1;
    end
    
    t_index = 1;
    for i=21:1:23
    t = traj_time(t_index + 1);
    eqn(i) = 6*z_constants(8*(t_index-1) + 4)*(1/(T*T*T)) + 24*z_constants(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T*T*T)) + 60*z_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T*T))^2 + 120*z_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T*T))^3 + 210*z_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T*T))^4 == 6*z_constants(8*(t_index) + 4)*(1/(T*T*T)) + 24*z_constants(8*(t_index) + 5)*((t - traj_time(t_index + 1))/(T*T*T*T)) + 60*z_constants(8*(t_index) + 6)*((t - traj_time(t_index + 1))/(T*T*T*T))^2 + 120*z_constants(8*(t_index) + 7)*((t - traj_time(t_index + 1))/(T*T*T*T))^3 + 210*z_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T*T*T))^4;
    t_index = t_index + 1;
    end
    
    t_index = 1;
    for i=24:1:26
    t = traj_time(t_index + 1);
    eqn(i) = 24*z_constants(8*(t_index-1) + 5)*(1/(T*T*T*T)) + 120*z_constants(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T*T*T)) + 360*z_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T*T*T))^2 + 840*z_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T*T*T))^3 == 24*z_constants(8*(t_index) + 5)*(1/(T*T*T*T)) + 120*z_constants(8*(t_index) + 6)*((t - traj_time(t_index + 1))/(T*T*T*T*T)) + 360*z_constants(8*(t_index) + 7)*((t - traj_time(t_index + 1))/(T*T*T*T*T))^2 + 840*z_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T*T*T*T))^3;
    t_index = t_index + 1;
    end
    
    t_index = 1;
    for i=27:1:29
    t = traj_time(t_index + 1);
    eqn(i) = 120*z_constants(8*(t_index-1) + 6)*(1/(T*T*T*T*T)) + 720*z_constants(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T*T*T*T*T)) + 2520*z_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T*T*T*T))^2 == 120*z_constants(8*(t_index) + 6)*(1/(T*T*T*T*T*T)) + 720*z_constants(8*(t_index) + 7)*((t - traj_time(t_index + 1))/(T*T*T*T*T*T)) + 2520*z_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T*T*T*T*T))^2;
    t_index = t_index + 1;
    end
    
    t_index = 1;
    for i=30:1:32
    t = traj_time(t_index + 1);
    eqn(i) = 720*z_constants(8*(t_index-1) + 7)*(1/(T*T*T*T*T*T)) + 5040*z_constants(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T*T*T*T*T)) == 720*z_constants(8*(t_index) + 7)*(1/(T*T*T*T*T*T*T)) + 5040*z_constants(8*(t_index) + 8)*((t - traj_time(t_index + 1))/(T*T*T*T*T*T*T));
    t_index = t_index + 1;
    end
    
    [A,B] = equationsToMatrix(eqn,z_constants);
    constants_z = A\B;
    digits(5);
    constants_z = vpa(constants_z);
    
    constants = horzcat(constants_x,constants_y,constants_z);
    
    for i = 1:1:32
        for j = 1:1:3
        constants_final(i,j) = constants(i,j);
        end
    end
    %plot_traj(constants_final);
    
else
    
    if(t > traj_time(1,end))
        t = traj_time(1,end);
    end
    
    pos = zeros(1,3);
    vel = zeros(1,3);
    acc = zeros(1,3);
    
    coeff_pos = zeros(8,3);
    
    t_index = find(traj_time >= t,1);
    
    if(t == 0)
        t_index = 1;
    else
        t_index = t_index - 1;
    end
    Si  = traj_time(1,t_index);
    
    time_term_pos = [1 t - Si (t - Si)^2 (t - Si)^3 (t - Si)^4 (t - Si)^5 (t - Si)^6 (t - Si)^7];
    time_term_vel = [0 1 2*(t - Si) 3*(t - Si)^2 4*(t - Si)^3 5*(t - Si)^4 6*(t - Si)^5 7*(t - Si)^6];
    time_term_acc = [0 0 2 6*(t - Si) 12*(t - Si)^2 20*(t - Si)^3 30*(t - Si)^4 42*(t - Si)^5];
    
    coeff_pos =  constants_final(8*(t_index-1) + 1:8*(t_index-1) + 8,:);
    
    pos = time_term_pos*coeff_pos;
    vel = time_term_vel*coeff_pos;
    acc = time_term_acc*coeff_pos;

    desired_state.pos = pos';
    desired_state.vel = vel';
    desired_state.acc = acc';
    
%     fprintf('At Time: %d sec \n',t);
%     fprintf('x=%d y=%d z=%d \n',desired_state.pos(1,1),desired_state.pos(2,1),desired_state.pos(3,1));
%     fprintf('Vx=%d Vy=%d Vz=%d \n',desired_state.vel(1,1),desired_state.vel(2,1),desired_state.vel(3,1));
%     fprintf('Ax=%d Ay=%d Az=%d \n',desired_state.acc(1,1),desired_state.acc(2,1),desired_state.acc(3,1));
%     fprintf('\n');
    
    desired_state.yaw = 0;
    desired_state.yawdot = 0;
    end
end


