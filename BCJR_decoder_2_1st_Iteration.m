
function [L_map, Le]= BCJR_decoder_2_1st_Iteration(noise_x , noise_p2, Le);
global prt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Iteration_1 --  Decoder_2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
La_inter = Le(prt.interleave_pattern);  % interleaved
noise_x_inter = noise_x(prt.interleave_pattern);

alpha_0 = [1 0 0 0]'; % this is alpha_0 , the initialization
betta_9 = [0.25 0.25 0.25 0.25]'; % this "9" correspnds to betta_8 in pdf file, the initialization


gamma = compute_gamma(prt.CodeL  ,  noise_x_inter  ,  noise_p2, La_inter); 
alpha = compute_alpha(prt.CodeL , gamma, alpha_0);
betta = compute_betta(prt.CodeL , gamma, betta_9);
for time_ii = 1:prt.CodeL % time_ii corresponds to the "k" in the pdf file
    numerator(time_ii)   = sum ( alpha([1 2 3 4],time_ii) .* gamma ([2 3 5 8], [time_ii]) .* betta( [2 3 1 4] ,time_ii+1) ); 
    denominator(time_ii) = sum (alpha( [1 2 3 4],time_ii)  .* gamma([1 4 6 7], [time_ii]) .* betta( [1 4 2 3] ,time_ii+1) );
    L_map = log( numerator./denominator );
    L_map = L_map';
end
noise_x_inter = noise_x(prt.interleave_pattern);
Le = L_map - (La_inter + prt.Lc * noise_x_inter);