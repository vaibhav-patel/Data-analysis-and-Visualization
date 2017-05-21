close all;
clear;
load('data_lab8.mat')
arr1=xlsread('Results_Raw_Data_24obs')
MOS=arr1(:,26);
A=arr1(:,27);
B=arr1(:,28);


%% correaltion
n1=size(MOS,1);
mean_mos=mean(MOS)
mean_A=mean(A)
mean_B=mean(B)

figure;
plot(MOS,A,'*B');
hold on
plot(MOS,B,'.R');
hold on
plot(MOS,MOS,'oG');
title('scatter plot and correlation coefficient')
legend('MOS and A','MOS and B', 'actual MOS value)')
xlabel('video quality score')
ylabel('video quality score')

figure

% cr1
num1=sum((MOS-mean_mos).*(A-mean_A));
num2= ((sum((MOS-mean_mos).^(2)))*(sum((A-mean_A).^(2))))^(0.5);
scr1=num1/num2;

% cr2
num1=sum((MOS-mean_mos).*(B-mean_B));
num2= ((sum((MOS-mean_mos).^(2)))*(sum((B-mean_B).^(2))))^(0.5);
scr2=num1/num2;
t=1000;
cr1s=zeros(t,1);
cr2s=zeros(t,1);
for i=1:t
    n1=12;
    x1=randperm(144);
    x1=x1(1:n1);
    sample_MOS=MOS(x1);
    sample_A=A(x1);
    sample_B=B(x1);
    
    mean_mos=mean(sample_MOS);
    mean_A=mean(sample_A);
    mean_B=mean(sample_B);
    %sample1=
    num1=sum((sample_MOS-mean_mos).*(sample_A-mean_A));
    num2= ((sum((sample_MOS-mean_mos).^(2)))*(sum((sample_A-mean_A).^(2))))^(0.5);
    cr1=num1/num2;
    cr1s(i)=cr1;
    %sample2=
    num1=sum((sample_MOS-mean_mos).*(sample_B-mean_B));
    num2= ((sum((sample_MOS-mean_mos).^(2)))*(sum((sample_B-mean_B).^(2))))^(0.5);
    cr2=num1/num2;
    cr2s(i)=cr2;

end

myHist(cr1s,8,'value of r','','')
hold on
myHist2(cr2s,8,'value of r','frequence','histogram of the distribution of r for 1000 samples')
legend('MOS and method A','MOS and method B')
figure;

fx1=0.5*log((1+cr1s)./(1-cr1s));
fx2=0.5*log((1+cr2s)./(1-cr2s));

myHist(fx1,8,'value of r','frequence','histogram of the distribution of r for 1000 samples')
hold on
myHist2(fx2,8,'value of transformed r','frequence','histogram of the distribution of transformed r for 1000 samples')
legend('MOS and method A','MOS and method B')
% we are taking alpha=0.05

fx1=0.5*log((1+scr1)/(1-scr1));
fx2=0.5*log((1+scr2)/(1-scr2));
t_a2=1.977;
cimin1=fx1-t_a2/((size(MOS,1)-3)^(0.5));
cimax1=fx1+t_a2/((size(MOS,1)-3)^(0.5));

cimin2=fx2-t_a2/((size(MOS,1)-3)^(0.5));
cimax2=fx2+t_a2/((size(MOS,1)-3)^(0.5));


int1=cimax1-cimin2;

CI1 = [cimin1 cimax1]
CI2 = [cimin2 cimax2]


%%
figure;
plot([1 2],[CI1(1) CI1(1)],'lineWidth',2)
hold on
plot([1 2],[CI1(2) CI1(2)],'lineWidth',2)
hold on
plot([1.5 1.5], CI1,'lineWidth',2)
hold on
plot([3 4],[CI2(1) CI2(1)],'lineWidth',2)
hold on
plot([3 4],[CI2(2) CI2(2)],'lineWidth',2)
hold on
plot([3.5 3.5], CI2,'lineWidth',2)
xlabel('data1                            data2')
ylabel('confidence interval')
title('confidence interval of f for two datasets alpha=(0.05)')

av1=[CI1 CI2];
ylim([min(av1)-0.05 max(av1)+0.05])
xlim([0 5])


% ci

CI1 = [ (exp(2*cimin1)-1)/(exp(2*cimin1)+1)  (exp(2*cimax1)-1)/(exp(2*cimax1)+1) ]
CI2 = [ (exp(2*cimin2)-1)/(exp(2*cimin2)+1)  (exp(2*cimax2)-1)/(exp(2*cimax2)+1) ]
pause

%%
figure;
plot([1 2],[CI1(1) CI1(1)],'lineWidth',2)
hold on
plot([1 2],[CI1(2) CI1(2)],'lineWidth',2)
hold on
plot([1.5 1.5], CI1,'lineWidth',2)
hold on
plot([3 4],[CI2(1) CI2(1)],'lineWidth',2)
hold on
plot([3 4],[CI2(2) CI2(2)],'lineWidth',2)
hold on
plot([3.5 3.5], CI2,'lineWidth',2)
xlabel('data1                            data2')
ylabel('confidence interval')
title('confidence interval of correlation values for two datasets alpha=(0.05)')

av1=[CI1 CI2];
ylim([min(av1)-0.05 max(av1)+0.05])
xlim([0 5])


%%calculating outliers
o1=0;
o2=0;

m1=mean(MOS);
ma=mean(A);
mb=mean(B);
s1=std(MOS);
n1=size(MOS,1);
tval1=1.977;

cimin1=m1-(s1*tval1)/(n1^(0.5));
cimax1=m1+(s1*tval1)/(n1^(0.5));
CI1=[cimin1 cimax1];

o1s=zeros(144,1);
o2s=zeros(144,1);

for i=1:size(MOS,1)
    sample1=arr1(i,1:24);
    m1=mean(sample1);
    s1=std(sample1);
    n1 = 24;
    tval1=1.977;
    cimin1=m1-(s1*tval1)/(n1^(0.5));
    cimax1=m1+(s1*tval1)/(n1^(0.5));
    CI1=[cimin1 cimax1];

    if(A(i)<CI1(1) || A(i)>CI1(2))
        o1=o1+1;
    end 
    if(B(i)<CI1(1) || B(i)>CI1(2))
        o2=o2+1;
    end     
    o1s(i)=o1;
    o2s(i)=o2;
end
figure;
plot(1:1:144,o1s,'lineWidth',2)
hold on
plot(1:1:144,o2s,'r','lineWidth',2)
xlabel('data points')
ylabel('cumulative outlier so far')
title('cumulative outliers vs data points (videos)')
legend('method A','method B')



