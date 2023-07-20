clear 
close all
clc

load PD_data_2023_06_27.mat

data_corr = correlation_OA(right_all, left_all);
valid_idx = check_valid_OA(right_all, left_all, 0.9);
prs = prs_all;

for i = 1:size(valid_idx,1)
    if valid_idx(i) == 0
        data_corr(i) = NaN;
    end
    if isnan(data_corr(i))
        prs(i) = NaN;
    end
end

% figure
% plot(data_corr);
% 
% % figure 
% % plot(valid_idx);
% 

figure
%boxplot(data_corr', prs);
x = [0 1 3 4 5 6 9 11 12 15];
boxplot(data_corr', prs, 'positions', x);
xticks([0:15]) %go to command line and type xticklabels(0:15) after running
(title('R-L Eye Correlation vs PRS; 90% Validity'))

%masillia = strcmpi(filename_all, 'Masillia');

%code to extract these features from actual code

% sacamp = ~isnan(SaccadicAmplitude);
% SaccadicAmplitude = SaccadicAmplitude(sacamp);
% avgsaccadicamplitude = mean(SaccadicAmplitude);
% 
% 
% 
% percent_fixation = sum(fix)/214781;
% percent_saccade = sum(sac)/214781;

