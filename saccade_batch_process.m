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
sac_all = [];
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
    
    %segmenting saccadic amplitude
    sac_data = tables.SaccadicAmplitude;
    segmented_sac_data = segmentation_OA(sac_data, 120, 5, 5);
    n_segments_sac = size(segmented_sac_data, 1);
    sac_all = [sac_all; segmented_sac_data];

    
    filename_all = [filename_all; repmat({filename}, n_segments_sac, 1)];
    index_all = [index_all, 1:n_segments_sac];
    
    prs_per_segment = repmat(prs_scores(k), n_segments_sac, 1);

    % if isnan(prs_scores(k))
    %     continue
    % end

    prs_all = [prs_all; prs_per_segment];
end
%%
index_all = index_all';
prs_all = prs_all;

save('PD_sac_data_2023_07_20', 'sac_all', 'filename_all', 'index_all', 'prs_all')

% load asd.mat
% 
% data_corr = correlation_OA(right_all, left_all);
% valid_idx = check_valid_OA(right_all, left_all, 0.5);
% 




