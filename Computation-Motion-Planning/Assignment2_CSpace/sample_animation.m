load('route');
theta1_range = 0:2:360;
theta2_range = 0:2:360;

nrows = length(theta2_range);
ncols = length(theta1_range);

[i,j] = ind2sub ([nrows ncols], route);

y = theta2_range(i);
x = theta1_range(j);

fv = TwoLinkRobot ([330 90]);
p = patch (fv);
p.FaceColor = 'blue';
p.EdgeColor = 'none';

hold on;

% These arrays define the vertices and faces of the obstacle as a patch
obstacle.vertices = [3 3; 3 4; 4 3; -6 6; -6 8; -7 6; -8 -6; 8 -6; -8 -10; 8 -10];
obstacle.faces = [1 2 3; 4 5 6; 7 8 9; 8 9 10];

obs = patch(obstacle);

hold off;

axis equal;
axis (12*[-1 1 -1 1]);

for i = 1:n
    fv = TwoLinkRobot ([x(i), y(i)]);
    p.Vertices = fv.vertices;
    pause(0.3);
    drawnow;
end