close all;
clear;
load('data_lab6.mat');
%% For data1
alg1=saliency_map_Tunnel_processing1;
alg2=saliency_map_Tunnel_processing2;
r=size(alg1,1);
c=size(alg1,2);
tile=10;
ts=zeros(r-tile,c-tile);
es=zeros(r-tile,c-tile);
for i=1:r-tile
    for j=1:c-tile
        sample1=alg1(i:i+tile,j:j+tile);
        sample2=alg2(i:i+tile,j:j+tile);
        sample1=sample1(:);
        sample2=sample2(:);
        
        data2=sample1-sample2;
        m1=mean(data2);
        std1=std(data2);
        n=size(sample1,1);

        % Should we do the t-test?
        if(std1<0.001)
            continue;
        else
            ES=(mean(sample1) -mean(sample2) )/std1;
            es(i,j)=ES;
            t_value=abs(m1)/(std1/(n^(0.5)));
            ts(i,j)=t_value;
        end
    end
    i
end

%% sec 2
ts=ts(:);
es=es(:);

ts1=mean(ts)
ts2=mean(es)


















