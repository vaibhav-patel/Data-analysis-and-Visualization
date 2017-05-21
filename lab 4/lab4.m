close all;
clear;
load('data_lab4.mat');
data=population_normal';

%histogram
bins=50;
xlabel1='Data points';
ylabel1='Frequency of the observers';
str=strcat('Histogram of the population normal  binsize=(',int2str(bins),')');
title1= str;
myHist(data,bins,xlabel1,ylabel1,title1)

sample_freq=10000;
JBs=zeros(3,sample_freq);

sizes=[50;1500;2500];
for j=1:3
    for i=1:sample_freq
        sampled_data=mysample(data,sizes(j));
        JBs(j,i)=myJB(sampled_data);
    end
end

bins=100;
for i=1:3   
    figure;
    str=strcat('Histogram of JBs for sample size=' ,int2str(sizes(i)),' freq= ',int2str(sample_freq));
    title1= str;
    myHist(JBs(i,:)',bins,xlabel1,ylabel1,title1)
end


alpha=0.05;
confidence=(1-alpha)*100;
less_than_5_99=zeros(3,1);
best_JB=JBs(3,:)';
percentage_5_99=(sum(best_JB<=5.991)/size(best_JB,1))*100


percentage_less_than_for_all_5=zeros(5,1);



%Problem 2
my_sampled_percentages = [0.01 , 0.025 ,0.050 , 0.1 , 0.900 , 0.950 , 0.975 , 0.990];
value_of_JB = [0.020 , 0.051 , 0.103 , 0.211 , 4.605 , 5.991 , 7.378 , 9.211];


errs=zeros(5,8);

%sample_50;
data=sample_50';
sizes=[25];
JBs=zeros(1,10000);
for j=1:1
    for i=1:sample_freq
        sampled_data=mysample(data,sizes(j));
        JBs(j,i)=myJB(sampled_data);
    end
end

bins=5;
for i=1:1   
    figure;
    str=strcat('sample\_50 : Histogram of JBs for sample size=' ,int2str(sizes(i)),' freq= ',int2str(sample_freq));
    title1= str;
    myHist(JBs(i,:)',bins,xlabel1,ylabel1,title1);

end
best_JB=JBs';
percentage_less_than_for_all_5(1)=(sum(best_JB<=5.991)/size(best_JB,1))*100;
mean_sqare_error=zeros(8,1);
for i = 1:8
    mean_sqare_error(i) = (sum((best_JB<=value_of_JB(i)))/length(best_JB) - my_sampled_percentages(i))^2;
    errs(1,i)=mean_sqare_error(i);
end;






%score natural;
data=score_natural_model';
sizes=[50];
JBs=zeros(1,10000);
for j=1:1
    for i=1:sample_freq
        sampled_data=mysample(data,sizes(j));
        JBs(j,i)=myJB(sampled_data);
    end
end

bins=10;
for i=1:1   
    figure;
    str=strcat('score natural : Histogram of JBs for sample size=' ,int2str(sizes(i)),' freq= ',int2str(sample_freq));
    title1= str;
    myHist(JBs(i,:)',bins,xlabel1,ylabel1,title1);
end
best_JB=JBs';
percentage_less_than_for_all_5(2)=(sum(best_JB<=5.991)/size(best_JB,1))*100;
mean_sqare_error=zeros(8,1);
for i = 1:8
    mean_sqare_error(i) = (sum((best_JB<=value_of_JB(i)))/length(best_JB) - my_sampled_percentages(i))^2;
    errs(2,i)=mean_sqare_error(i);
end;




%ammonia;
data=ammonia_concentration;
sizes=[50];
JBs=zeros(1,10000);
for j=1:1
    for i=1:sample_freq
        sampled_data=mysample(data,sizes(j));
        JBs(j,i)=myJB(sampled_data);
    end
end

bins=sizes(1)/2;
for i=1:1   
    figure;
    str=strcat('ammonia concentration : Histogram of JBs for sample size=' ,int2str(sizes(i)),' freq= ',int2str(sample_freq));
    title1= str;
    myHist(JBs(i,:)',bins,xlabel1,ylabel1,title1);
end
best_JB=JBs';
percentage_less_than_for_all_5(3)=(sum(best_JB<=5.991)/size(best_JB,1))*100;
mean_sqare_error=zeros(8,1);
for i = 1:8
    mean_sqare_error(i) = (sum((best_JB<=value_of_JB(i)))/length(best_JB) - my_sampled_percentages(i))^2;
    errs(3,i)=mean_sqare_error(i);
end;







%sample_50k;
data=sample_50k';
sizes=[250];
JBs=zeros(1,10000);
for j=1:1
    for i=1:sample_freq
        sampled_data=mysample(data,sizes(j));
        JBs(j,i)=myJB(sampled_data);
    end
end

bins=sizes(1)/2;
for i=1:1   
    figure;
    str=strcat('sample 50k : Histogram of JBs for sample size=' ,int2str(sizes(i)),' freq= ',int2str(sample_freq));
    title1= str;
    myHist(JBs(i,:)',bins,xlabel1,ylabel1,title1);
end
best_JB=JBs';
percentage_less_than_for_all_5(4)=(sum(best_JB<=5.991)/size(best_JB,1))*100;
mean_sqare_error=zeros(8,1);
for i = 1:8
    mean_sqare_error(i) = (sum((best_JB<=value_of_JB(i)))/length(best_JB) - my_sampled_percentages(i))^2;
    errs(4,i)=mean_sqare_error(i);
end;



%sample_50k;
data=data4;
sizes=[26];
JBs=zeros(1,10000);
for j=1:1
    for i=1:sample_freq
        sampled_data=mysample(data,sizes(j));
        JBs(j,i)=myJB(sampled_data);
    end
end

bins=sizes(1)/2;
for i=1:1   
    figure;
    str=strcat('data4 : Histogram of JBs for sample size=' ,int2str(sizes(i)),' freq= ',int2str(sample_freq));
    title1= str;
    myHist(JBs(i,:)',bins,xlabel1,ylabel1,title1);
end
best_JB=JBs';
percentage_less_than_for_all_5(5)=(sum(best_JB<=5.991)/size(best_JB,1))*100;
mean_sqare_error=zeros(8,1);
for i = 1:8
    mean_sqare_error(i) = (sum((best_JB<=value_of_JB(i)))/length(best_JB) - my_sampled_percentages(i))^2;
    errs(5,i)=mean_sqare_error(i);
end;

figure;
for i=1:5
    plot(my_sampled_percentages,errs(i,:)','*-','lineWidth',1.5)
    hold on
end
title('Mean square error for the datasets')
legend('sample_50','score natural','ammonia concentration','sample 50k','data4 beak size')
ylim([0 0.35])
xlabel('less than x (JB)')
ylabel('mean squared error')
