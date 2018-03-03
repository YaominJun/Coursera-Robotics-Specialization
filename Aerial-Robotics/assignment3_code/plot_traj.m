function [  ] = plot_traj(constants_final)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

idx = 1;
traj_time = [0,1.0,2.0,3.0,4.0];
for t=1:0.05:4
        
    if(t > traj_time(1,end))
        t = traj_time(1,end);
    end    
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
    
    pos(:,idx) = time_term_pos*coeff_pos;
    vel(:,idx) = time_term_vel*coeff_pos;
    acc(:,idx) = time_term_acc*coeff_pos;
    time(idx) = t;
    
    idx = idx + 1;
    
end

%     subplot(3,1,1)
%     plot(time,pos(1,:))
%     title('Subplot 1 - Posx')
%     hold on
%     
%     subplot(3,1,2)
%     plot(time,pos(2,:))
%     title('Subplot 2 - Posy')
%     
%     subplot(3,1,3)
%     plot(time,pos(3,:))
%     title('Subplot 3 - Posz')
    
    subplot(3,1,1)
    plot(time,vel(1,:))
    title('Subplot 1 - Velx')
    hold on
    
    subplot(3,1,2)
    plot(time,vel(2,:))
    title('Subplot 2 - Vely')
    
    subplot(3,1,3)
    plot(time,vel(3,:))
    title('Subplot 3 - Velz')
%     
%     subplot(3,1,1)
%     plot(time,acc(1,:))
%     title('Subplot 1 - Accx')
%     hold on
%     
%     subplot(3,1,2)
%     plot(time,acc(2,:))
%     title('Subplot 2 - Accy')
%     
%     subplot(3,1,3)
%     plot(time,acc(3,:))
%     title('Subplot 3 - Accz')

end

