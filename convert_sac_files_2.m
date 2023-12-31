clc
clear

%%


data_dir = '/Users/tobigrace/Desktop/devergnas lab/pd_eye_tracking_project/';
experiment_list = {'MPTP_eye_tracking_gaze_test_Oscar_2022_10_17_001'};

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
f = figure('Position', [-1102 151 1023 607]);

x_data = GazePointLeftX_ADCSmm_;
y_data = GazePointLeftY_ADCSmm_;

t = 1:size(x_data,1);
t = t/120;

nan_idx = isnan(x_data);
t_val = t(~nan_idx);
x_val = x_data(~nan_idx);

 subplot(2,1,1)
 hold on




plot(t,interp1(t_val, x_val, t),'LineWidth',3, 'color', 'k')
%plot(t, x_data,'LineWidth',3)
ylabel('X Position (mm)')
set(gca, 'FontSize', 16)
xticklabels([])
xlim([1300 1350])
(title('Saccade Data of 1300-1350 Seconds 03/30/2022'));


subplot(2,1,2)
hold on

nan_idx = isnan(y_data);
t_val = t(~nan_idx);
y_val = y_data(~nan_idx);

plot(t,interp1(t_val, y_val, t),'LineWidth', 3,'color', 'k')
%plot(t, y_data,'LineWidth',2)

set(gca, 'FontSize', 16)
xlabel('Seconds')
xlim([1300 1350])
ylabel('Y Position (mm)')
box off
set(gcf,'Color', 'w')
