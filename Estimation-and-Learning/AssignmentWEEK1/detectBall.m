% Robotics: Estimation and Learning 
% WEEK 1
% 
% Complete this function following the instruction. 
function [segI, loc] = detectBall(I)
% function [segI, loc] = detectBall(I)
%
% INPUT
% I       120x160x3 numerial array 
%
% OUTPUT
% segI    120x160 numeric array
% loc     1x2 or 2x1 numeric array 

 function pe = g_probability(val,mu,sig)
 pe = 1/(sig*sqrt(2*pi)).*exp(-0.5.*(((val-mu)./sig).^2));
 end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hard code your learned model parameters here
%

mu = [146.5726  139.8667   63.4197
      153.0961  162.3321   61.5212];
  
sig = [15.7185    8.7602   21.3125
       6.6846    4.8062    9.8105];
   
w = [0.8044    0.8572    0.8108
    0.1956    0.1875    0.1976];

seg_img = zeros(size(I,1),size(I,2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Find ball-color pixels using your model
  R_pixel = zeros(size(I,1),size(I,2));
  G_pixel = zeros(size(I,1),size(I,2));
  B_pixel = zeros(size(I,1),size(I,2));
  
  R_pixel(:,:) = I(:,:,1);
  G_pixel(:,:) = I(:,:,2);
  B_pixel(:,:) = I(:,:,3);
  
R = w(1,1).*g_probability(R_pixel,mu(1,1),sig(1,1)) + w(2,1).*g_probability(R_pixel,mu(2,1),sig(2,1));
G = w(1,2).*g_probability(G_pixel,mu(1,2),sig(1,2)) + w(2,2).*g_probability(G_pixel,mu(2,2),sig(2,2));
B = w(1,3).*g_probability(B_pixel,mu(1,3),sig(1,3)) + w(2,3).*g_probability(B_pixel,mu(2,3),sig(2,3));

% x = 1:120;
% y = 1:160;
% 
% [X,Y] = meshgrid(x,y);
% 
% figure; mesh(R);
% figure; mesh(G);
% figure; mesh(B);

% threshR = w(1,1).*g_probability(x,mu(1,1),sig(1,1)) + w(2,1).*g_probability(x,mu(2,1),sig(2,1));
% threshG = w(1,1).*g_probability(x,mu(1,1),sig(1,1)) + w(2,1).*g_probability(x,mu(2,1),sig(2,1));
% threshB = w(1,1).*g_probability(x,mu(1,1),sig(1,1)) + w(2,1).*g_probability(x,mu(2,1),sig(2,1));

thresh = [0.004 0.004 0.005];

for i = 1:size(I,1)
    for j = 1:size(I,2)
        if((R(i,j) > thresh(1))&& (G(i,j) > thresh(2)) && (B(i,j) > thresh(3)))
            seg_img(i,j) = 1;
        end
    end
end
 seg_img = imfill(seg_img,'holes');
 
 se = strel('disk',3);
 seg_img = imclose(seg_img,se);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do more processing to segment out the right cluster of pixels.
% You may use the following functions.
%   bwconncomp
%   regionprops
% Please see example_bw.m if you need an example code.
CC = bwconncomp(seg_img);
numPixels = cellfun(@numel,CC.PixelIdxList);
[biggest,idx] = max(numPixels);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compute the location of the ball center
 segI = seg_img;
 seg = regionprops(CC,'Centroid');
 loc = seg(idx).Centroid;
% 
% Note: In this assigment, the center of the segmented ball area will be considered for grading. 
% (You don't need to consider the whole ball shape if the ball is occluded.)

end
