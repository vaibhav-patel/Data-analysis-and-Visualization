load('signal_lab1.mat')
fs=1000
len=length(signal1);

n=0:len-1;
N=n*fs/(len-1); % convert x-axis in actual frequency

y=fft(signal1);
plot(N,abs(y));

ans = zeros(len) ;
sample_point=1;
index=1;
f = 80;
add = floor(fs/f);
t = linspace(0,1000,1);
while (index <length(ans))
    ans(index)=signal1(sample_point);
    sample_point=sample_point+add;
    index=index+add;
end

plot(ans,'O');
hold on;
plot(signal1);