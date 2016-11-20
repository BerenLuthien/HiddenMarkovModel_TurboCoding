function [output_01  p1  p2] = TurboEncoder(x_01);
global prt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Encoder-1 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p1_01 = ConvEncoder(x_01);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Encoder-2 (i.e., INTERLEAVER & Encode)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[p2_01] = ConvEncoder(x_01( [ prt.interleave_pattern ] )  );




output_01 = [x_01; p1_01; p2_01]; x = (x_01 - 0.5)*2; 
p1 = (p1_01 - 0.5)*2; % p1 is the output of Encoder 1.
p2 = (p2_01 - 0.5)*2; % p2 is the output of Encoder 2.
% Here, x, p1, p2 is in the form of "either -1 or +1". 
