load('signal_lab1.mat')
fs=1000
len=length(signal1);

n=0:len-1;
N=n*fs/(len-1); % convert x-axis in actual frequency

y=fft(signal2);
plot(N,abs(y));

%
%    f1=8
%   f2=15
%  f3=50
%