function   [  p_1  ] = ConvEncoder(input)
%%%%%%%%%% convolutional coder-1
global prt;
x_n = input;
mu_0 = 0;
mu_1 = 0;
pn = ones(1,prt.L + prt.Tail_length)*9;
for ii = 1: prt.L + prt.Tail_length 
    % computation inside the Encoder
    temp1 = rem(mu_0 + mu_1, 2 );
    temp2 = rem(temp1 + x_n(ii), 2);
    p_n(ii) = rem( mu_1 + temp2 , 2);
    
    % registers shift
    mu_1 = mu_0;
    mu_0 = temp1 + x_n(ii);
end

p_1 = p_n;

