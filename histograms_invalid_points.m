clear
clc 
close all

data_dir = '/Users/tobigrace/Desktop/devergnas lab/pd_eye_tracking_project/raw_data';

% %invalid (NaN) points left, right, and both eyes

% all_paths = dir(fullfile(data_dir, "*.csv"));
% for k = 1:length(all_paths)
%     filename = all_paths(k).name;
%     filedir = all_paths(k).folder; 
%     filepath = [filedir filesep filename];
%     tables = eye_tracking_file_OA(filepath);
%     left_nan = isnan(tables.GazePointLeftX_ADCSmm_);
%     right_nan = isnan(tables.GazePointRightX_ADCSmm_);
%     tot_invalid_left = sum(left_nan);
%     tot_invalid_right = sum(right_nan);
%     left_pos(k) = mean(left_nan);
%     right_pos(k) = mean(right_nan);
%     both(k) = mean(left_nan & right_nan);
% end
% graph = [left_pos' right_pos' both'];
% figure
% bar(graph)

%y direction 

y_all = [];
%invalid (NaN) points for every segment in every data set
all_paths = dir(fullfile(data_dir, "*.csv"));
for k = 1:length(all_paths)
%going through all data sets i think 
    filename = all_paths(k).name;
    filedir = all_paths(k).folder; 
    filepath = [filedir filesep filename];
    tables = eye_tracking_file_OA(filepath);
%segmented data in x direction for the left eye 
    y_data_left = tables.GazePointLeftY_ADCSmm_;
    y_data_right = tables.GazePointRightY_ADCSmm_;
    y_segmented_data_left = segmentation_OA(y_data_left, 120, 5, 5);
    y_segmented_data_right = segmentation_OA(y_data_right, 120, 5, 5);
    is_nan_y = isnan(y_segmented_data_left)|isnan(y_segmented_data_right);
    pop_nan_y = mean(is_nan_y, 2);
    y_all = [y_all; pop_nan_y];
end


graph = y_all;
figure
bar(graph)




%x direction 

x_all = [];
%invalid (NaN) points for every segment in every data set
all_paths = dir(fullfile(data_dir, "*.csv"));
for k = 1:length(all_paths)
%going through all data sets i think 
    filename = all_paths(k).name;
    filedir = all_paths(k).folder; 
    filepath = [filedir filesep filename];
    tables = eye_tracking_file_OA(filepath);
%segmented data in x direction for the left eye 
    x_data_left = tables.GazePointLeftX_ADCSmm_;
    x_data_right = tables.GazePointRightX_ADCSmm_;
    x_segmented_data_left = segmentation_OA(x_data_left, 120, 5, 5);
    x_segmented_data_right = segmentation_OA(x_data_right, 120, 5, 5);
    is_nan_x = isnan(x_segmented_data_left)|isnan(x_segmented_data_right);
    pop_nan_x = mean(is_nan_x, 2);
    x_all = [x_all; pop_nan_x];
end


graph = x_all;
figure
bar(graph)




