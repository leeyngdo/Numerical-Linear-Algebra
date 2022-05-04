function [L, U] = mge(A)
    [m, n] = size(A);
    U = A; L = ones(m, n);
    for k = 1:m-1
           L(k+1:m, k) = U(k+1:m, k)/U(k,k);
           U(k+1:m, k:m) = U(k+1:m, k:m) - L(k+1:m, k) * U(k, k:m);
    end
end

