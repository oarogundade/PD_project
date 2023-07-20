clear 
clc
close all


load MPTP_eye_tracking_gaze_test_Juno_2022_04_19_001.mat

PRS_score = [0
    0 
    0 
    0 
    0
    1
    3
    15 
    11 
    5 
    6 
    5 
    9
    4
    6
    3
    12
    12
    11
    9];
prs_baseline_sac = [0
    0
    0
    0
    0];
prs_exp_sac = [1
    3
    15 
    11 
    5 
    6 
    5 
    9
    4
    6
    3
    12
    12
    11];
prs_prem_sac = 9;

PRS_score2 = [0
    0 
    0 
    0 
    0
    1
    3
    15 
    11 
    5 
    6 
    5 
    6
    12
    12
    11
    9];
prs_baseline_corr = [0
    0 
    0 
    0 
    0];
prs_exp_corr =[1
    3
    15 
    11 
    5 
    6 
    5 
    6
    12
    12
    11];
prs_prem_corr = 9;
XDates = [datenum(2021,12,8) %0 MPTP
    datenum(2021,12,13) %0 mptp
    datenum(2021,12,20) %0 mptp
    datenum(2022,1,14) %0 mptp
    datenum(2022,2,16) % 0 mptp
    datenum(2022,3,2) %0.3 mg/kg ~ 2.34 mg
    datenum(2022,3,9) %0.4 mg/kg ~ 3.12 mg and 0.4mg/kg ~ 3.04 mg on 3/16
    datenum(2022,3,23) % no addtl
    datenum(2022,3,30) % no addtl
    datenum(2022,4,6) % no addtl
    datenum(2022,4,13) %no addtl
    datenum(2022,4,19)%0.3 mg/kg ~ 2.34 mg
    datenum(2022, 4, 27)%0.4
    datenum(2022, 5, 11)%0.8
    datenum(2022, 5, 18)%0.6
    datenum(2022, 5, 27)%0.4
    datenum(2022, 6, 3)%0 addtl
    datenum(2022, 6, 10)%0 addtl
    datenum(2022, 6, 22)%0 addtl
    datenum(2022, 7, 8)% premiprexol doses
    ];

cumm_mptp_corr=[0
    0
    0
    0
    0%end of baseline
    0.3%start of mptp
    0.7
    1.1
    1.1
    1.1
    1.1
    1.4
    %1.8
    %2.6
    3.2
    %3.6
    3.6
    3.6
    3.6
    3.6 %premiprexol given
    ];

mptp_baseline_corr = [0
    0
    0
    0
    0];
mptp_exp_corr= [0.3
    0.7
    1.1
    1.1
    1.1
    1.1
    1.4
    3.2
    3.6
    3.6
    3.6];
mptp_prem_corr = 3.6;

cumm_mptp_sac=[0
    0
    0
    0
    0
    0.3
    0.7
    1.1
    1.1
    1.1
    1.1
    1.4
    1.8
    2.6
    3.2
    3.6
    3.6
    3.6
    3.6
    3.6 %premiprexol given
    ];
mptp_baseline_sac = [0
    0
    0
    0
    0];
mptp_exp_sac = [0.3
    0.7
    1.1
    1.1
    1.1
    1.1
    1.4
    1.8
    2.6
    3.2
    3.6
    3.6
    3.6
    3.6];
mptp_prem_sac = 3.6;


corr_RL_eyes_X = [0.9804 %12/08
    0.9898 %12/13
    0.9897%12/20
    0.9828 %1/14
    0.9885 %2/16
    0.9802%3/2
    0.9801%3/9
    0.8919%3/23
    0.8875%3/30
    0.9767 %4/6
    0.9656 %4/13
    0.9583%4/19
    %0.6415%4/27
    %0.5978%5/11
    0.9842 %5/18
    %0.6210%5/27
    0.9332%6/3
    0.9671 %6/10
    0.9649 %6/22
    0.9058 %7/8
    ];
corr_baseline = [0.9804
    0.9898
    0.9897
    0.9828
    0.9885];
corr_exp = [0.9802%3/2
    0.9801%3/9
    0.8919%3/23
    0.8875%3/30
    0.9767 %4/6
    0.9656 %4/13
    0.9583%4/19
    0.9842 %5/18
    0.9332%6/3
    0.9671 %6/10
    0.9649 %6/22
    ];
corr_prem= 0.9058;
avg_sacc_amp = [5.5152
    8.1249
    8.2336
    7.5442
    8.4462
    8.4349
    5.4797
    1.8671
    1.4791
    1.6565
    1.9055
    2.3367
    7.7661
    12.8580
    1.9034
    3.6859
    1.8968
    1.9324
    2.4281
    5.1886
    ];

bl_sac = [5.5152
    8.1249
    8.2336
    7.5442
    8.4462];
exp_sac = [8.4349
    5.4797
    1.8671
    1.4791
    1.6565
    1.9055
    2.3367
    7.7661
    12.8580
    1.9034
    3.6859
    1.8968
    1.9324
    2.4281];
prem_sac = 5.1886;




percent_fix = [0.3648
    0.4468
    0.4689
    0.3838
    0.4731
    0.1982
    0.4599
    0.4596
    0.4736
    0.7026
    0.4792
    0.4247
    0.0190
    0.0115
    0.5575
    0.0797
    0.6870
    0.6067
    0.2748
    1.7614 %?
    ];

percent_sac = [0.2785
    0.2579
    0.2549
    0.2568
    0.2332
    0.2889
    0.1929
    0.1887
    0.2252
    0.1226
    0.1843
    0.1974
    0.2299
    0.2100
    0.1741
    0.4308
    0.2914
    0.2095
    0.3368
    0 %?
    ];
x = XDates;
y = PRS_score;


g = corr_RL_eyes_X;
a = avg_sacc_amp;


%plot correlation between eyes vs prs
subplot(2,1,1)
set(gcf,'color','w'); %set background color to white
p = scatter(PRS_score2, g, 200, "LineWidth", 2, 'MarkerFaceColor', [.7, .7, 0.7], "Marker","o", 'MarkerEdgeColor','k');
[rho2, pval] = corr(PRS_score2, g);
p_text = '(A) R-L Eye Correlation; p-Value: %.3e';
set(gca, 'fontsize', 18)
(title(sprintf(p_text, pval)));
ylabel("Spearman Correlation Coefficient")
% xlabel("PRS Score")
v = lsline;
set(v, "LineWidth", 2, "color", [1, 0, 0])

%plot correlation of avg saccadic amplitude vs prs score
subplot(2,1,2)
p2 = scatter(y, a, 200, "LineWidth", 2, 'MarkerFaceColor', [.7, .7, 0.7], "Marker","o", 'MarkerEdgeColor','k');
[rho, pval] = corr(y, a);
a_text = "(B) Average Saccade Amplitude; p-Value: %.3f";
set(gca, 'fontsize', 18)
(title(sprintf(a_text, pval)));
ylabel("Avg Saccade Amplitude (mm)")
xlabel("PRS Score")
u = lsline;
set(u, "LineWidth", 2, "color", [1, 0, 0])


figure
%plot corr between eyes vs cumm mptp
subplot(2,1,1)
set(gcf,'color','w'); %set background color to white
p3 = scatter(cumm_mptp_corr, g, 200, "LineWidth", 2, 'MarkerFaceColor', [.7, .7, 0.7], "Marker","o", 'MarkerEdgeColor','k');
[rho2, pval] = corr(cumm_mptp_corr, g);
p_text = '(A) R-L Eye Correlation; p-Value: %.3e';
set(gca, 'fontsize', 18)
(title(sprintf(p_text, pval)));
ylabel("Spearman Correlation Coefficient")
%xlabel("Cummulative MPTP (mg/kg; 7.8kg avg.)")
v = lsline;
set(v, "LineWidth", 2, "color", [1, 0, 0])


%plot correlation of avg saccadic amplitude vs cumm mptp
subplot(2,1,2)
p2 = scatter(cumm_mptp_sac, a, 200, "LineWidth", 2, 'MarkerFaceColor', [.7, .7, 0.7], "Marker","o", 'MarkerEdgeColor','k');
[rho, pval] = corr(cumm_mptp_sac, a);
a_text = "(B) Average Saccade Amplitude; p-Value: %.3f";
set(gca, 'fontsize', 18)
(title(sprintf(a_text, pval)));
ylabel("Avg Saccade Amplitude (mm)")
xlabel("Cummulative MPTP (mg/kg; 7.8kg avg.)")
u = lsline;
set(u, "LineWidth", 2, "color", [1, 0, 0])




% %plot percent time in fixation
% subplot(2,2,3)
% p3 = scatter(y, percent_fix, "LineWidth", 2);
% [rho3, pval] = corr(y, percent_fix);
% f_text = "(C) Proportion Time in Fixation; p-Value: %.3f";
% (title(sprintf(f_text, pval)));
% set(gca, 'fontsize', 14)
% set(p3, 'color', [.5, 0, .5])
% ylabel("Proportion of Time Spent in Fixation")
% lsline
% 
% %plot percent time in saccade
% subplot(2,2,4)
% p4 = scatter(y, percent_sac, "LineWidth", 2);
% [rho4, pval] = corr(y, percent_sac);
% s_text = "(D) Proportion Time in Saccade; p-Value: %.3f";
% set(gca, 'fontsize', 14)
% (title(sprintf(s_text, pval)));
% ylabel("Proportion of Time Spent in Saccade")
% lsline

% %rl eye correlation plot with/without outliers
% corr_RL_eyes_X_outliers = [0.9804 %12/08
%     0.9898 %12/13
%     0.9897%12/20
%     0.9828 %1/14
%     0.9885 %2/16
%     0.9802%3/2
%     0.9801%3/9
%     0.8919%3/23
%     0.8875%3/30
%     0.9767 %4/6
%     0.9656 %4/13
%     0.9583%4/19
%     0.6415%4/27
%     0.5978%5/11
%     0.9842 %5/18
%     0.6210%5/27
%     0.9332%6/3
%     0.9671 %6/10
%     0.9649 %6/22
%     0.9058 %7/8
%     ];
% figure 
% subplot(2, 1, 1)
% set(gcf,'color','w'); %set background color to white
% r = scatter(y, corr_RL_eyes_X_outliers, "LineWidth", 2);
% [rho5, pval] = corr(y, corr_RL_eyes_X_outliers);
% r_text = '(A) R-L Eye Correlation; p-Value: %.3f';
% set(gca, 'fontsize', 14)
% (title(sprintf(r_text, pval)));
% ylabel("Spearman Correlation Coefficient")
% lsline
% 
% subplot(2, 1, 2)
% t = scatter(PRS_score2, g, "LineWidth", 2);
% [rho6, pval] = corr(PRS_score2, g);
% t_text = '(A) R-L Eye Correlation; p-Value: %.3f';
% set(gca, 'fontsize', 14)
% (title(sprintf(t_text, pval)));
% ylabel("Spearman Correlation Coefficient")
% lsline





%code to extract sac features from actual code

% sacamp = ~isnan(SaccadicAmplitude);
% SaccadicAmplitude = SaccadicAmplitude(sacamp);
% avgsaccadicamplitude = mean(SaccadicAmplitude);
% 
% 
% 
% percent_fixation = sum(fix)/214781;
% percent_saccade = sum(sac)/214781;
