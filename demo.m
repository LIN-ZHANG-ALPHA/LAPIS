
clear all;  close all; 

addpath(genpath(pwd))


% parameter for periodic signals
opts_multivariate.num_smaple                = 10;
opts_multivariate.Input_Datalength          = 200;
opts_multivariate.SNR                       = 50;
opts_multivariate.num_groups                = 3;
opts_multivariate.Input_periods             = {[3,5],[7,11],[2,13],[2,19]};
opts_multivariate.visual_signal             = 0;

% parameter for missing
opts_multivariate.incomplete          = 0; % 0: off, 1: on
opts_multivariate.ratio_incomplete    = 0.3;
opts_multivariate.missing_window_size = 1;
opts_multivariate.visual_incomplete   = 0;
%%  Dictionary Parameters

Pmax            = 50; %The largest period spanned by the NPDs
Dictionary_pool = {'Ramanujan','NaturalBasis','random' };%Type of the dictionary
Dictionary_type = Dictionary_pool{1};


%%  genertate signal

[data_matrix,statis] = build_syn_data_matrix(opts_multivariate);



%% LAPIS

opts.Dictionary_type = Dictionary_type;
opts.Pmax            = Pmax;
opts.lambda_1        = 0.1;
opts.lambda_2        = 0.1;
opts.lambda_3        = 1;
opts.rho             = 1e-3;
opts.visual          = 1;
opts.max_iter        = 50;

[Factor,detected_periods,running_time] = LAPIS(data_matrix,opts);





