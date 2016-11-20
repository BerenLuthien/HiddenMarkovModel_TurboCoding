clear
clc
%% this set of codes , refer to turbo_code_primer.pdf 
%% Before reading the code, please go over the pdf file first.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
init_prt;
global prt;

x_01 = [1 1 0 0 1 0      1 0]; % the last two bits "[ 1 0 ]" are the tail bits
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Turbo Encoder
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[output_01  p1  p2] = TurboEncoder(x_01);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% add noise
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[output_noise  noise_x     noise_p1    noise_p2 ]  = AWGN_Channel(output_01);
% noise_x is "x + noise"; output_noise = [noise_x     noise_p1    noise_p2]

for iteration_ii = 1: 1
    iteration_ii
    % BCJR decoder_1
    [L_map1, Le1]= BCJR_decoder_1_1st_Iteration(noise_x , noise_p1);
    % BCJR decoder_2
    [L_map2, Le2]= BCJR_decoder_2_1st_Iteration(noise_x , noise_p2, Le1);;    
end

La = Le2;
for iteration_ii = 2: prt.iteration_times
    %% for BCJR decoder-1    
    iteration_ii
    [L_map1, Le1] = BCJR_Decoder_1(noise_x , noise_p1, La);     
    La_inter = Le1(prt.interleave_pattern);  % interleaved; % Le the output from BCJR-1, is the input of BCJR-2 La.
    %% for BCJR decoder-2
    [L_map2, Le2] = BCJR_Decoder_2( noise_x(prt.interleave_pattern) , noise_p2, La_inter);
    La = Le2(prt.de_inter_pattern); % Le the output from BCJR-2, is the input of BCJR-1 La.
end

%%Iteration_1 -- Decoder_1



disp('end of codes')
