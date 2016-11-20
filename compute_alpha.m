function alpha = compute_alpha(CodeL , gamma, alpha_0)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute \alpha
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

alpha = zeros(4,CodeL);
time_ii = 1 % this is alpha(1)
alpha(1,time_ii) = alpha_0([1 3])' * gamma([1,5],time_ii);
alpha(2,time_ii) = alpha_0([1 3])' * gamma([2,6],time_ii);
alpha(3,time_ii) = alpha_0([2 4])' * gamma([3 7],time_ii);
alpha(4,time_ii) = alpha_0([2 4])' * gamma([4 8],time_ii);
% normalization
alpha(:,time_ii) = alpha(:,time_ii)/sum(alpha(:,time_ii));

for time_ii = 2:CodeL % this is alpha(2:8)
    alpha(1,time_ii) = alpha([1 3] , time_ii-1)' * gamma([1,5],time_ii);
    alpha(2,time_ii) = alpha([1 3] , time_ii-1)' * gamma([2,6],time_ii);
    alpha(3,time_ii) = alpha([2 4] , time_ii-1)' * gamma([3 7],time_ii);
    alpha(4,time_ii) = alpha([2 4] , time_ii-1)' * gamma([4 8],time_ii);
    
    % normalization
    alpha(:,time_ii) = alpha(:,time_ii)/sum(alpha(:,time_ii));
end


alpha = [alpha_0  alpha];