close all;
clear;
load('data_lab6.mat');
%% For data1
alg1=saliency_map_Tunnel_processing1(:);
alg2=saliency_map_Tunnel_processing2(:);
data2=alg1-alg2;
m1=mean(data2);
std1=std(data2);
n=size(alg1,1);142.1

% Should we do the t-test?
ES=(mean(alg1) -mean(alg2) )/std1

% paired t-test
t_value=abs(m1)/(std1/(n^(0.5)))

    % unpaired t-test
    sample_size=size(alg1,1);
    s1=alg1;
    s2=alg2;
    mean1=mean(s1)
    mean2=mean(s2)
    p1=var(s1);
    p2=var(s2);
    t=1;
    t=t*(mean1-mean2);
    t=t/((2/sample_size)^(0.5));
    t=t/(((p1*(sample_size-1) +p2*(sample_size-1) )/ (2*sample_size-2))^(0.5))


%% For data2
alg1=Saliency_Map_dani_belgium_processing1(:);
alg2=Saliency_Map_dani_belgium_processing2(:);
data2=alg1-alg2;
m1=mean(data2);
std1=std(data2);
n=size(alg1,1);

% Should we do the t-test?
ES=(mean(alg1) -mean(alg2) )/std1;

% paired t-test
t_value=abs(m1)/(std1/(n^(0.5)));

% unpaired t-test
sample_size=size(alg1,1);
s1=alg1;
s2=alg2;
mean1=mean(s1);
mean2=mean(s2);
p1=var(s1);
p2=var(s2);
t=1;
t=t*(mean1-mean2);
t=t/((2/sample_size)^(0.5));
t=t/(((p1*(sample_size-1) +p2*(sample_size-1) )/ (2*sample_size-2))^(0.5));
















