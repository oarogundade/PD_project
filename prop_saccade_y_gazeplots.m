clear
clc

data_dir = '/Users/tobiarogundade/Desktop/devergnas lab/pd_eye_tracking_project/raw_data/';
experiment_list = {'MPTP_eye_tracking_gaze_test_Juno_2021_12_08_001'};

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

close all

f = figure('Position', [-1102 125 2100 607]);
x_data = GazePointLeftX_ADCSmm_;

t = 1:size(x_data,1);
t = t/120;

nan_idx = isnan(x_data);
t_val = t(~nan_idx);
x_val = x_data(~nan_idx);

(title('Baseline; PRS: 0'));
set(gca, 'fontsize', 24);
hold on

%red for saccade portions, black for fixation and unclassified portions of graph line 
sac = strcmpi(GazeEventType, 'saccade');
unc = strcmpi(GazeEventType, 'unclassified');
fix = strcmpi(GazeEventType, 'fixation');
   
%saccade events
y = interp1(t_val, x_val, t);
y_saccade = y;
y_saccade(fix & unc) = NaN;
y_nosac = y;
y_nosac(sac) = NaN;

plot(t, y_saccade, 'LineWidth', 1, 'color', 'red');
hold on
plot(t, y_nosac, 'LineWidth', 1, 'color', 'black' )
hold off
ylabel('X Position (mm)')

hold on

%fixation/unclassified events
t_val = t(~nan_idx);
x_val = x_data(~nan_idx);
z = interp1(t_val, x_val, t);

z_saccade = z;
z_saccade(fix & unc) = NaN;
z_nosac = z;
z_nosac(sac) = NaN;


plot(t, z_saccade ,'LineWidth', 1,'color', 'red')
hold on
plot(t, z_nosac ,'LineWidth', 1,'color', 'black')
hold off
xlabel('Seconds')
ylabel('X Position (mm)')
box off
set(gcf,'Color', 'w')
%legend('Saccade Events','Fixated/Unclassified Events')





%code for tiny figure inside figure 
axes('Position',[.7 .7 .2 .2])
box on

tiny_gaze_event_type = GazeEventType(1.98e5:1.99e5);
tiny_x_data = GazePointLeftX_ADCSmm_(1.98e5:1.99e5);
t2 = 1:size(tiny_x_data,1);
t2 = t2/120;


nan_t_idx = isnan(tiny_x_data);
t2_val = t2(~nan_t_idx);
tiny_x_val = tiny_x_data(~nan_t_idx);
hold on

%red for saccade portions, black for fixation and unclassified portions of graph line 
sac = strcmpi(tiny_gaze_event_type, 'saccade');
unc = strcmpi(tiny_gaze_event_type, 'unclassified');
fix = strcmpi(tiny_gaze_event_type, 'fixation');
   
%saccade events
y2 = interp1(t2_val, tiny_x_val, t2);
y2_saccade = y2;
y2_saccade(fix | unc) = NaN;
y2_nosac = y2;
y2_nosac(sac) = NaN;
legend('Saccade Events','Fixated/Unclassified Events')

plot(t2, y2_saccade, 'LineWidth', 1, 'color', 'red');
hold on
plot(t2, y2_nosac, 'LineWidth', 1, 'color', 'black');
hold off
%ylabel('X Position (mm)')
xlim([0,8])
xticks([])
yticks([])
hold on


%print figures using print('park.png', '-dpng', '-r300')

