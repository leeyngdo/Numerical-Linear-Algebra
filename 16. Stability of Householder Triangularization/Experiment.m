%% Householder factorization is a backward stable algorithm for computing QR factorizations!
% We can illustrate this by a MATLAB experiment carried out in IEEE double precision arithmetic, 
% {epsilon}_machine ~= 1.11 X 10^(-16).
function [] = QR_Experiment()
%% First, construct a matrix with a known QR factorization which can then be compared with the QR factoriation computed by Householder. 
R = triu(randn(50)); % Set R to a 50 X 50 upper-triangular matrix with normal random entries.
[Q, ~] = qr(randn(50)); % Set Q to a random orthogonal matrix by orthogonalizing a random matrix.
A = Q * R; % Set A to the product QR, up to rounding errors.
[Q2, R2] = qr(A); %  Compute QR factorization A ~= Q2R2 by Householder triangularization

format short g;
fprintf('How accurate is Q2?\n');
norm(Q2 - Q)
fprintf('How accurate is R2?\n');
norm(R2 - R) / norm(R)
fprintf('These errors are huge!\n');
% Our calculations have been done with 16 digits of accuracy, but the final results are accurate to only 2 or 3 digits mostly. 
% The individual rounding errors have been amplified by factors on the order of 10^13. 

% We seem to have lost 12 digits of accuracy. 
% But now, astonishing thing happends when we multiply these inaccurate matrices Q2 and R2.
fprintf('How accurate is Q2R2?\n');
norm(A-Q2*R2) / norm(A)
fprintf('It is accurate to a full fifteen digits!\n');
% The error in Q2 and R2 must be "diabolically correlated", as Wilkinson used to say.
% To one part in 10^12, they cancel out in the product Q2R2.

% To highlight how special this accuracy of Q2R2 is, let us construct another pair of matrices Q3 and R3 
% that are equally accurate approximations to Q and R, and multiply them.
Q3 = Q + 1e-4 * randn(50); % Set Q3 to a random perturbation of Q that is closer to Q than Q2 is.
R3 = R + 1e-4 * randn(50); % Set R3 to a random perturbation of R that is closer to R than R2 is.
  
fprintf('How accurate is Q3R3?\n');
norm(A-Q3*R3) / norm(A)
fprintf('This time, the error in the product is huge.\n');
% Q2 is no better than Q3, and R2 is no better than R3, but Q2R2 is about
% 12 orders of magnitude better than Q3R3.

%% To sum up,
%% The error in Q2 and R2 are forward errors.
% In general, a large forward error can be the result of an ill-conditioned problem or an unstable algorithm (Theorem 15.1)
% In our experiment, they are due to former.
% As a rule, the sequences of column spaces of a random triangular matrix are exceedingly ill-conditioned as a function of the entries of the matrix.

%% The error in Q2R2 are backward error or residual.
% The smallness of this error suggests that Householder triangularization is backward stable
end
