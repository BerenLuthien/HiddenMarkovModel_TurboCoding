function gamma = compute_gamma(CodeL  ,  noise_x  ,  noise_p1 , La);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% computer gamma_k for Decoder 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xp_0_0 = [0 0]; % corresponding to input = 0; % This _0_0 means, the output of the encoder_1, when states transfer from 0 to 0.
xp_0_1 = [1 1]; % corresponding to input = 1;

xp_1_3 = [0 1]; % corresponding to input = 0;
xp_1_2 = [1 0]; % corresponding to input = 1;  

xp_2_1 = [0 0]; % corresponding to input = 0;
xp_2_0 = [1 1]; % corresponding to input = 1;

xp_3_2 = [0 1]; % corresponding to input = 0;
xp_3_3 = [1 0]; % corresponding to input = 1;

xkpk = [xp_0_0 ; xp_0_1 ;  xp_1_2 ;  xp_1_3 ;   xp_2_0 ;  xp_2_1 ; xp_3_2  ; xp_3_3]; 
xkpk = (xkpk-0.5)*2; % This is the output under different inputs (either 0 or 1) and under different register status (00,01,10,11, i.e., 0,1,2,3);
% xkpk is a fixed matrix, fixed (constant) for all time taps; i.e., it does not change with time
xkpk = [xkpk(:,1)  xkpk]; % [x x p].  The 1st column is x, the 2nd column is also x, the 3rd column is p.
% x is the systematic bit string; p is the parity bit string output from the convolutional encoder; 
% We are going to compute Gamma = 0.5x *La + x *x_noise + p *p_noise. Thus, we used [x x p] above.  

for time_ii = 1: CodeL 
    % for each time tap, multiply [x p1] or xkpk (which is the received noisy output of Encoder) with all the possible output of Encoder (which is xkpk, noise-free)  
    % the multiplification is actually the conditional probablit in a hidden Marcov 
    temp_1 = [La(time_ii)*ones(CodeL,1)/2   noise_x(time_ii)*ones(CodeL,1)       noise_p1(time_ii)*ones(CodeL,1)     ];  % noise_x here is not noise added on x, but it is the "corrupted signal" by noise.
    temp_2 = [xkpk .* temp_1]';
    temp_3 = sum(temp_2) ;
    gamma(:,time_ii) = exp( temp_3 );
    % the xkpk  
end