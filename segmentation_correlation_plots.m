%
clear
clc

data_dir = '/Users/tobigrace/Desktop/devergnas lab/pd_eye_tracking_project/raw_data/';
experiment_list = {['MPTP_eye_tracking_gaze_test_Juno_2022_03_30_001']};

for c1 = 1:size(experiment_list,1)
    
    % Set up and load sac data
    sac_data_path   = [data_dir '' experiment_list{c1} '.csv'];
    save_path       = strrep(sac_data_path, '.csv', '.mat');
    
    % THIS PART IS NECESSARY TO MAKE THE IMAGE NAME IMPORT AS A STRING AND
    % NOT JUST NaN
    opts            = detectImportOptions(sac_data_path);
    opts            = setvartype(opts, {...
        'RecordingTimestamp', ...
        'EyeTrackerTimestamp', ...
        'FixationIndex', ...
        'SaccadeIndex', ...
        'GazeEventDuration', ...
        'FixationPointX_MCSpx_', ...
        'FixationPointY_MCSpx_', ...
        'SaccadicAmplitude', ...
        'AbsoluteSaccadicDirection', ...
        'RelativeSaccadicDirection', ...
        'GazePointIndex', ...
        'GazePointLeftX_ADCSpx_', ...
        'GazePointLeftY_ADCSpx_', ...
        'GazePointRightX_ADCSpx_', ...
        'GazePointRightY_ADCSpx_', ...
        'GazePointX_ADCSpx_', ...
        'GazePointX_ADCSpx_', ...
        'GazePointX_MCSpx_', ...
        'GazePointY_MCSpx_', ...
        'GazePointLeftX_ADCSmm_', ...
        'GazePointLeftY_ADCSmm_', ...
        'GazePointRightX_ADCSmm_', ...
        'GazePointRightY_ADCSmm_', ...
        'StrictAverageGazePointX_ADCSmm_', ...
        'StrictAverageGazePointY_ADCSmm_', ...
        'PupilLeft', ...
        'PupilRight', ...
        'ValidityLeft', ...
        'ValidityRight', ...
        'RecordingTimestamp'}, 'double');

    saccade_table_all   = readtable(sac_data_path, opts);
    
    % Remove unnecessary AOI information
    aoi_idx                         = contains(saccade_table_all.Properties.VariableNames', 'AOI');
    saccade_table_all(:,aoi_idx)    = [];

    RecordingTimestamp              = saccade_table_all.RecordingTimestamp;
    EyeTrackerTimestamp             = saccade_table_all.EyeTrackerTimestamp;
    FixationIndex                   = saccade_table_all.FixationIndex;
    SaccadeIndex                    = saccade_table_all.SaccadeIndex;
    GazeEventType                   = saccade_table_all.GazeEventType;
    GazeEventDuration               = saccade_table_all.GazeEventDuration; 
    FixationPointX_MCSpx_           = saccade_table_all.FixationPointX_MCSpx_;
    FixationPointY_MCSpx_           = saccade_table_all.FixationPointY_MCSpx_; 
    SaccadicAmplitude               = saccade_table_all.SaccadicAmplitude; 
    AbsoluteSaccadicDirection       = saccade_table_all.AbsoluteSaccadicDirection; 
    RelativeSaccadicDirection       = saccade_table_all.RelativeSaccadicDirection; 
    GazePointIndex                  = saccade_table_all.GazePointIndex; 
    GazePointLeftX_ADCSpx_          = saccade_table_all.GazePointLeftX_ADCSpx_; 
    GazePointLeftY_ADCSpx_          = saccade_table_all.GazePointLeftY_ADCSpx_; 
    GazePointRightX_ADCSpx_         = saccade_table_all.GazePointRightX_ADCSpx_; 
    GazePointRightY_ADCSpx_         = saccade_table_all.GazePointRightY_ADCSpx_; 
    GazePointX_ADCSpx_              = saccade_table_all.GazePointX_ADCSpx_; 
    GazePointY_ADCSpx_              = saccade_table_all.GazePointY_ADCSpx_;
    GazePointX_MCSpx_               = saccade_table_all.GazePointX_MCSpx_;
    GazePointY_MCSpx_               = saccade_table_all.GazePointY_MCSpx_;
    GazePointLeftX_ADCSmm_          = saccade_table_all.GazePointLeftX_ADCSmm_; 
    GazePointLeftY_ADCSmm_          = saccade_table_all.GazePointLeftY_ADCSmm_; 
    GazePointRightX_ADCSmm_         = saccade_table_all.GazePointRightX_ADCSmm_; 
    GazePointRightY_ADCSmm_         = saccade_table_all.GazePointRightY_ADCSmm_; 
    StrictAverageGazePointX_ADCSmm_ = saccade_table_all.StrictAverageGazePointX_ADCSmm_; 
    StrictAverageGazePointY_ADCSmm_ = saccade_table_all.StrictAverageGazePointY_ADCSmm_; 
    PupilLeft                       = saccade_table_all.PupilLeft; 
    PupilRight                      = saccade_table_all.PupilRight; 
    ValidityLeft                    = saccade_table_all.ValidityLeft;
    ValidityRight                   = saccade_table_all.ValidityRight; 
    MediaName                       = saccade_table_all.MediaName;
    
    saccade_table = table(...
        RecordingTimestamp, ...              
        EyeTrackerTimestamp, ...            
        FixationIndex, ...                   
        SaccadeIndex, ...                    
        GazeEventType, ...                   
        GazeEventDuration, ...               
        FixationPointX_MCSpx_, ...           
        FixationPointY_MCSpx_, ...           
        SaccadicAmplitude, ...               
        AbsoluteSaccadicDirection, ...      
        RelativeSaccadicDirection, ...      
        GazePointIndex, ...                
        GazePointLeftX_ADCSpx_, ...       
        GazePointLeftY_ADCSpx_, ...          
        GazePointRightX_ADCSpx_, ...        
        GazePointRightY_ADCSpx_, ...        
        GazePointX_ADCSpx_, ...             
        GazePointY_ADCSpx_, ...           
        GazePointX_MCSpx_, ...              
        GazePointY_MCSpx_, ...              
        GazePointLeftX_ADCSmm_, ...          
        GazePointLeftY_ADCSmm_, ...          
        GazePointRightX_ADCSmm_, ...         
        GazePointRightY_ADCSmm_, ...        
        StrictAverageGazePointX_ADCSmm_, ... 
        StrictAverageGazePointY_ADCSmm_, ... 
        PupilLeft, ... 
        PupilRight, ...
        ValidityLeft, ...
        ValidityRight, ...
        MediaName);

    save(save_path, 'saccade_table');
end 

%%
close all

x_data_left = GazePointLeftX_ADCSmm_;
x_data_right = GazePointRightX_ADCSmm_;

y_data_left = GazePointLeftY_ADCSmm_;
y_data_right = GazePointRightY_ADCSmm_;

t = 1:size(x_data_left, 1);
t = t/120;

%eye correlation-segmentation plot (x direction)
    %get left x, get right x, create loop for number of segments, remove nans
    %inside loop, get correlaton using list grabbing notation, store
    %correlations

% x_segmented_data_left = segmentation_OA(x_data_left, 120, 5, 5);
% x_segmented_data_right = segmentation_OA(x_data_right, 120, 5, 5);
% n_segments_x = size(x_segmented_data_right, 1);
% 
% y_segmented_data_left = segmentation_OA(y_data_left, 120, 5, 5);
% y_segmented_data_right = segmentation_OA(y_data_right, 120, 5, 5);
% n_segments_y = size(y_segmented_data_right, 1);

% figure
% title("Left and Right Eye Positions in X with Correlations");
% subplot(2, 2, 1)
% plot(t, saccade_table.GazePointLeftX_ADCSmm_, 'color', [0.8500 0.3250 0.0980]) %left eye x
% ylabel("Saccadic Amplitude (mm)")
% hold on
% plot(t, saccade_table.GazePointRightX_ADCSmm_, 'color', [0.4940 0.1840 0.5560]) %right eye x
% hold off
% title("Left Eye Position");
% 
% 
% for i = 1:n_segments_x
%     data_segment_left = x_segmented_data_left(i, :);
%     data_segment_right = x_segmented_data_right(i, :);
%     nan_idx = isnan(data_segment_left)|isnan(data_segment_right);
%     b = data_segment_left(~nan_idx);
%     c = data_segment_right(~nan_idx);
%     if isempty(b)||isempty(c)
%         d(i) = nan;
%     else
%         d(i) = corr(b' , c');
%     end
% end
% 
% 
% s = size(d);
% t_d = 5:5:(n_segments_x*5);
% subplot(2, 2, 3)
% plot(t_d,d, 'color', [0 0.4470 0.7410])
% xlabel("Time (s)");
% ylabel("Spearman Correlation Coefficient")

nan_idx = isnan(y_data_right)|isnan(y_data_left);
t_val = t(~nan_idx);
y_val_right = y_data_right(~nan_idx);
y_val_left = y_data_left(~nan_idx);

figure
%eye correlation-segmentation plot (y direction)
subplot(2,1,1)
scatter(t,interp1(t_val, y_val_right, t),'LineWidth',1, 'color', 'k')
title("Right Eye Position");
%plot(t, saccade_table.GazePointLeftY_ADCSmm_, 'color', [0.8500 0.3250 0.0980]) %left eye y
subplot(2,1,2)
scatter(t,interp1(t_val, y_val_left, t),'LineWidth',1, 'color', 'k')
%plot(t, saccade_table.GazePointRightY_ADCSmm_, 'Color', [0.4940 0.1840 0.5560]) %right eye y
title("Left Eye Position");




% figure 
% for i = 1:n_segments_y
%     data_segment_left = y_segmented_data_left(i, :);
%     data_segment_right = y_segmented_data_right(i, :);
%     nan_idx = isnan(data_segment_left)|isnan(data_segment_right);
%     b = data_segment_left(~nan_idx);
%     c = data_segment_right(~nan_idx);
%     if isempty(b)||isempty(c)
%         g(i) = nan;
%     else
%         g(i) = corr(b' , c');
%     end
% end
% 
% s = size(g);
% t_g = 5:5:(n_segments_y*5);
% plot(t_g,g, 'color', [0 0.4470 0.7410])
% set(gcf,'Color', 'w')


%distribution of valid points per segment
% for j = 1:n_segments_x
%     e = x_segmented_data_left;
%     f = x_segmented_data_right;
%     if isnan(e) & isnan(f)
%         both(j) = NaNs;
%     elseif isnan(e)
%         left(j) = NaN;
%     else
%         right(j) = NaN;
%     end
% end


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





