close all;
clear;
load('data_lab7.mat')
arr1=psnr1';
arr2=psnr2';



mean1=mean(arr1)
mean2=mean(arr2)

s1=std(arr1)
s2=std(arr2)

n1=size(arr1,1)
n2=size(arr2,1)
tval1=2.571
tval2=tval1

cimin1=mean1-(s1*tval1)/(n1^(0.5));
cimin2=mean2-(s2*tval2)/(n2^(0.5));

cimax1=mean1+(s1*tval1)/(n1^(0.5));
cimax2=mean2+(s2*tval2)/(n2^(0.5));


int1=cimax1-cimin2;

CI1 = [cimin1 cimax1]
CI2 = [cimin2 cimax2]



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
title('confidence interval for two dataset (0.05)')

av1=[CI1 CI2];
ylim([min(av1)-0.5 max(av1)+0.5])
xlim([0 5])




mean1=mean(arr1);
mean2=mean(arr2);

s1=std(arr1);
s2=std(arr2);

n1=size(arr1,1);
n2=size(arr2,1);

abc1=(s1*s1*(n1-1)+ s2*s2*(n2-1))/(n1+n2-2);
abc2=(1/n1 +1/n2)^(0.5);
abc1=abc1^(0.5);

abc1=abc1*abc2;


tval1=1.963;
abc1=abc1*tval1;



cimin1=mean1-mean2-abc1;
cimax1=mean1-mean2+abc1;

CI=[cimin1 cimax1]
 

figure;
plot([1 2],[CI(1) CI(1)],'lineWidth',2)
hold on
plot([1 2],[CI(2) CI(2)],'lineWidth',2)
hold on
plot([1.5 1.5], CI,'lineWidth',2)
xlabel('difference')
ylabel('confidence interval')
title('confidence interval for two datasets')


av1=CI ;
ylim([min(av1)-0.05 max(av1)+0.05])
xlim([0 3])




int1=abs(int1)
av=[CI int1];
CI=abs(CI);
figure;
plot([min(av)-0.5 max(av)+5],[ 0 0], 'lineWidth',2)
hold on
plot([min(CI) min(CI)], [ 0 0.5], 'lineWidth',2)
hold on
plot([int1 int1], [ 0 -0.5], 'lineWidth',2)
hold on


xlim([min(av)-0.5 max(av)+5])
ylim([-1 1])







arr1=psnr1';
arr2=psnr2';



mean1=mean(arr1);
mean2=mean(arr2);

s1=std(arr1);
s2=std(arr2);

n1=size(arr1,1);
n2=size(arr2,1);

tval1=4.033;
tval2=tval1;

cimin1=mean1-(s1*tval1)/(n1^(0.5));
cimin2=mean2-(s2*tval2)/(n2^(0.5));

cimax1=mean1+(s1*tval1)/(n1^(0.5));
cimax2=mean2+(s2*tval2)/(n2^(0.5));


int1=cimax1-cimin2;

CI1 = [cimin1 cimax1];
CI2 = [cimin2 cimax2];



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
title('confidence interval for two dataset (0.01)')

av1=[CI1 CI2];
ylim([min(av1)-0.5 max(av1)+0.5])
xlim([0 5])





mean1=mean(arr1);
mean2=mean(arr2);

s1=std(arr1);
s2=std(arr2);

n1=size(arr1,1);
n2=size(arr2,1);

abc1=(s1*s1*(n1-1)+ s2*s2*(n2-1))/(n1+n2-2);
abc2=(1/n1 +1/n2)^(0.5);
abc1=abc1^(0.5);

abc1=abc1*abc2;


tval1=1.963;
abc1=abc1*tval1;



cimin1=mean1-mean2-abc1;
cimax1=mean1-mean2+abc1;

CI=[cimin1 cimax1]


figure;
plot([1 2],[CI(1) CI(1)],'lineWidth',2)
hold on
plot([1 2],[CI(2) CI(2)],'lineWidth',2)
hold on
plot([1.5 1.5], CI,'lineWidth',2)
xlabel('difference')
ylabel('confidence interval')
title('confidence interval for two datasets')


av1=CI ;
ylim([min(av1)-0.05 max(av1)+0.05])
xlim([0 3])



int1=abs(int1)
av=[CI int1];
CI=abs(CI);
figure;
plot([min(av)-0.5 max(av)+5],[ 0 0], 'lineWidth',2)
hold on
plot([min(CI) min(CI)], [ 0 0.5], 'lineWidth',2)
hold on
plot([int1 int1], [ 0 -0.5], 'lineWidth',2)
hold on


xlim([min(av)-0.5 max(av)+5])
ylim([-1 1])






alg1=psnr1';
alg2=psnr2';
data2=alg1-alg2;
m1=mean(data2);
std1=std(data2);
n=size(alg1,1);

% Should we do the t-test?
ES=(mean(alg1) -mean(alg2) )/std1

% paired t-test
t_value=abs(m1)/(std1/(n^(0.5)))

tv1=2.015
tv2=3.365

if (t_value>tv1)
    'reject 0.05'
else
    'accept 0.05'
end


if (t_value>tv2)
    'reject 0.01'
else
    'accept 0.01'
end




