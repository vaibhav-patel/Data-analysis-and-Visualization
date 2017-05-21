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

histogram(a,6)
title('histogram of the new methods DRP score');
hold on
histogram(b,6)
title('histogram of the traditional methods DRP score');
title('comparison blue is the new method ')
figure
fixed_n=floor((n1+n2)/2);
medians=zeros(t,1);
for i=1:t
    c2=c(randperm(n1+n2,n1+n2));
    sample1=c2(1:fixed_n);
    sample2=c2(fixed_n+1:2*fixed_n);
    medians(i,1)=median(sample1) -median(sample2);
end    
histogram(medians,20);
sort_medians=sort(medians);
title('differences of medians(without replacement)')


%new test
% test value for 95% of the data
x1=floor(t*0.975);
x2=floor(t*0.275);


hold on;
plot([sort_medians(x1) ;sort_medians(x1)],[0 ;(t/5)],'-r','lineWidth',2);
hold on
plot([sort_medians(x2) ;sort_medians(x2)],[0 ;(t/5)],'-r','lineWidth',2);

x=median(a)-median(b);
hold on;
plot([x;x],[0 ;(t/5)],'-g','lineWidth',2);

















