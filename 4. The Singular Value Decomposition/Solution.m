function done = Solution(A)
    
[U, S, V] = svd(A);
u1 = U(:, 1) .* S(1, 1); v1 = V(:, 1);
u2 = U(:, 2) .* S(2, 2); v2 = V(:, 2);
U = [u1 u2]; 
%% Draw the unit sphere
fig1 = figure(1);

subplot(1, 2, 1); hold on; 
theta = 0: pi/500: 2*pi;
x = cos(theta); y = sin(theta);
plot(x, y);  

% Draw the right singular vector
plot([0; v1(1)], [0; v1(2)]); plot([0; v2(1)], [0; v2(2)]); 
text(v1(1) / 1.5, v1(2) / 3, "v1", 'Color','Black','FontSize',14);
text(v2(1) / 1.5, v2(2) / 3, "v2", 'Color','Black','FontSize',14);

% Adapting the figures
set(fig1, 'OuterPosition', [50, 50, 840, 420])
xticks([-1 1]); yticks([-1 1]); axis equal;
ax = gca; ax.XAxisLocation = 'origin'; ax.YAxisLocation = 'origin';
title('S', 'FontWeight', 'bold'); legend('S', 'v1', 'v2')

%% Draw the ellipse
subplot(1, 2, 2); hold on;
if (S(1, 1) >= S(2, 2)) % (ax, ay) is major semiaxis; (bx, by) is minor semiaxis
    ax = U(1, 1); ay = U(2, 1); 
    bx = U(1, 2); by = U(2, 2);
else 
    ax = U(1, 2); ay = U(2, 2);
    bx = U(1, 1); by = U(2, 1);
end
x = ax * sin(theta) + bx * cos(theta);
y = ay * sin(theta) + by * cos(theta);

plot(x, y)

% Draw the left singular vector 
plot([0; u1(1)], [0; u1(2)]); plot([0; u2(1)], [0; u2(2)]); 
text(u1(1) / 1.5, u1(2) / 3, "u1", 'Color','Black','FontSize', 14);
text(u2(1) / 1.5, u2(2) / 3, "u2", 'Color','Black','FontSize', 14);

% Adapting the figures
set(fig1, 'OuterPosition', [50, 50, 840, 420])
xticks([-max(S) : max(S)]); yticks([-max(S) : max(S)]); axis equal;
ax = gca; ax.XAxisLocation = 'origin'; ax.YAxisLocation = 'origin';
title('AS', 'FontWeight', 'bold'); legend('AS', 'u1', 'u2')

annotation('textarrow',[0.475 0.575],[0.55 0.55], 'String', 'A', 'FontWeight', 'bold')
end