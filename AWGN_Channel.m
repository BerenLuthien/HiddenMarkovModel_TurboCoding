function [output_noise  noise_x     noise_p1    noise_p2 ] = AWGN_Channel(output);
global prt;

if prt.awgn == 1
    noise_on_x = ...
    [
    +1.966099
    -1.232363
    +0.750745
    +1.832447 % +2.832447
    -1.262811
    +0.205224
    -0.569778
    +0.257169    
    ];

    noise_on_p1 = ...
    [+2.132927
    -0.443420
    +0.823265
    -0.088392
    +0.551007
    +0.277622
    +0.978633
    +0.465353
    ];

    noise_on_p2 = ...
    [
    -0.701887 % +0.701887
    -0.696641
    +0.823463
    +1.036052
    -2.051227
    +0.462560
    +1.105726
    -0.700940
    ];
else prt.awgn == 0
    noise_on_x = zeros(8,1);
    noise_on_p1 = zeros(8,1);
    noise_on_p2 = zeros(8,1);
end
noise_matrix = [noise_on_x     noise_on_p1    noise_on_p2];

output_bipolar = (output'-0.5)*2;
output_noise = output_bipolar + noise_matrix;
noise_x  = output_noise(:,1);
noise_p1 = output_noise(:,2);
noise_p2 = output_noise(:,3);


