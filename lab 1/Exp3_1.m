load('signal_lab1.mat')
fs = 1000
len = length(signal2);
signal_noisy = signal2 + 0.2*randn(size(signal2));
ans = zeros(len);
sample_frequency = 100;
sample_points = randperm(fs-2, sample_frequency);
sample_points = sort(sample_points);
sample_points=[1 sample_points];
sample_points=[sample_points 1000];

sampled_signal = signal_noisy(sample_points);
xq = 1:1:len;
yq = interp1(sample_points,sampled_signal,xq);

z = abs((yq-signal_noisy)).^2;
sum(z(:));

mse = sum(z(:))/len
plot(yq);
hold on;
plot(signal_noisy)
