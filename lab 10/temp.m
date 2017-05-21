clear;
close all;
xlsread('lab10.xls');
data=ans;


e_data=zeros(3,3,8,26);
x=3;
for i=x:x+7
    e_data(1,1,i-x+1,:)=data(3+ i-x,6:31);
end

x=x+10;
for i=x:x+7
    e_data(1,2,i-x+1,:)=data(x+ i-x,6:31);
end

x=x+10;
for i=x:x+7
    e_data(1,3,i-x+1,:)=data(x+ i-x,6:31);
end

x=x+9;
for i=x:x+7
    e_data(2,1,i-x+1,:)=data(x+ i-x,6:31);
end

x=x+10;
for i=x:x+7
    e_data(2,2,i-x+1,:)=data(x+ i-x,6:31);
end

x=x+10;
for i=x:x+7
    e_data(2,3,i-x+1,:)=data(x+ i-x,6:31);
end


x=x+9;
for i=x:x+7
    e_data(3,1,i-x+1,:)=data(x+ i-x,6:31);
end


x=x+10;
for i=x:x+7
    e_data(3,2,i-x+1,:)=data(x+ i-x,6:31);
end


x=x+10;
for i=x:x+7
    e_data(3,3,i-x+1,:)=data(x+ i-x,6:31);
end

%% vid1 analysis
co=3;
means=zeros(3,8);
for i=1:3
    for j=1:8
        means(i,j)=mean(e_data(co,i,j,:));
    end
end
fin_mean_A=zeros(3,1);
for i=1:3
    fin_mean_A(i)=mean(means(i,:));
end
fin_mean_B=zeros(8,1);
for i=1:8
    fin_mean_B(i)=mean(means(:,i));
end

mean_total=mean(mean(means));

ss_total=0;
for i =1:3
    for j=1:8
        ss_total=ss_total+ sum(((e_data(co,i,j,:)- mean_total ).^(2)));
    end
end

data2=zeros(3*26,8);
count=1;
for i=1:3
    for j=1:8
        for k=1:26
            data2( (i-1)*26 + k ,j  )=e_data(co,i,j,k);
        end
    end
end
anova2(data2,26)


ss_A=0;
for i =1:3
        ss_A=ss_A+ sum(((  fin_mean_A(i)   - mean_total ).^(2)));
end
ss_A=ss_A*8*26;

ss_B=0;
for i =1:8
        ss_B=ss_B+ sum(((  fin_mean_B(i)   - mean_total ).^(2)));
end
ss_B=ss_B*3*26;

ss_AB=0;
for i =1:3
    for j=1:8
        ss_AB=ss_AB+ sum(((  means(i,j) -fin_mean_A(i) -fin_mean_B(j)  + mean_total ).^(2)));
    end
end
ss_AB=ss_AB*26;

ss_w=0;
for i =1:3
    for j=1:8
        ss_w=ss_w+ sum(((e_data(co,i,j,:)- means(i,j) ).^(2)));
    end
end



ss_A+ss_B+ss_AB+ss_w;
ms_A=ss_A/2;
ms_B=ss_B/7;
ms_AB=ss_AB/14;
ms_w=ss_w/600;

F_A=ms_A/ms_w;
F_B=ms_B/ms_w;
F_AB=ms_AB/ms_w;

