close all;
clear;
% taking mu=10;
% sigma=2;
n=1000;
pop_n=1000000;
pop=zeros(pop_n,1);
pop=normrnd(10,5,pop_n,1);


myHist4(pop,pop_n/10000,'','','distribution')
figure
pop=sort(pop);
m_orig=mean(pop);
s_orig=std(pop);

%normal samples with similar variances,
tmp1=randperm(pop_n,n);
arr=pop(tmp1);
myboxplot(arr,'','','')
figure
myHist(arr,n/10,'','','')

mean_difference=m_orig-mean(arr)
sigma_difference=s_orig-std(arr)

t=100;
t_values=zeros(t,1);
%performing t-test
sigmas=zeros(t,1);
means=zeros(t,1);

for i=1:t
    tmp1=randperm(pop_n/2,n);
    tmp1=tmp1+randi(pop_n/2);
    arr=pop(tmp1);
    t_values(i)=(mean(arr)-m_orig)/(std(arr)/(n^(0.5)));
    sigmas(i)=std(arr);
    means(i)=mean(arr);   
end

figure;
myHist3(t_values,t/10,'','','')
mt1=mean(t_values);
st1=std(t_values);
hold on;
x = -5:0.1:5;
y = tpdf(x,5);
plot(x,y,'-r')
%di1=normrnd(mt1,st1,10000*t,1);
%myHist4(di1,t,'','','')
legend('histogram of the t-test','actual t-distribution')

figure;
plot(1:1:t,abs(sigmas-std(pop)),'lineWidth',2.5)
title('difference of sigma throughout the tests')

figure;
plot(1:1:t,abs(means-mean(pop)),'lineWidth',2.5)
title('difference of mean throughout the tests')








