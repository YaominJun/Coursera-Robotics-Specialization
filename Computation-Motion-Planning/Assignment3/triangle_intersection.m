function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************

function x_corr = new_mod(i)
  if(mod(i,3))
   x_corr = mod(i,3);
  else
   x_corr = 3;
  end
end

%% calculates slope and constant for given polygon
function [c,m,dir] = calc_slope_const(P)
    c = zeros(1,3);
    m = zeros(1,3);
    dir = zeros(1,3);
    
    for i = 1:3
      m(i) = (P(new_mod(i),2) - P(new_mod(i+1),2))/(P(new_mod(i),1) - P(new_mod(i+1),1));
      c(i) = P(i,2) - m(i)*P(i,1);
  
      if((m(i) == inf) || (m(i) == -inf))
          if(P(i,1) < P(new_mod(i+2),1))
              dir(i) = 1;
          else
              dir(i) = -1;
          end
      else          
          if(P(new_mod(i+2),2) > P(new_mod(i+2),1)*m(i) + c(i))
          dir(i) = 2;
          else
          dir(i) = -2;
          end
      end
   end
end


%% Checks whether a point is inside a triangle or not
%% returns true if point lies on or inside triangle
function result = point_inside_triangle(corr,dir,m,c,P1)
    result = 0;
    count = 0;
    y_on_line = corr(1).*m + c;
    
    for i=1:3
        if (dir(i) == -2)
           if(corr(2) <= y_on_line(i))
               count = count + 1;
           else
               break;
           end         
        elseif(dir(i) == 2)
            if(corr(2) >= y_on_line(i))
               count = count + 1;
           else
               break;
            end
        elseif(dir(i) == -1)
            if(corr(1) <=  P1(i,1))
               count = count + 1;
            else
               break;
            end
        else
            if(corr(1) >=  P1(i,1))
               count = count + 1;
            else
               break;
            end
        end
    end
    if(count == 3)
    result = 1;
    end    
end

%% Checks whether a P2 triangle is inside a another triangle P1 or not
%% returns true if any vertex of P2 is on or inside triangle P1
function result = triangle_inside_triangle(dir,m,c,P1,P2)
    points_outside = 0;
    for i =1:3
        result = point_inside_triangle(P2(i,:),dir,m,c,P1);
        if result == 0
        points_outside = points_outside + 1;
        else
        break;
        end
    end
    if(points_outside == 3)
        result = false;
    else
        result = true;
    end
end

%% Checks whether a P2 triangle is intersecting with another triangle P1 or not
%% returns true if there is any interesection between triangle P1 & P2
function result = intersecting_triangles(c1,c2,m1,m2,dir1,dir2,P1,P2)
    int_points = zeros(9,2);
    points_outside = 0;
    
    for i = 1:3
        for j = 1:3
            int_points(3*(i-1)+j,1) = (c2(j) - c1(i))/(m1(i) - m2(j));
            int_points(3*(i-1)+j,2) = int_points(3*(i-1)+j,1)*m1(i) + c1(i);
            
            result = (point_inside_triangle(int_points(i,:),dir1,m1,c1,P1)) & (point_inside_triangle(int_points(i,:),dir2,m2,c2,P2));
            if result == 0
            points_outside = points_outside + 1;
            else
            break;
            end
        end
    end
    
    if points_outside == 9
    result = false;
    else
    result = true;
    end
end

[c1,m1,dir1] = calc_slope_const(P1);
[c2,m2,dir2] = calc_slope_const(P2);

result = triangle_inside_triangle(dir1,m1,c1,P1,P2);
if result == false
    result = triangle_inside_triangle(dir2,m2,c2,P2,P1);
    if result == true
        flag = true;
    else
        result = intersecting_triangles(c1,c2,m1,m2,dir1,dir2,P1,P2);
        if result == true
            flag = true;
        else
            flag = false;
        end
    end
else
    flag = true;
end
end
% *******************************************************************
