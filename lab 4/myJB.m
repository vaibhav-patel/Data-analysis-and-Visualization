function JB=myJB(data)
%skewness
mu1=mean(data);
n=size(data,1);
s=  ((sum((data-mu1).^(3)))/n)  /( ( (sum(((data-mu1).^(2))))/n ).^(1.5)); 

%kurtosis
kurtosis=  ((sum((data-mu1).^(4)))/n)  /( ( (sum(((data-mu1).^(2))))/n ).^(2)); 

%Jarque-bera test6
JB=(s*s + ((kurtosis-3).^2)/6)*(n/6);










