close all;
clear;
arr=[1:1:100];
arr=arr';
arr2=randi(100,100,1);
boxplot(arr2)
ylim([min(arr2)-20 max(arr2)+20])
xlabel('All Vehicles')
ylabel('Miles per Gallon (MPG)')
title('Miles per Gallon for All Vehicles')



















