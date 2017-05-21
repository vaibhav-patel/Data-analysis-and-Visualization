close all;
clear;
n=10000;
arr1=wblrnd(0.5,2,n1,1); 
arr2=normrnd( 0.4424,0.2298,n2,1);
m1=mean(arr1);
m2=mean(arr2);
s1=std(arr1);
s1=s1*s1;
s2=std(arr2);
s2=s2*s2;

tv1=(m1-m2)/(((s1*(n1-1)+s2*(n2-1))/(n1+n2-2))^(0.5));
tv1=tv1/((1/n1+1/n2)^(0.5));









