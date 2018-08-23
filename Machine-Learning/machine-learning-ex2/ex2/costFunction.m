function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

num_iters = 1;
alpha = 1;

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
t = repmat(theta',m,1);
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%
P = y.*log(sigmoid(sum(t.*X,2))) + (1-y).*log(1-sigmoid(sum(t.*X,2)));
J = (-1/m)*(sum(P));

for iter = 1:num_iters
Z = repmat((sigmoid(sum(t.*X,2)) - y),1,size(X,2));
theta_new = grad - ((alpha/m)*(sum(Z.*X,1)))';
grad = -theta_new;
end

% =============================================================

end
