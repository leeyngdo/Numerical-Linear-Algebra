%% Input: Let T be the tridiagonal symmetric matrix
%% Output: Current matrix of T running unshifted QR Algorithm
function Tnew = qralg(T)
    [m, ~] = size(T);
    while abs(T(m, m-1)) >= 10^(-12)
        [Qk, Rk] = qr(T); % For greater efficiency
        T = Rk * Qk; 
    end
    Tnew = T; % output 
end
