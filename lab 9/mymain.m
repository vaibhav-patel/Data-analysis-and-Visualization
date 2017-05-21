close all
clear;
load('data_lab9.mat');
% with replacement

a=new';
b=traditional';

histogram(a,6)
title('histogram of the new methods DRP score');
hold on
histogram(b,6)
title('histogram of the traditional methods DRP score');
title('comparison blue is the new method ')
figure
c=[a; b];
n1=size(a,1);
n2=size(b,1);
t=10000;

fixed_n=20;
medians=zeros(t,1);
for i=1:t
sample=c(randi([1 n1+n2],fixed_n,1));
medians(i,1)=median(sample);
end    
histogram(medians,20);
sort_medians=sort(medians);
x1=floor(t*0.025);
x2=floor(t*0.975);
hold on;
plot([sort_medians(x1) ;sort_medians(x1)],[0 ;(t/5)],'-r','lineWidth',2);
hold on
plot([sort_medians(x2) ;sort_medians(x2)],[0 ;(t/5)],'-r','lineWidth',2);
title('CI of median')

















