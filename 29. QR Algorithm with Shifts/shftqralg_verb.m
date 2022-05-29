%% Input: Let T be the tridiagonal symmetric matrix
%% Output: The eigenvalue of A, the vector storing abs(t_m,m-1),  
%% This is the verbose version of shifted qralg.m .
function [,Tnew, eigenvalue, logvector] = shftqralg_verb(T)
    [m, ~] = size(T);
    logvector = [];
    iter = 1;
    while abs(T(m, m-1)) >= 10^(-12)
        logvector(iter) = abs(A(m, m-1));
        [Qk, Rk] = qr(T - (T(m, m) * eye(m, m))); % For greater efficiency
        T = Rk * Qk + (T(m, m) * eye(m, m));
        iter = iter + 1;
    end
    eigenvalue = T(m, m); logvector = logvector; Tnew = T;
end
