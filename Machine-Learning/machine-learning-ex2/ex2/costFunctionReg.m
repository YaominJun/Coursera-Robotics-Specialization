function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
t = repmat(theta',m,1);
alpha = 1;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

P = y.*log(sigmoid(sum(t.*X,2))) + (1-y).*log(1-sigmoid(sum(t.*X,2)));
J = (-1/m)*(sum(P)) + (lambda/(2*m))*sum(theta.^2) - (lambda/(2*m))*(theta(1).^2);

Z = repmat((sigmoid(sum(t.*X,2)) - y),1,size(X,2));
theta_new = grad - ((alpha/m)*(sum(Z.*X,1)))' -(lambda/m)*theta + (lambda/m)*[theta(1,1); zeros(size(theta,1)-1,1)];
grad = -theta_new;

% =============================================================

end
