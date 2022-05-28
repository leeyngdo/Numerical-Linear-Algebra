%% Input: Let T be the tridiagonal symmetric matrix
%% Output: The eigenvalue of Q of T's last column, the vector storing abs(t_m,m-1), and Tnew
%% This is the verbose version of qralg.m .
function [eigenvalue, logvector, Tnew] = qralg_verb(T)
    [m, ~] = size(T);
    logvector = [];
    iter = 1;
    while abs(T(m, m-1)) >= 10^(-12)
        logvector(iter) = abs(T(m, m-1));
        [Qk, Rk] = qr(T); % For greater efficiency
        T = Rk * Qk;
        iter = iter + 1;
    end
    eigenvalue = T(m, m); logvector = logvector; Tnew = T;
end
