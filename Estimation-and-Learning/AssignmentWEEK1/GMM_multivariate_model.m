function [mu,sig,w] = gmm_mul_var()

 function pe = g_probability(val,mu,sig)
 pe = 1/(sig*sqrt(2*pi)).*exp(-0.5.*(((val-mu)./sig).^2));
 end

  mui = [148,140,55;157,167,70];
  sigi = [8,20,10;4,20,4];
  wi = [0.52 0.6 0.52;0.48 0.4 0.48];
  k = 2;
  d = 3;
  
%   Detailed explanation goes here
Samples = load('Samples.mat');
samples_data = zeros(size(Samples.Samples));
ric = zeros(size(samples_data,1),size(samples_data,2),k);
Nc = zeros(k,d);

mu = zeros(k,d);
sig = zeros(k,d);
w = zeros(k,d);

samples_data(:,1) = Samples.Samples(:,1);
samples_data(:,2) = Samples.Samples(:,2);
samples_data(:,3) = Samples.Samples(:,3);

%   figure; histogram(samples_data(:,1),'EdgeColor','r');
%   figure; histogram(samples_data(:,2),'EdgeColor','g');
%   figure; histogram(samples_data(:,3),'EdgeColor','b');

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  mu = mui;
  sig = sigi;
  w = wi;
  
 for i = 1:200
    % Expection Step
    for j = 1:k
        for p = 1:d
        w1 = w(1,p).*g_probability(samples_data(:,p),mu(1,p),sig(1,p));
        w2 = w(2,p).*g_probability(samples_data(:,p),mu(2,p),sig(2,p));
        ric(:,p,j) = (w(j,1).*g_probability(samples_data(:,p),mu(j,p),sig(j,p)))./(w1 + w2);
   
        % Maximation Step
        Nc(j,p) = sum(ric(:,p,j));
        mu_new(j,p) = sum(samples_data(:,p).*ric(:,p,j))./(Nc(j,p));
        sig_new(j,p)= sqrt(sum(ric(:,p,j).*((samples_data(:,p) - mu_new(j,p)).^2))./Nc(j,p));
        w_new(j,p) = Nc(j,p)./size(samples_data,1);
        end
    end   
    mu = mu_new;
    sig = sig_new;
    w = w_new;
 end

x = linspace(0,255,1000);
R = w(1,1).*g_probability(x,mu(1,1),sig(1,1)) + w(2,1).*g_probability(x,mu(2,1),sig(2,1));
G = w(1,2).*g_probability(x,mu(1,2),sig(1,2)) + w(2,2).*g_probability(x,mu(2,2),sig(2,2));
B = w(1,3).*g_probability(x,mu(1,3),sig(1,3)) + w(2,3).*g_probability(x,mu(2,3),sig(2,3));

figure; plot(x,R);
figure; plot(x,G);
figure; plot(x,B);

end
