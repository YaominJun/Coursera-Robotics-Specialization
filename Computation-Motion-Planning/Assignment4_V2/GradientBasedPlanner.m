function route = GradientBasedPlanner (f, start_coords, end_coords, max_its)
% GradientBasedPlanner : This function plans a path through a 2D
% environment from a start to a destination based on the gradient of the
% function f which is passed in as a 2D array. The two arguments
% start_coords and end_coords denote the coordinates of the start and end
% positions respectively in the array while max_its indicates an upper
% bound on the number of iterations that the system can use before giving
% up.
% The output, route, is an array with 2 columns and n rows where the rows
% correspond to the coordinates of the robot as it moves along the route.
% The first column corresponds to the x coordinate and the second to the y coordinate

[gx, gy] = gradient (-f);
%route = zeros(max_its, 2);

%%% All of your code should be between the two lines of stars.
% % *******************************************************************
gx_norm = gx./(sqrt(gx.^2 + gy.^2));
gy_norm = gy./(sqrt(gx.^2 + gy.^2));
% gx_norm(start_coords(1,2):start_coords(1,2) + 10,start_coords(1,1):start_coords(1,1) + 10)
% gx_norm(end_coords(1,2) - 10:end_coords(1,2),end_coords(1,1) - 10:end_coords(1,1))
% gy_norm(start_coords(1,2):start_coords(1,2) + 10,start_coords(1,1):start_coords(1,1) + 10)
% gy_norm(end_coords(1,2) - 10:end_coords(1,2),end_coords(1,1) - 10:end_coords(1,1))

route(1,:) = start_coords;
count = 1;
goal_dist = inf;
delta = 1;

while (count <= max_its && goal_dist >= 2.0)
curr_y = route(count,2) + delta*gy_norm(round(route(count,2)),round(route(count,1)));
curr_x = route(count,1) + delta*gx_norm(round(route(count,2)),round(route(count,1)));

goal_dist = sqrt((curr_x - end_coords(1,1))^2 + (curr_y - end_coords(1,2))^2);
count = count + 1;    
route(count,:) = [curr_x,curr_y];
end    
% % *******************************************************************
% end
