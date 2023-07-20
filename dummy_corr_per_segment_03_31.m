clear
clc

left_data = rand(1000,600);

right_data = rand(1000,600);
a_time = [];
g_time = [];
g_all = [];
a = 1
for i = 1:size(right_data,1)
    
    data_segment_right = right_data(i, :);
    data_segment_left = left_data(i, :);
    nan_idx = isnan(data_segment_left)|isnan(data_segment_right);
    tic
    a = a+1 
    a_time(i) = toc;
    valid_prop(i) = mean(~nan_idx);

    b = data_segment_left(~nan_idx);
    c = data_segment_right(~nan_idx);
    if isempty(b)||isempty(c)
        g(i) = nan;
    else
        g(i) = corr(b' , c');
    end
    tic
    g_all = [g_all, g];
    g_time(i) = toc;
end
