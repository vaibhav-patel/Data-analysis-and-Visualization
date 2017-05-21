close all;
clear;
pop_n=100000;
pop=zeros(pop_n,1);
for i=1:pop_n/2
    pop(i)=wblrnd(1,5);
    pop(pop_n-i)=pop(i);
end

myHist2(pop,pop_n/100,'','','')




















