close all;
clear;
% taking mu=10;
% sigma=2;
n=1000;
m_orig=10;
s_orig=2;

%normal samples with similar variances,
arr=normrnd(m_orig,s_orig,n,1);
myboxplot(arr,'','','')
figure
myHist2(arr,n/2,'','','')

mean_difference=m_orig-mean(arr)
sigma_difference=s_orig-std(arr)

t=1000;
t_values=zeros(t,1);
sigmas=zeros(t,1);
means=zeros(t,1);

%performing t-test
for i=1:t
    mr=m_orig+(rand()-0.5)*2;
    sr=s_orig+(rand()-0.5)*2;
    arr=normrnd(mr ,sr,n,1);
    t_values(i)=(mean(arr)-m_orig)/(s_orig/(n^(0.5)));
    sigmas(i)=std(arr);
    means(i)=mean(arr);   
end
figure;
myHist3(t_values,t/10,'','','')
mt1=mean(t_values);
st1=std(t_values);
hold on;
x = -50:0.1:50;
y = tpdf(x,5);
plot(x,y,'-r')
%di1=normrnd(mt1,st1,10000*t,1);
%myHist4(di1,t,'','','')
legend('histogram of the t-test','actual t-distribution')

figure;
plot(1:1:t,abs(sigmas-s_orig),'lineWidth',2.5)
title('difference of sigma throughout the tests')

figure;
plot(1:1:t,abs(means-m_orig),'lineWidth',2.5)
title('difference of mean throughout the tests')












