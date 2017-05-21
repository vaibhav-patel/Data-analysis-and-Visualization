function sampled_data=mysample(data,sample_size)
ss_index=randperm(size(data,1),sample_size);
sampled_data=data(ss_index);



















