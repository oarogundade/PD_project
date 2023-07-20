clear 
close all
clc

load PD_sac_data_2023_07_20.mat

prs = prs_all;
sac = sac_all;


a = contains(filename_all, 'Juno')
mean_sac = mean(sac,2);
figure
x = [0 1 3 4 5 6 9 11 12 15];
boxplot(mean_sac(a), prs(a), 'positions', x);
% xticks([0:15]) %go to command line and type xticklabels(0:15) after running
% (title('R-L Eye Correlation vs PRS; 90% Validity'))

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

