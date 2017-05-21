close all;
clear;
load('data_lab6.mat');
%% For data1
alg1=saliency_map_Tunnel_processing1;
alg2=saliency_map_Tunnel_processing2;
r=size(alg1,1);
c=size(alg1,2);
[coeff,score] = pca(alg1);
d1=sort(score(:));
[coeff,score] = pca(alg2);
d2=sort(score(:));


alg1=d1;
alg2=d2;

data2=d1-d2;
m1=mean(data2);
std1=std(data2);
n=size(alg1,1);

% Should we do the t-test?
ES=(mean(alg1) -mean(alg2) )/std1

% paired t-test
t_value=abs(m1)/(std1/(n^(0.5)))

