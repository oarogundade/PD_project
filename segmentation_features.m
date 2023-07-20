% Run segment code
% data = batch_segment(data_dir)
% get correlation
% check valid

clear
clc

load batch_process_table.mat
data_corr = correlation_OA(right_all, left_all);
valid_prop = 0.50;
valid_idx = check_valid_OA(right_all, left_all, valid_prop);
