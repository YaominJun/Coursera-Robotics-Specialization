% Robotics: Estimation and Learning 
% WEEK 3
% 
% Complete this function following the instruction. 
function myMap = occGridMapping(ranges, scanAngles, pose, param)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters 
% 
% % the number of grids for 1 meter.
 myResol = param.resol;
% % the initial map size in pixels
 myMap = zeros(param.size);
% % the origin of the map in pixels
 myorigin = param.origin'; 
% 
% % 4. Log-odd parameters 
 lo_occ = param.lo_occ;
 lo_free = param.lo_free; 
 lo_max = param.lo_max;
 lo_min = param.lo_min;
 myorigin_mat = repmat(myorigin,size(scanAngles,1),1);
 
 N = size(pose,2);
 workingDir = 'C:\Users\Dell\Desktop\Coursera\Estimation-and-Learning\AssignmentWEEK3';
 v = VideoWriter(fullfile(workingDir,'Occupancy_Map'));
 open(v);
free_cell = [];

 for j = 1:N % for each time,
  
      % Find grids hit by the rays (in the gird map coordinate)
      
      x_abs_occ = ranges(:,j).*cos(pose(3,j) + scanAngles) + pose(1,j);
      y_abs_occ = -ranges(:,j).*sin(pose(3,j) + scanAngles) + pose(2,j);
      grid_index = ceil(myResol.*[x_abs_occ y_abs_occ]) + myorigin_mat;     
      curr_pose_index = ceil(myResol.*pose(1:2,j)) + myorigin';
           
     % Find occupied-measurement cells and free-measurement cells
     for i = 1:size(grid_index,1)
     [freex, freey] = bresenham(curr_pose_index(1),curr_pose_index(2),grid_index(i,1),grid_index(i,2)); 
     free = sub2ind(size(myMap),freey,freex);
     free_cell = [free_cell; free];   
     myMap(grid_index(i,2),grid_index(i,1)) = myMap(grid_index(i,2),grid_index(i,1)) + lo_occ;
     end
     
     % Update the log-odds
     myMap(free_cell) = myMap(free_cell) - lo_free;
     
     % Saturate the log-odd values
     myMap(myMap>lo_max) = lo_max;
     myMap(myMap<lo_min) = lo_min;
    
    % Visualize the map as needed
      figure(2),
      imagesc(myMap);
      colormap('gray');
      saveas(gcf,'myMap.png');
      A = imread('myMap.png');
      writeVideo(v,A);
 end
close(v);
end

