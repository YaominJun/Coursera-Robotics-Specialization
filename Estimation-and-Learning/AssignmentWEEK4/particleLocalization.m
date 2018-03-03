% Robotics: Estimation and Learning 
% WEEK 4
% 
% Complete this function following the instruction. 
function myPose = particleLocalization(ranges, scanAngles, map, param)

% Number of poses to calculate
N = size(ranges, 2);
% Output format is [x1 x2, ...; y1, y2, ...; z1, z2, ...]
myPose = zeros(3, N);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% Map Parameters 
% 
% % the number of grids for 1 meter.
myResolution = param.resol;
% % the origin of the map in pixels
myOrigin = param.origin'; 

% The initial pose is given
myPose(:,1) = param.init_pose;
% You should put the given initial pose into myPose for j=1, ignoring the j=1 ranges. 
% The pose(:,1) should be the pose when ranges(:,j) were measured.

% Decide the number of particles, M.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M = 1500;                           % Please decide a reasonable number of M, 
                                  % based on your experiment using the practice data.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create M number of particles
P = repmat(myPose(:,1), [1, M]);
myorigin_mat = repmat(myOrigin,size(scanAngles,1),1);

corr = 0;
map_occ_meas_corr = 10;
map_occ_meas_false = -2;
neff_min = M/4;
sigmam = diag([0.02 0.03 0.05]);
um = [0 0 0];

    function [neff,temp_pose] = particle_filter(myPose,j)
      wi = (1/M)*ones(1,M);  

     % 1) Propagate the particles 
     % 2) Measurement Update 
     for i = 1:M
     P(:,i) = myPose + mvnrnd(um,sigmam)';
     
     %   2-1) Find grid cells hit by the rays (in the grid map coordinate frame)    
      x_abs_occ = ranges(:,j).*cos(P(3,i) + scanAngles) + P(1,i);
      y_abs_occ = -ranges(:,j).*sin(P(3,i) + scanAngles) + P(2,i);
      
      grid_index = ceil(myResolution.*[x_abs_occ y_abs_occ]) + myorigin_mat;
      grid_index_x = grid_index(:,1);
      grid_index_y = grid_index(:,2);
      
      del_occ =  grid_index_x <1 | grid_index_y <1 |  grid_index_x > size(map,2) |  grid_index_y > size(map,1);

      grid_index_x(del_occ) = [];
      grid_index_y(del_occ) = [];
         
     %   2-2) For each particle, calculate the correlation scores of the particles
      occ_cell = sub2ind(size(map),grid_index_y,grid_index_x);
        
      corr =  corr + sum(map(occ_cell) > 0.5) * map_occ_meas_corr;
      corr =  corr + sum(map(occ_cell) < -0.2) * map_occ_meas_false;
     
     %   2-3) Update the particle weights         
      wi(i) = wi(i)*corr;    
      corr = 0;
     end
     
     [max_w,idx] = max(wi);
      temp_pose = P(:,idx);
     % 3) Resample if the effective number of particles is smaller than a threshold
      neff = (sum(wi)^2)/(sum(wi.^2));
    end

 for j = 2:N % You will start estimating myPose from j=2 using ranges(:,2).
      
      [neff,pose_temp] = particle_filter(myPose(:,j-1),j);
     %   2-4) Choose the best particle to update the pose      
      if(neff < neff_min)
          [neff_new,pose_new] = particle_filter(pose_temp,j);
          if(neff_new > neff)
              pose_temp = pose_new;
          end
      end
      myPose(:,j) = pose_temp;
     % 4) Visualize the pose on the map as needed
end

end

