function [L_map, Le] = BCJR_Decoder_1(noise_x , noise_p1, La); 
global prt;

alpha_0 = [1 0 0 0]'; % this is alpha_0 , the initialization
betta_9 = [1 0 0 0]'; % this "9" correspnds to betta_8 in pdf file, the initialization

% first, computer alpha, gamma, beta, for the BCJR decoder
gamma = compute_gamma(prt.CodeL  ,  noise_x  ,  noise_p1, La);
alpha = compute_alpha(prt.CodeL , gamma, alpha_0);
betta = compute_betta(prt.CodeL , gamma, betta_9);


for time_ii = 1:prt.CodeL % time_ii corresponds to the "k" in the pdf file
    numerator(time_ii)   = sum ( alpha([1 2 3 4],time_ii) .* gamma ([2 3 5 8], [time_ii]) .* betta( [2 3 1 4] ,time_ii+1) ); 
    denominator(time_ii) = sum (alpha( [1 2 3 4],time_ii)  .* gamma([1 4 6 7], [time_ii]) .* betta( [1 4 2 3] ,time_ii+1) );
    L_map = log( numerator./denominator );
    L_map = L_map';
end
% Xk_hard_decision = (L_map >0)';
Le = L_map - (La + prt.Lc*noise_x);
