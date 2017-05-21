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
cr1sv=cr1s;
cr2sv=cr2s;
for i =2: t
    cr1sv(i)=cr1sv(i)+cr1sv(i-1);
    cr2sv(i)=cr2sv(i)+cr2sv(i-1);
end

for i =1: t
    cr1sv(i)=cr1sv(i)/i;
    cr2sv(i)=cr2sv(i)/i;
    
end

figure
plot(1:1:t,cr1sv,'r','lineWidth',1.5)
hold on
plot(1:1:t,cr2sv,'g','lineWidth',1.5)
title('average value of the cr as n increases')
xlabel('sampling experiments')
ylabel('mean of the cr values')
legend('PSNR','SSIM')
figure
m1v=mean(cr1s)
scr1
m2v=mean(cr2s)
scr2

myHist(cr1s,50,'','','')
hold on
myHist2(cr2s,50,'value of r','frequence','histogram of the distribution of for 20000 samples')
legend('with PSNR','with SSIM')



fx1=0.5*log((1+cr1s)./(1-cr1s));
fx2=0.5*log((1+cr2s)./(1-cr2s));
%myHist(fx1,8,'','','')
%figure
%myHist(fx2,8,'','','')

% we are taking alpha=0.05

fx1=0.5*log((1+m1v)/(1-scr1));
fx2=0.5*log((1+m2v)/(1-scr2));

t_a2=1.963;
cimin1=fx1-t_a2/((20000-3)^(0.5));
cimax1=fx1+t_a2/((20000-3)^(0.5));

cimin2=fx2-t_a2/((20000-3)^(0.5));
cimax2=fx2+t_a2/((20000-3)^(0.5));


int1=cimax1-cimin2;

CI1 = [cimin1 cimax1];
CI2 = [cimin2 cimax2];



% ci

CI1 = [ (exp(2*cimin1)-1)/(exp(2*cimin1)+1)  (exp(2*cimax1)-1)/(exp(2*cimax1)+1) ];
CI2 = [ (exp(2*cimin2)-1)/(exp(2*cimin2)+1)  (exp(2*cimax2)-1)/(exp(2*cimax2)+1) ];

% ci

figure
plot([5 6],[CI1(1) CI1(1)],'lineWidth',2)
hold on
plot([5 6],[CI1(2) CI1(2)],'lineWidth',2)
hold on
plot([5.5 5.5], CI1,'lineWidth',2)
hold on
plot([7 8],[CI2(1) CI2(1)],'lineWidth',2)
hold on
plot([7 8],[CI2(2) CI2(2)],'lineWidth',2)
hold on
plot([7.5 7.5], CI2,'lineWidth',2)

av1=[CI1 CI2];
ylim([min(av1)-0.05 max(av1)+0.05])
xlim([0 10])

hold on

fx1=0.5*log((1+scr1)/(1-scr1));
fx2=0.5*log((1+scr2)/(1-scr2));

t_a2=1.963;
cimin1=fx1-t_a2/((size(MOS,1)-3)^(0.5));
cimax1=fx1+t_a2/((size(MOS,1)-3)^(0.5));

cimin2=fx2-t_a2/((size(MOS,1)-3)^(0.5));
cimax2=fx2+t_a2/((size(MOS,1)-3)^(0.5));


int1=cimax1-cimin2;

CI1 = [cimin1 cimax1];
CI2 = [cimin2 cimax2];


CI1 = [ (exp(2*cimin1)-1)/(exp(2*cimin1)+1)  (exp(2*cimax1)-1)/(exp(2*cimax1)+1) ];
CI2 = [ (exp(2*cimin2)-1)/(exp(2*cimin2)+1)  (exp(2*cimax2)-1)/(exp(2*cimax2)+1) ];

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
xlabel('  PSNR         SSIM          sample PSNR       sample SSIM   ')
ylabel('confidence interval')
title('confidence interval of correlation coeff comparision  for the two methods alpha=(0.05)')

av1=[CI1 CI2];
ylim([0.74 0.88])
xlim([0 10])

