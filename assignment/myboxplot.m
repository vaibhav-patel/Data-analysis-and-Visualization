function ansv=myboxplot(data,xaxis1,yaxis1,title1)
dataset=data;
sorted=sort(data);
len=size(sorted,1)
Q1d1=sorted(floor(len*0.25))
Q2d1=sorted(floor(len*0.50))
Q3d1=sorted(floor(len*0.75))
myboxplot1=[min(dataset) Q1d1 Q2d1 Q3d1 max(dataset)];
draw_data=[myboxplot1*20];
draw_data=draw_data';

n = size(draw_data, 2);
unit = (1-1/(1+n))/(1+9/(4)) ;
figure;    
set(gca,'fontsize',13)
hold on
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
ylim([min(min(draw_data))-(diff)/10  max(max(draw_data))+diff/10]);



title(title1)
xlim([0 2.5])
str=strcat('Mean= ',num2str(mean(dataset)));
text(1.2,200,str)
str=strcat('Sigma= ',num2str(std(dataset)));
text(1.2,250,str)
xlabel(xaxis1)
ylabel(yaxis1)
