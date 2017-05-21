close all
clear;
load('data_lab9.mat');
% with replacement

a=new';
b=traditional';
c=[a; b];
n1=size(a,1);
n2=size(b,1);
t=10000;

fixed_n=20;
medians=zeros(t,1);
for i=1:t
    sample1=c(randperm(n1+n2,fixed_n));
    sample2=c(randperm(n1+n2,fixed_n));
    medians(i,1)=median(sample1-sample2);
end    
histogram(medians,20);
sort_medians=sort(medians);
x1=floor(t*0.025);
x2=floor(t*0.975);
title('median of differences(without replacement)')














