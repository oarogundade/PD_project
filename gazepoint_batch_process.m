clear
clc 
close all

data_dir = '/Users/tobiarogundade/Desktop/devergnas lab/pd_eye_tracking_project/raw_data/';
all_prs = '/Users/tobiarogundade/Desktop/devergnas lab/pd_eye_tracking_project/All Eye Tracking Data Log.csv/';

%eye correlation for all segments (y/vertical direction)
%get left y segments, get right y segments, create loop for number of segments, remove nans
%inside loop, get correlaton using list grabbing notation, store
%correlations

all_paths = dir(fullfile(data_dir, "*.csv"));
PRS_file = readtable('All Eye Tracking Data Log.csv');
left_all = [];
right_all = [];
filename_all = {};
index_all = [];
prs_all = [];
prs_scores = PRS_file.PRS;


% batch processing
for k = 1:length(all_paths)
    %going through all data sets i think 
    filename = all_paths(k).name;
    filedir = all_paths(k).folder; 
    filepath = [filedir filesep filename];
    tables = eye_tracking_file_OA(filepath);

    %segmented data in y direction for the left eye 
    y_data_left = tables.GazePointLeftY_ADCSmm_;
    y_segmented_data_left = segmentation_OA(y_data_left, 120, 5, 5);
    n_segments_y = size(y_segmented_data_left, 1);
    left_all = [left_all; y_segmented_data_left];

    %segmented data in y direction for the right eye
    y_data_right = tables.GazePointRightY_ADCSmm_;
    y_segmented_data_right = segmentation_OA(y_data_right, 120, 5, 5);
    right_all = [right_all; y_segmented_data_right];
    
    filename_all = [filename_all; repmat({filename}, n_segments_y, 1)];
    index_all = [index_all, 1:n_segments_y];
    
    prs_per_segment = repmat(prs_scores(k), n_segments_y, 1);

    % if isnan(prs_scores(k))
    %     continue
    % end

    prs_all = [prs_all; prs_per_segment];
end
%%
index_all = index_all';
prs_all = prs_all;

save('PD_data_2023_06_27', 'right_all', 'left_all', 'filename_all', 'index_all', 'prs_all')
% load asd.mat
% 
% data_corr = correlation_OA(right_all, left_all);
% valid_idx = check_valid_OA(right_all, left_all, 0.5);
% 




