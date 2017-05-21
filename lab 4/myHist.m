function ansv=myHist(data,bins,xaxis1,yaxis1,title1)

histArr=zeros(1,bins);
min1=min(min(data));
max1=max(max(data));
diff=(max1-min1)/bins;
values=min1+diff/2:diff:max1-diff/2;
for i=1:size(data,1)
    for j=1:bins
        if (data(i,1)>=min1+(j-1)*diff && data(i,1) < min1+j*diff)
            histArr(j) =histArr(j) + 1; 
            break;
        end
    end
end
bar(values,histArr);
xlabel(xaxis1);
ylabel(yaxis1);
title(title1,'fontweight','bold');
ansv=0;





