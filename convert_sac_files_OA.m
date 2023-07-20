    %%
clear
clc 

data_dir = '/Users/tobigrace/Desktop/devergnas lab/pd_eye_tracking_project/';
 experiment_list = {['MPTP_eye_tracking_gaze_test_Juno_2022_06_03_001']};
% 
 saccade_table = eye_tracking_file_OA(experiment_list);
% %%
 close all
% 
 x_data_left = saccade_table.GazePointLeftX_ADCSmm_;
 x_data_right = saccade_table.GazePointRightX_ADCSmm_;
% 
 y_data_left = saccade_table.GazePointLeftY_ADCSmm_;
 y_data_right = saccade_table.GazePointRightY_ADCSmm_;
% 
 t = 1:size(x_data_left, 1);
 t = t/120;
% 
% %eye correlation-segmentation plot (x direction)
%     %get left x, get right x, create loop for number of segments, remove nans
%     %inside loop, get correlaton using list grabbing notation, store
%     %correlations
% 
 x_segmented_data_left = segmentation_OA(x_data_left, 120, 5, 5);
 x_segmented_data_right = segmentation_OA(x_data_right, 120, 5, 5);
 n_segments_x = size(x_segmented_data_right, 1);
 
 y_segmented_data_left = segmentation_OA(y_data_left, 120, 5, 5); 
 y_segmented_data_right = segmentation_OA(y_data_right, 120, 5, 5);
 n_segments_y = size(y_segmented_data_right, 1);
% 
% 
 subplot(2, 2, 1)
 plot(t, saccade_table.GazePointLeftX_ADCSmm_, 'color', [0.8500 0.3250 0.0980]) %left eye x
 title("2022/06/03 Left Eye Position vs. Correlation");
 ylabel("Saccadic Amplitude (mm)")
 hold on
 plot(t, saccade_table.GazePointRightX_ADCSmm_, 'color', [0.4940 0.1840 0.5560]) %right eye x
 hold off 
% 
 for i = 1:n_segments_x
     data_segment_left = x_segmented_data_left(i, :);
     data_segment_right = x_segmented_data_right(i, :);
     nan_idx = isnan(data_segment_left)|isnan(data_segment_right);
     b = data_segment_left(~nan_idx);
     c = data_segment_right(~nan_idx);
     if isempty(b)||isempty(c)
         d(i) = nan;
     else
         d(i) = corr(b' , c');
     end
 end
% 
% 
 s = size(d);
 t_d = 5:5:(n_segments_x*5);
 subplot(2, 2, 3)
 plot(t_d,d, 'color', [0 0.4470 0.7410])
 xlabel("Time (s)");
 ylabel("Spearman Correlation Coefficient")
% 
% 
 %eye correlation-segmentation plot (y direction)
 subplot(2, 2, 2)
 plot(t, saccade_table.GazePointLeftY_ADCSmm_, 'color', [0.8500 0.3250 0.0980]) %left eye y
 hold on 
 plot(t, saccade_table.GazePointRightY_ADCSmm_, 'Color', [0.4940 0.1840 0.5560]) %right eye y
 hold off
 
 for i = 1:n_segments_y
     data_segment_left = y_segmented_data_left(i, :);
     data_segment_right = y_segmented_data_right(i, :);
     nan_idx = isnan(data_segment_left)|isnan(data_segment_right);
     b = data_segment_left(~nan_idx);
     c = data_segment_right(~nan_idx);
     if isempty(b)||isempty(c)
         g(i) = nan;
     else
         g(i) = corr(b' , c');
     end
 end
% 
 s = size(g);
 t_g = 5:5:(n_segments_y*5);
 subplot(2, 2, 4)
 plot(t_g,g, 'color', [0 0.4470 0.7410])



% %distribution of valid points per segment
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



