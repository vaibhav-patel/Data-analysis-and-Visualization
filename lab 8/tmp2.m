close all;
clear all;
load('data_lab8.mat');
%data=xlsread('Results_Raw_Data_24obs.xls');


r1=zeros(20000,1);
r2=zeros(20000,1);

indices=zeros(865/5,1);
n=865/5;
for e=1:20000
    R = randperm(866);
    z = 865/5;
    for j=1:z
        indices(j) = R(j);
    end
    MOS1=MOS(indices);
    dataA = PSNR(indices);
    dataB = SSIM(indices);
    
    m1=mean(MOS1);
    m2=mean(dataA);
    m3=mean(dataB);
    
    r=0;
    x=0;
    y=0;
    for i=1:n
        r=r+((MOS1(i)-m1)*(dataA(i)-m2));
    end
    for i=1:n
        x=x+(MOS1(i)-m1)*(MOS1(i)-m1);
    end
    for i=1:n
        y=y+(dataA(i)-m2)*(dataA(i)-m2);
    end
    r1(e)=r/sqrt(x*y);

   

    


    r=0;
    x=0;
    y=0;
    for i=1:n
        r=r+((MOS1(i)-m1)*(dataB(i)-m3));
    end
    for i=1:n
        x=x+(MOS1(i)-m1)*(MOS1(i)-m1);
    end
    for i=1:n
        y=y+(dataB(i)-m3)*(dataB(i)-m3);
    end
    r2(e)=r/sqrt(x*y);

    

end;
r1=mean(r1)
r2=mean(r2)
    f=0.5*log((1+r1)/(1-r1));
    t_a2=1.977;
    f_lower=f-(t_a2/sqrt(20000-3));
    f_upper=f+(t_a2/sqrt(20000-3));
    r_lower=(exp(2*f_lower)-1)/(exp(2*f_lower)+1)
    r_upper=(exp(2*f_upper)-1)/(exp(2*f_upper)+1)
        
figure;
    plot([1.2 1.4],[r_lower r_lower],'lineWidth',2)
    hold on
    plot([1.2 1.4],[r_upper r_upper],'lineWidth',2)
    hold on
    plot([1.3 1.3], [r_lower r_upper],'lineWidth',2)
    hold on;
    f=0.5*log((1+r2)/(1-r2));
    t_a2=1.977;
    f_lower=f-(t_a2/sqrt(20000-3));
    f_upper=f+(t_a2/sqrt(20000-3));
    r_lower=(exp(2*f_lower)-1)/(exp(2*f_lower)+1)
    r_upper=(exp(2*f_upper)-1)/(exp(2*f_upper)+1)
plot([1.7 1.9],[r_lower r_lower],'lineWidth',2)
hold on
plot([1.7 1.9],[r_upper r_upper],'lineWidth',2)
hold on
plot([1.8 1.8], [r_lower r_upper],'lineWidth',2)
xlim([1 2]);
xlabel('       PSNR                                        SSIM' )
ylabel('Correlation Value');
title('Confidence Interval for Correlation')