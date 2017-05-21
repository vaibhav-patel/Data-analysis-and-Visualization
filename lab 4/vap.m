%% Lab3 - 201401222 - 201401409
% Load data_lab3.mat. ‘ammonia_concentration’ provides the ammonia 
% concentration values (in mg/L) from a water treatment plant during a certain period. 
%%  Problem 1
% Suppose you are asked to assume that this data is normally distributed.
% How will you confirm/reject this assumption using boxplots, histograms and 
% estimated data statistics (mean, standard deviation etc.). 
% You should explicitly list the features/aspects that you considered in order to arrive at your answer. 
%%
% Answer :
% After plotting boxplot, histogram and calculating mean and standard deviation,
% we've come to a conclusion that this data is approximately normally distributed.
% Further details are given below the figures.

close all;
clear;
load('data_lab3.mat');

dataset=ammonia_concentration;
% sorting the data for getting the values of Q1, Q2, Q3.
sorted=sort(dataset);
len=size(sorted,1);
Q1d1=sorted(floor(len*0.25))
Q2d1=sorted(floor(len*0.50))
Q3d1=sorted(floor(len*0.75))
myboxplot1=[min(dataset) Q1d1 Q2d1 Q3d1 max(dataset)];

draw_data=[myboxplot1*20];
draw_data=draw_data';

n = size(draw_data, 2);
unit = (1-1/(1+n))/(1+9/(4)) ;
figure;    
hold on;       
for i = 1:n
    arr = draw_data(:,i);
    plot([i-unit, i+unit], [arr(5), arr(5)], 'LineWidth', 2);
    plot([i-unit, i+unit], [arr(1), arr(1)], 'LineWidth', 2);
    plot([i-unit, i+unit], [arr(3), arr(3)], 'LineWidth', 2);
    plot([i, i], [arr(5), arr(4)], 'LineWidth', 2);
    plot([i, i], [arr(2), arr(1)], 'LineWidth', 2);
    plot([i-unit, i+unit, i+unit, i-unit, i-unit], [arr(2), arr(2), arr(4), arr(4), arr(2)], 'LineWidth', 2);
end
diff=max(max(draw_data))- min(min(draw_data));
%For representing the data nicely
ylim([min(min(draw_data))-(diff)/10  max(max(draw_data))+diff/10]);

ylabel('Values')

title('BoxPlot of the ammonia concentration')
xlim([0 2.5])
str=strcat('Amm. con. Mean= ',num2str(mean(dataset)));
text(1.2,800,str)
str=strcat('Amm. con. Sigma= ',num2str(std(dataset)));
text(1.2,1000,str)
pause
%%
% From the plot we can see that in SAM data third quartile 
% is closer to median as compared to first quartile. 
% Whereas in SAM data, meadin lies approximately at the same distance from first and third quartiles.
% So, we can say that in SAM there is less variation copared to ACR.
% This is justified because in method one the Observed had to choose between 5 discrete values.
% And in the second method user was free to choose between 100 different
% choices (Still discrete but more "continuos" in nature). As one can
% argue that we have given average of 29 different users in ACR that is why
% Our given data was continuous in nature (from 1 to 5 floating point
% value). But the data inhereatantly was continuous before so, its effect has
% to reflect in the average.
% Now, we can also make another mathmatical argument that in the second case there were more number of observers
% so, the graph becomes more clear. Because After taking infinte number of observers we can find the exact value of the
% ACR or SAM analysis (The method themselves depend on the user, that's
% anothe issue).
% This shows that there is a
% bit uniformity in variation in SAMVIQ. Variation in ACR is more than
% that in SAMVIQ. ACR is observed by lesser number of observers as 
% compared to SAMVIQ. This means that there are more data sets to work 
% on for SAMVIQ. ACR exhibits higher variability around median. Also, 
% as number of data set increases, more and more proportion of data will be 
% concentrated about median or in other words median will be closer to mean.
%% Problem 2
% Which of the two, ACR or SAMVIQ, leads to mathematical outliers 
% (assume points beyond Q3 + w*IQR or Q1 - w*IQR with w = 1.5, 
% as mathematical outliers)? Any reason(s)? 
%%

%% 
% Answer:2
% There was more skewness in the ACR dataset, there are more chances of
% getting outliers in it.
% The data was somewhat aligned to the meadian in the SAM data. So the
% chances here are low.
% Ideally, both of the above inferences should not be made. Because we don't know about the data for now.
% After plotting histogram (In the C part), we can make some arguments
% about this question.ata
% Visualizing the outliers in the ACR dataset
IQR1=Q3d1-Q1d1
w=1.5;

outliers_left1= (dataset<= Q1d1 -w*IQR1);
outliers_right1=(dataset >= Q3d1 + w*IQR1);
outliers1=(outliers_left1 | outliers_right1);
outliers_data1=zeros(size(dataset));
for i=1:size(dataset,1)
    if(outliers1(i)==1)
        outliers_data1(i)=dataset(i);
    end
end
figure;
stem(dataset)
hold on
stem(outliers_data1,'ro')
%legend('Normal data','Outliers')
diff=max(max(dataset)) -min(min(dataset));
%For representing the data nicely
ylim([0.2 max(max(dataset))+diff/8 ])
%title('Outlier Analysis ACR')
%% 
% We got two outliers in the ACR data. But the inference was a long shot.
%% 
% Visualizing the outliers in the SAM dataset
%% 
% We got no outliers in the SAM data. But the inference was a long shot.

%% Problem 3
% Plot the histograms for the two cases (label the axes clearly). 
% Describe the skewness of the two histograms. 
% Can we comment on skewness without plotting the histogram?
%% 
% Histogram of the ACR dataset
data=ammonia_concentration;
bins=50;
histArr=zeros(1,bins);
min1=min(min(data));
max1=max(max(data));
diff=(max1-min1)/bins;
values=min1+diff/2:diff:max1-diff/2;
for i=1:size(data,1)
    for j=1:bins
        if(data(i,1)>=min1+(j-1)*diff & data(i,1) < min1+j*diff)
            histArr(j) =histArr(j) + 1; 
            break;
        end
    end
end
figure;
bar(values,histArr);
mu=mean(data);
sigma=std(data);
%normal_curve=zeros(size(data));
%for i=1:size(data,1)ata
%    normal-curve(i)=exp(-(data-))
%end
dd=sort(data)
normal_curve=exp(-((dd-mu).^2)/(2*sigma*sigma)) ./(sigma*((2*pi)^(0.5)));
%hold on
figure
plot(dd,normal_curve)
%q2
data=ammonia_concentration;
gt_40=sum(data>40);
per_40=gt_40/size(data,1)

(40-mu)/sigma
% referring from the normal distribution table table 
1-0.67
data=score_natural_model;
mu2=mean(data)
sigma2=std(data)
dd=sort(data)
min1=min(min(data))
max1=max(max(data))
figure
normal_curve=exp(-((dd-mu2).^2)/(2*sigma2*sigma2)) ./(sigma2*((2*pi)^(0.5)));
plot(dd,normal_curve,'lineWidth',3)


data2=score_test

data(data<0)
%only one values is negative and that too is very small ~ zero.
% that's why we are taking absolute values
data=abs(data);

figure;
%rayleigh
sigma2=0.6451;
rayleigh_curve=(dd./(sigma2*sigma2)).*(exp(-(dd.*dd)./(2*sigma2*sigma2)));
plot(dd,rayleigh_curve,'lineWidth',3)






%%
% From the plot we can see that in SAM data third quartile 
% is closer to median as compared to first quartile. 
% Whereas in SAM data, meadin lies approximately at the same distance from first and third quartiles.
% So, we can say that in SAM there is less variation copared to ACR.
% This is justified because in method one the Observed had to choose between 5 discrete values.
% And in the second method user was free to choose between 100 different
% choices (Still discrete but more "continuos" in nature). As one can
% argue that we have given average of 29 different users in ACR that is why
% Our given data was continuous in nature (from 1 to 5 floating point
% value). But the data inhereatantly was continuous before so, its effect has
% to reflect in the average.
% Now, we can also make another mathmatical argument that in the second case there were more number of observers
% so, the graph becomes more clear. Because After taking infinte number of observers we can find the exact value of the
% ACR or SAM analysis (The method themselves depend on the user, that's
% anothe issue).
% This shows that there is a
% bit uniformity in variation in SAMVIQ. Variation in ACR is more than
% that in SAMVIQ. ACR is observed by lesser number of observers as 
% compared to SAMVIQ. This means that there are more data sets to work 
% on for SAMVIQ. ACR exhibits higher variability around median. Also, 
% as number of data set increases, more and more proportion of data will be 
% concentrated about median or in other words median will be closer to mean.
%% Problem 2
% Which of the two, ACR or SAMVIQ, leads to mathematical outliers 
% (assume points beyond Q3 + w*IQR or Q1 - w*IQR with w = 1.5, 
% as mathematical outliers)? Any reason(s)? 
%%

%% 
% Answer:2
% There was more skewness in the ACR dataset, there are more chances of
% getting outliers in it.
% The data was somewhat aligned to the meadian in the SAM data. So the
% chances here are low.
% Ideally, both of the above inferences should not be made. Because we don't know about the data for now.
% After plotting histogram (In the C part), we can make some arguments
% about this question.ata
% Visualizing the outliers in the ACR dataset
IQR1=Q3d1-Q1d1
w=1.5;

outliers_left1= (dataset<= Q1d1 -w*IQR1);
outliers_right1=(dataset >= Q3d1 + w*IQR1);
outliers1=(outliers_left1 | outliers_right1);
outliers_data1=zeros(size(dataset));
for i=1:size(dataset,1)
    if(outliers1(i)==1)
        outliers_data1(i)=dataset(i);
    end
end
figure;
stem(dataset)
hold on
stem(outliers_data1,'ro')
%legend('Normal data','Outliers')
diff=max(max(dataset)) -min(min(dataset));
%For representing the data nicely
ylim([0.2 max(max(dataset))+diff/8 ])
%title('Outlier Analysis ACR')
%% 
% We got two outliers in the ACR data. But the inference was a long shot.
%% 
% Visualizing the outliers in the SAM dataset
%% 
% We got no outliers in the SAM data. But the inference was a long shot.

%% Problem 3
% Plot the histograms for the two cases (label the axes clearly). 
% Describe the skewness of the two histograms. 
% Can we comment on skewness without plotting the histogram?
%% 
% Histogram of the ACR dataset
data=ammonia_concentration;
bins=50;
histArr=zeros(1,bins);
min1=min(min(data));
max1=max(max(data));
diff=(max1-min1)/bins;
values=min1+diff/2:diff:max1-diff/2;
for i=1:size(data,1)
    for j=1:bins
        if(data(i,1)>=min1+(j-1)*diff & data(i,1) < min1+j*diff)
            histArr(j) =histArr(j) + 1; 
            break;
        end
    end
end
figure;
bar(values,histArr);
mu=mean(data);
sigma=std(data);
%normal_curve=zeros(size(data));
%for i=1:size(data,1)ata
%    normal-curve(i)=exp(-(data-))
%end
dd=sort(data)
normal_curve=exp(-((dd-mu).^2)/(2*sigma*sigma)) ./(sigma*((2*pi)^(0.5)));
%hold on
figure
plot(dd,normal_curve)
%q2
data=ammonia_concentration;
gt_40=sum(data>40);
per_40=gt_40/size(data,1)

(40-mu)/sigma
% referring from the normal distribution table table 
1-0.67
data=score_natural_model;
mu2=mean(data)
sigma2=std(data)
dd=sort(data)
min1=min(min(data))
max1=max(max(data))
figure
normal_curve=exp(-((dd-mu2).^2)/(2*sigma2*sigma2)) ./(sigma2*((2*pi)^(0.5)));
plot(dd,normal_curve,'lineWidth',3)


data2=score_test

data(data<0)
%only one values is negative and that too is very small ~ zero.
% that's why we are taking absolute values
data=abs(data);

figure;
%rayleigh
sigma2=0.6451;
rayleigh_curve=(dd./(sigma2*sigma2)).*(exp(-(dd.*dd)./(2*sigma2*sigma2)));
plot(dd,rayleigh_curve,'lineWidth',3)






