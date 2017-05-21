close all;
clear;
% taking mu=10;
% sigma=2;
n=1000;
pop_n=1000000;
pop=zeros(pop_n,1);
pop=rand(pop_n,1).*normrnd(10,5,pop_n,1).*normrnd(1,2,pop_n,1);

m_orig=mean(pop)
s_orig=std(pop)


myHist4(pop,pop_n/10000,'values','frequence','non-normal distribution, very different variance. mu=4.99, std=   13.52')
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

t=10000;
t_values=zeros(t,1);
%performing t-test
sigmas=zeros(t,1);
means=zeros(t,1);


for i=1:t
    n2=randi(n/2)+n/2;
    sr=s_orig+(rand()-0.5)*2;
    arr=rand(n2,1).*normrnd(10,5+rand()-0.5,n2,1).*normrnd(1,2+rand()-0.5,n2,1);
    t_values(i)=(mean(arr)-m_orig)/(std(arr)/(n2^(0.5)));
    sigmas(i)=std(arr);
    means(i)=mean(arr);   
end
figure;
myHist3(t_values,t/100,'','','')
mt1=mean(t_values);
st1=std(t_values);
hold on;
x = -5:0.1:5;
y = tpdf(x,5);
plot(x,y,'-r','lineWidth',2)
%di1=normrnd(mt1,st1,100*t,1);
%myHist2(di1,t/10,'','','')
legend('histogram of the t-test','actual t-distribution')
title('t-distribution of the non-normal sample with different variance')
xlabel('value of t')
ylabel('histogram frquence normalized')

figure;
plot(1:1:t,abs(sigmas-std(pop)),'lineWidth',1)
title('difference of standard deviation throughout all the tests')
xlabel('number of tests')
ylabel('sample std - population std')
legend('difference')







