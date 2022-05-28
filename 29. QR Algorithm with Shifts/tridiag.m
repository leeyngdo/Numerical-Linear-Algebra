%%  Input: Let A be mxm real symmetric matrix
%%  Output: the tridiagonal matrix T
function T = tridiag(A)
    [m, ~] = size(A); % size of the input matrix 
    for k = 1:m-2
        x = A(k+1:m, k); % k-th column of A
        if x(1) >= 0, x(1) = x(1) - norm(x); else, x(1) = x(1) + norm(x); end
        v_k = x / norm(x); % Householder reflector
        A(k+1:m, k:m) = A(k+1:m, k:m) - 2.*v_k*(v_k'*A(k+1:m, k:m)); % Q*A
        A(1:m, k+1:m) = A(1:m, k+1:m) - 2.*(A(1:m, k+1:m)*v_k)*v_k'; % AQ
    end
    T = A; % output
end


