function [] = Experiment2()
%% First, we construct a square A with random singular vectors and 
%% widely varying singular values spaced by factors of 2 between 2^-1 and 2^-80
[U, ~] = qr(randn(80)); % Set U to a random orthogonal matrix
[V, ~] = qr(randn(80)); % Set V to a random orthogonal matrix
S = diag(2.^(-1:-1:-80)); % Set S to a diagonal matrix with exponentially graded entries
A = U * S * V; % Set A to a matrix with these entries as singular values
[m, n] = size(A);

%% Now, we use 'classical' and 'modified' Gram-Schmidt to compute QR factorization of A.
% classical 
QC = zeros(m, n); RC = zeros(m, n); VC = A;
for j = 1:n
    for i = 1:j-1
        RC(i, j) = dot(QC(:, i), VC(:, j));
        VC(:, j) = VC(:, j) - RC(i, j) * QC(:, i);
    end
    RC(j, j) = norm(VC(:, j));
    QC(:, j) = VC(:, j) ./ RC(j, j);
end

% modified 
QM = zeros(m, n); RM = zeros(m, n); VM = A;
for i = 1:n
    RM(i, i) = norm(VM(:, i));
    QM(:, i) = VM(:, i) ./ RM(i, i);
    for j = i+1:n
        RM(i, j) = dot(QM(:, i), VM(:, j));
        VM(:, j) = VM(:, j) - RM(i, j) * QM(:, i);
    end
end

%% Finally, we plot the diagonal elements r_jj produced by both computations
format("longEng");
% Modified
j = linspace(0, 80, 80);
r_jj = diag(RM);
subplot(2, 1, 1);
plot(j, r_jj, 'o', 'Color', 'r');
axis([0 80 10^(-25), 1]);
hold on;

% Classical
i = linspace(0, 80, 80);
r_ii = diag(RC);
subplot(2, 1, 2);
plot(i, r_ii, 'o', 'Color', 'b');
axis([0 80 10^(-25), 1]);

end
