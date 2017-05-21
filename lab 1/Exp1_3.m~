load('signal_lab1.mat')
fs=1000
len=length(signal1);

n=0:len-1;
N=n*fs/(len-1); % convert x-axis in actual frequency
% 
% y=fft(signal1);
% plot(N,abs(y));

ans = zeros(len) ;
sample_point=1;
index=1;
f = 20;
T = 1000/f;
x = 1:T:len;
x = [x 1000]
xq = 1:1:len;
t = 0:1:(len-1);
err = 0;
y = signal1(x);
inter = interp1(x,y,xq);
index = 1;

plot(t,interp1(x,y,xq));
hold on;
plot(t,signal1);