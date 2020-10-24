%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
% Fragmentation Index example
%
% This code provides an example of usage of the fragmentation index 
% (published in Mondino, et al 2020 
% available at https://www.biorxiv.org/content/10.1101/2020.10.20.347260v1) 
% intended to use, but not limited to sleep-wake scorings. 
% This example calculates the fragmentation index of 2 conditions, 
% one following vehicle and the other following CNO administration. 
%
% Joaquin Gonzalez, Laboratorio de Neurobiologia del Sueno, Facultad de 
% Medicina, Universidad de la Republica, Uruguay. 2020
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear, clc


% load sleep scorings and define the numerical code used to represent each state

load('SleepScore_example.mat')
sleep_code = {'Wake','NREM','REM'}; % thus a 1 = wake, 2 = NREM and 3 = REM

%% plot hypnogram

t = [1:5:21600]; % generate time vector

figure(1)

subplot(2,1,1)
plot(t,SleepScore_veh)
ylim([1,3.5])
xlim([0,21600])
set(gca, 'YTick', [1,2,3],'YTickLabel', {'W','NREM','REM'},'XTick',[0:3600:21600],'XTickLabel',[0:6])
title('Vehicle')

subplot(2,1,2)
plot(t,SleepScore_cno)
ylim([1,3.5])
xlim([0,21600])
xlabel('Time (hs)')

set(gca, 'YTick', [1,2,3],'YTickLabel', {'W','NREM','REM'},'XTick',[0:3600:21600],'XTickLabel',[0:6])
title('CNO')

%% calculate Fragmentation Index

% this subroutine uses the Fragmentation_index.m included in the repository
% to compute the index

state_analysis = 2; % choose state to analyze its fragmentation (1 = wake, 2 = NREM and 3 = REM)

[state_prob_veh,fragmentation_index_veh] = Fragmentation_index(SleepScore_veh,state_analysis);
[state_prob_cno,fragmentation_index_cno] = Fragmentation_index(SleepScore_cno,state_analysis);


%% plot results

% the probability of the state under each condition is plotted, as well as
% the fragmentation index itself for each condition.

figure(2)

subplot(1,2,1)
bar([state_prob_veh, state_prob_cno],'Facecolor','black')
set(gca,'XTicklabels',{'Veh','CNO'},'Fontsize',12)
ylabel('State Prob')

subplot(1,2,2)
bar([fragmentation_index_veh, fragmentation_index_cno],'Facecolor','black')
set(gca,'XTicklabels',{'Veh','CNO'},'Fontsize',12)
ylabel('Fragmentation Index')

suptitle(strcat(sleep_code(state_analysis), ' State Analysis'))

