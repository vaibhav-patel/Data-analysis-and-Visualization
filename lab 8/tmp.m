close all;
clear;
load('data_lab8.mat')
MOS=MOS';
A=PSNR';
B=SSIM';


%% correaltion
n1=size(MOS,1);
mean_mos=mean(MOS)
mean_A=mean(A)
mean_B=mean(B)

figure;
plot(MOS,A,'*B');
hold on
plot(MOS,B,'.R');
figure
% cr1
num1=sum((MOS-mean_mos).*(A-mean_A));
num2= ((sum((MOS-mean_mos).^(2)))*(sum((A-mean_A).^(2))))^(0.5);
scr1=num1/num2;

% cr2
num1=sum((MOS-mean_mos).*(B-mean_B));
num2= ((sum((MOS-mean_mos).^(2)))*(sum((B-mean_B).^(2))))^(0.5);
scr2=num1/num2;
t=20000;
cr1s=zeros(t,1);
cr2s=zeros(t,1);
for i=1:t
    n1=floor(866*0.20);
    x1=randperm(866);
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

m1v=mean(cr1s)
scr1
m2v=mean(cr2s)
scr2

myHist(cr1s,50,'','','')
figure
myHist(cr2s,50,'','','')
figure;


fx1=0.5*log((1+cr1s)./(1-cr1s));
fx2=0.5*log((1+cr2s)./(1-cr2s));
%myHist(fx1,8,'','','')
%figure
%myHist(fx2,8,'','','')

% we are taking alpha=0.05

fx1=0.5*log((1+scr1)/(1-scr1))
fx2=0.5*log((1+scr2)/(1-scr2))

t_a2=1.963;
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
title('confidence interval for two datasets alpha=(0.05)')

av1=[CI1 CI2];
ylim([min(av1)-0.05 max(av1)+0.05])
xlim([0 5])


% ci

CI1 = [ (exp(2*cimin1)-1)/(exp(2*cimin1)+1)  (exp(2*cimax1)-1)/(exp(2*cimax1)+1) ]
CI2 = [ (exp(2*cimin2)-1)/(exp(2*cimin2)+1)  (exp(2*cimax2)-1)/(exp(2*cimax2)+1) ]


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
title('confidence interval for two datasets alpha=(0.05)')

av1=[CI1 CI2];
ylim([min(av1)-0.05 max(av1)+0.05])
xlim([0 5])


