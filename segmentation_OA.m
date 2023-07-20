function [y, t] = segmentation_OA(x_data, fs, window_seconds, shift_seconds)

%series of variables defined: fs = frequency of data collected;
%frame_duration = desired length of data segemnts in seconds; window =
% total number of samples per segment shift = how far to the right the
% next window should start (in samples)
window_samples = window_seconds*fs; %number of samples (1200)
shift_samples = shift_seconds*fs; %in seconds

%marking of the start and end (in seconds) of the segments of choice
v_start = 1:shift_samples:length(x_data) - window_samples;
v_end = v_start+window_samples-1;
t = v_end/fs;

%segmentation of data
for i = 1:length(v_start)
    start_idx = v_start(i);
    stop_idx = v_end(i);
    v_idx = start_idx:stop_idx;
    y(i,:)=x_data(v_idx);
end
end






%SEGMENTATION
% clc
% clear y
% fs = 120;
% frame_duration = 10; %in seconds
% shift = 5*fs; %in seconds
% window = (frame_duration*fs); %number of samples (1200)
% q = length(x_data);
% number_of_segments = floor(q/window);
% segment_lengths = [window*ones(1, number_of_segments) q-number_of_segments*window];
% parts = mat2cell(x_data, segment_lengths, 1);
% 
% 
% v_start = 1:shift:length(x_data) - window;
% v_end = v_start+window-1;
% 
% for i = 1:length(v_start)
%     start_idx = v_start(i);
%     stop_idx = v_end(i);
%     v_idx = start_idx:stop_idx;
%     y(i,:)=x_data(v_idx);
% end