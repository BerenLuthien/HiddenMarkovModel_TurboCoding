function betta = compute_betta(CodeL , gamma, betta_9)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute \betta
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
betta = zeros(4,CodeL);
time_ii = CodeL
betta(1,time_ii) = betta_9([1 2])' * gamma([1 2],time_ii);
betta(2,time_ii) = betta_9([3 4])' * gamma([3 4],time_ii);
betta(3,time_ii) = betta_9([1 2])' * gamma([5 6],time_ii);
betta(4,time_ii) = betta_9([3 4])' * gamma([7 8],time_ii);
% normalization
betta(:,time_ii) = betta(:,time_ii)/sum(betta(:,time_ii));

for time_ii = CodeL : -1 : 2 % This [8:1] corresponds to betta_7 to batta_0 in pdf file
    betta(1,time_ii-1) = betta([1 2] , time_ii)' * gamma([1 2],time_ii-1);
    betta(2,time_ii-1) = betta([3 4] , time_ii)' * gamma([3 4],time_ii-1);
    betta(3,time_ii-1) = betta([1 2] , time_ii)' * gamma([5 6],time_ii-1);
    betta(4,time_ii-1) = betta([3 4] , time_ii)' * gamma([7 8],time_ii-1);
    
    % normalization
    betta(:,time_ii-1) = betta(:,time_ii-1)/sum(betta(:,time_ii-1));
end

betta = [betta betta_9];



