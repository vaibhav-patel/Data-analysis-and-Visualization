load('signal_lab1.mat')
fs = 1000
len = length(signal2);
ans = zeros(len);
sample_frequency = 100;
sample_points = randperm(fs-1, sample_frequency-2);
sample_points = sort(sample_points);
sample_points=[1 sample_points];
sample_points=[sample_points 1000];

sampled_signal = signal2(sample_points);
xq = 1:1:len;
yq = interp1(sample_points,sampled_signal,xq);

z = abs((yq-signal2)).^2;
sum(z(:));

mse = sum(z(:))/len
plot(yq);
hold on;
plot(signal2)

%
        %50 =1.09
        %100 = 0.3
%