close all;
clear;
load('data_lab5.mat');

mos=zeros(4,1);
mos(1)=mean(src1_720p_upscaled_3Mb);
mos(2)=mean(src1_720p_upscaled_9Mb);
mos(3)=mean(src1_fullHD_3Mb);
mos(4)=mean(src1_fullHD_9Mb);
mos
% Here Mean opinion score is less for the true full HD resolution which may
% not be true.



% 3mb
sample_size=26;
s1=src1_720p_upscaled_3Mb;
s2=src1_fullHD_3Mb;
mean1=mean(s1);
mean2=mean(s2);
p1=var(s1);
p2=var(s2);
t=1;
t=t*(mean1-mean2);
t=t/((2/26)^(0.5));
t=t/(((p1*25 +p2*25 )/ 50)^(0.5))

% 9mb
s1=src1_720p_upscaled_9Mb;
s2=src1_fullHD_9Mb;
mean1=mean(s1);
mean2=mean(s2);
p1=var(s1);
p2=var(s2);
t=1;
t=t*(mean1-mean2);
div=(p1*25 +p2*25 )*(2/26);
div=div/(50);
div=div^(0.5);
t=t/div



[x,y,c,st]=ttest2(src1_720p_upscaled_3Mb', src1_fullHD_3Mb')
[x,y,c,st]=ttest2(src1_720p_upscaled_9Mb', src1_fullHD_9Mb')





