function [Q, R] = mgs(A)
[m, n] = size(A);

Q = zeros(m, n);
R = zeros(n, n);
V = A;

for i = 1:n
    R(i, i) = norm(V(:, i));
    Q(:, i) = V(:, i) ./ R(i, i);
    
    for j = i+1:n
        R(i, j) = dot(Q(:, i), V(:, j));
        V(:, j) = V(:, j) - R(i, j) * Q(:, i);
    end
end

end
