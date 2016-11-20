function init_prt;
global prt;
prt.L = 6 % size of information flow, L bits.
prt.Tail_length = 2; % 2 bits Tail bits
prt.CodeL = prt.L + prt.Tail_length; % The whole Code Length
prt.interleave_pattern = [8 6 2 3 5 4 7 1];
prt.de_inter_pattern = [8 3 4 6 5 2 7 1]
prt.Lc =2;

prt.iteration_times=5;% the number of turbo decoding iteration times. 
prt.awgn = 1
