function [Pr_x_pos1  Pr_x_minus1 ] = La2Pr(La); % this function computes the Pr(.) from the LLR of (.)

Pr_x_pos1 = exp(0.5*La) .* exp(0.5*La*(+1)) ./ ( 1 + exp(La) ); % x = +1

Pr_x_minus1 = exp(0.5*La) .* exp(0.5*La*(-1)) ./ ( 1 + exp(La) ); % x = -1;

