clear 
clc
load x_data_temp.mat
fs = 120;
t = (1:size(x_data,2))/fs;
window_seconds = 10;
shift_seconds = 1;

[y, t_segment] = segmentation_OA(x_data, fs, window_seconds, shift_seconds);
for i= 1:size(y, 1)
    y_segment = y(i,:);
    g(i) = linelength_OA(y_segment, fs);
end

plot (t, x_data)
hold on
plot(t_segment, g)




