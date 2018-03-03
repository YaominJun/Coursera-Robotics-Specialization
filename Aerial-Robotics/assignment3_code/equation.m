clc;
close all;
clear all;

waypoints = [0    0   0;
             1    1   1;
             2    0   2;
             3    -1  1;
             4    0   0]';

    x_constants = sym('alphax',[1,32]);
    y_constants = sym('alphay',[1,32]);
    z_constants = sym('alphaz',[1,32]);
    
    T = 1.0;
    traj_time = [0,1.0,2.0,3.0,4.0];
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
    digits(4);
    constants_x = vpa(constants_x);
    constants_x = constants_x';
    %constants_x
    
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
    constants_y = constants_y';
    
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
    constants_z = constants_z';
    
    idx = 1;
    for t = 0 : 0.05 : 5
        
    if(t > traj_time(end))
        t = traj_time(end);
    end
         t_index = find(traj_time >= t,1);
         
    if (t == 0)
        t_index = 1;
    else
        t_index = t_index - 1;
    end
        posx(idx) = constants_x(8*(t_index-1) + 1) + constants_x(8*(t_index-1) + 2)*(((t - traj_time(t_index))/T)) + constants_x(8*(t_index-1) + 3)*(((t - traj_time(t_index))/T)^2) + constants_x(8*(t_index-1) + 4)*(((t - traj_time(t_index))/T)^3) + constants_x(8*(t_index-1) + 5)*(((t - traj_time(t_index))/T)^4) + constants_x(8*(t_index-1) + 6)*(((t - traj_time(t_index))/T)^5) + constants_x(8*(t_index-1) + 7)*(((t - traj_time(t_index))/T)^6) + constants_x(8*(t_index-1) + 8)*(((t - traj_time(t_index))/T)^7);
        velx(idx) = constants_x(8*(t_index-1) + 2)*(1/T) + 2*constants_x(8*(t_index-1) + 3)*((t - traj_time(t_index))/(T*T)) + 3*constants_x(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T))^2 + 4*constants_x(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T))^3 + 5*constants_x(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T))^4 + 6*constants_x(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T))^5 + 7*constants_x(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T))^6;
        accx(idx) = 2*constants_x(8*(t_index-1) +  3)*(1/(T*T)) + 6*constants_x(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T*T)) + 12*constants_x(8*(t_index-1) +  5)*((t - traj_time(t_index))/(T*T*T))^2 + 20*constants_x(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T))^3 + 30*constants_x(8*(t_index-1) +  7)*((t - traj_time(t_index))/(T*T*T))^4 + 42*constants_x(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T))^5;
        
        posy(idx) = constants_y(8*(t_index-1) + 1) + constants_y(8*(t_index-1) + 2)*(((t - traj_time(t_index))/T)) + constants_y(8*(t_index-1) + 3)*(((t - traj_time(t_index))/T)^2) + constants_y(8*(t_index-1) + 4)*(((t - traj_time(t_index))/T)^3) + constants_y(8*(t_index-1) + 5)*(((t - traj_time(t_index))/T)^4) + constants_y(8*(t_index-1) + 6)*(((t - traj_time(t_index))/T)^5) + constants_y(8*(t_index-1) + 7)*(((t - traj_time(t_index))/T)^6) + constants_y(8*(t_index-1) + 8)*(((t - traj_time(t_index))/T)^7);
        vely(idx) = constants_y(8*(t_index-1) + 2)*(1/T) + 2*constants_y(8*(t_index-1) + 3)*((t - traj_time(t_index))/(T*T)) + 3*constants_y(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T))^2 + 4*constants_y(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T))^3 + 5*constants_y(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T))^4 + 6*constants_y(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T))^5 + 7*constants_y(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T))^6;
        accy(idx) = 2*constants_y(8*(t_index-1) +  3)*(1/(T*T)) + 6*constants_y(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T*T)) + 12*constants_y(8*(t_index-1) +  5)*((t - traj_time(t_index))/(T*T*T))^2 + 20*constants_y(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T))^3 + 30*constants_y(8*(t_index-1) +  7)*((t - traj_time(t_index))/(T*T*T))^4 + 42*constants_y(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T))^5;
        
        posz(idx) = constants_z(8*(t_index-1) + 1) + constants_z(8*(t_index-1) + 2)*(((t - traj_time(t_index))/T)) + constants_z(8*(t_index-1) + 3)*(((t - traj_time(t_index))/T)^2) + constants_z(8*(t_index-1) + 4)*(((t - traj_time(t_index))/T)^3) + constants_z(8*(t_index-1) + 5)*(((t - traj_time(t_index))/T)^4) + constants_z(8*(t_index-1) + 6)*(((t - traj_time(t_index))/T)^5) + constants_z(8*(t_index-1) + 7)*(((t - traj_time(t_index))/T)^6) + constants_z(8*(t_index-1) + 8)*(((t - traj_time(t_index))/T)^7);
        velz(idx) = constants_z(8*(t_index-1) + 2)*(1/T) + 2*constants_z(8*(t_index-1) + 3)*((t - traj_time(t_index))/(T*T)) + 3*constants_z(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T))^2 + 4*constants_z(8*(t_index-1) + 5)*((t - traj_time(t_index))/(T*T))^3 + 5*constants_z(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T))^4 + 6*constants_z(8*(t_index-1) + 7)*((t - traj_time(t_index))/(T*T))^5 + 7*constants_z(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T))^6;
        accz(idx) = 2*constants_z(8*(t_index-1) +  3)*(1/(T*T)) + 6*constants_z(8*(t_index-1) + 4)*((t - traj_time(t_index))/(T*T*T)) + 12*constants_z(8*(t_index-1) +  5)*((t - traj_time(t_index))/(T*T*T))^2 + 20*constants_z(8*(t_index-1) + 6)*((t - traj_time(t_index))/(T*T*T))^3 + 30*constants_z(8*(t_index-1) +  7)*((t - traj_time(t_index))/(T*T*T))^4 + 42*constants_z(8*(t_index-1) + 8)*((t - traj_time(t_index))/(T*T*T))^5;
        
        time(idx) = t;
        idx = idx + 1;
        
    end
    posx
    subplot(3,1,1)
    plot(time,posx)
    title('Subplot 1 - Posx')
    hold on
    
    subplot(3,1,2)
    plot(time,posy)
    title('Subplot 2 - Posy')
    
    subplot(3,1,3)
    plot(time,posz)
    title('Subplot 3 - Posz')
    
%     subplot(3,1,1)
%     plot(time,velx)
%     title('Subplot 1 - Velx')
%     hold on
%     
%     subplot(3,1,2)
%     plot(time,vely)
%     title('Subplot 2 - Vely')
%     
%     subplot(3,1,3)
%     plot(time,v)
%     title('Subplot 3 - Velz')
%     
%     subplot(3,1,1)
%     plot(time,velx)
%     title('Subplot 1 - Velx')
%     hold on
%     
%     subplot(3,1,2)
%     plot(time,vely)
%     title('Subplot 2 - Vely')
%     
%     subplot(3,1,3)
%     plot(time,v)
%     title('Subplot 3 - Velz')
    
    