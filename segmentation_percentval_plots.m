%
close all
clear
clc

data_dir = '/Users/tobigrace/Desktop/devergnas lab/pd_eye_tracking_project/';
experiment_list = {['MPTP_eye_tracking_gaze_test_Masillia_2022_10_26_001']};

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

x_segmented_data_left = segmentation_OA(x_data_left, 120, 5, 5);
x_segmented_data_right = segmentation_OA(x_data_right, 120, 5, 5);
n_segments_x = size(x_segmented_data_right, 1);

figure
title("Left and Right Eye Positions in X with Correlations");
subplot(2, 1, 1)
plot(t, saccade_table.GazePointLeftX_ADCSmm_, 'color', [0.8500 0.3250 0.0980]) %left eye x
ylabel("Saccadic Amplitude (mm)")
hold on
plot(t, saccade_table.GazePointRightX_ADCSmm_, 'color', [0.4940 0.1840 0.5560]) %right eye x
hold off
title("Left Eye Position");


for i = 1:n_segments_x
    x_data_segment_left = x_segmented_data_left(i, :);
    x_data_segment_right = x_segmented_data_right(i, :);
    left_x_nan_idx = isnan(x_data_segment_left);
    right_x_nan_idx = isnan(x_data_segment_right);
    d(i) = mean(left_x_nan_idx & right_x_nan_idx);
end


s = size(d);
t_d = 5:5:(n_segments_x*5);
subplot(2, 1, 2)
plot(t_d,d, 'color', [0 0.4470 0.7410])
xlabel("Time (s)");
ylabel("Percent Invalid Points per Segment")


%eye correlation-segmentation plot (y direction)

y_segmented_data_left = segmentation_OA(y_data_left, 120, 5, 2.5);
y_segmented_data_right = segmentation_OA(y_data_right, 120, 5, 2.5);
n_segments_y = size(y_segmented_data_right, 1);

figure
subplot(2, 1, 1)
plot(t, saccade_table.GazePointLeftY_ADCSmm_, 'color', [0.8500 0.3250 0.0980]) %left eye y
hold on
plot(t, saccade_table.GazePointRightY_ADCSmm_, 'Color', [0.4940 0.1840 0.5560]) %right eye y
hold off
title("Right Eye Position");

for i = 1:n_segments_y
    y_data_segment_left = y_segmented_data_left(i, :);
    y_data_segment_right = y_segmented_data_right(i, :);
    left_y_nan_idx = isnan(y_data_segment_left);
    right_y_nan_idx = isnan(y_data_segment_right);
    g(i) = mean(left_y_nan_idx & right_y_nan_idx);
        
end

s = size(g);
t_g = 5:5:(n_segments_y*5);
subplot(2, 1, 2)
plot(t_g,g, 'color', [0 0.4470 0.7410])
set(gcf,'Color', 'w')



%bar graph of invalid points in the x-direction of the left eye
figure 
graph_left = d;
bar(graph_left)

%count of valid segments of data in the x-direction of the left eye
for k = 1:length(d)
    if d(k)<=0.370
        valid_threshold_segments_left(k) = k;
    else
        valid_threshold_segments_left(k) = NaN;
    end
end




