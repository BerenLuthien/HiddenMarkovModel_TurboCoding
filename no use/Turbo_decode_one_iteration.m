function     [L_map1, Le1] = Turbo_decode_one_iteration(noise_x , noise_p1, La);
global prt;
    %% for BCJR decoder-1
    [L_map1, Le1] = BCJR_Decoder(noise_x , noise_p1, La);     
    La_inter = Le1(prt.interleave_pattern);  % interleaved; % Le the output from BCJR-1, is the input of BCJR-2 La.
    %% for BCJR decoder-2
    [L_map2, Le2] = BCJR_Decoder( noise_x(interleave_pattern) , noise_p2, La_inter);
    La = Le2(prt.de_inter_pattern); % Le the output from BCJR-2, is the input of BCJR-1 La.
