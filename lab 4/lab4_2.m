close all;
clear;
load('data_lab4.mat');
pn = score_natural_model;
total = length(pn);
samples = 100;
J = zeros(10000,1);
arr1 = [0.01 , 0.025 ,0.050 , 0.1 , 0.900 , 0.950 , 0.975 , 0.990];
arr2 = [0.020 , 0.051 , 0.103 , 0.211 , 4.605 , 5.991 , 7.378 , 9.211];

for i = 1: 10000
    x = pn(randperm(total,samples));
    mu = mean(x);
    sigma = sqrt(var(x));
    skewns =  (sum((x-mean(x)).^3)./length(x)) ./ (var(x,1).^1.5);
   
    kurtss = (sum((x-mean(x)).^4)./length(x)) ./ (var(x,1).^2);
   
    J(i) = samples*(skewns^2 + ((kurtss - 3)^2)/4)/6;
   
end;

for i = 1:8
    s = (sum((J<=arr2(i)))/length(J) - arr1(i))^2  
   
end;
