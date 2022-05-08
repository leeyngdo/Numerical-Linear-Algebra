function [] = Exercise(trial)
    x = zeros(1, trial); y = zeros(1, trial);
    m = 2;
    increase = 2;
    for i = 1:trial
        % mxm 'uniformly' random matrix (Exercise 12.3)
        A = rand(m, m)/sqrt(m);
        [~, U, ~] = lu(A);
        % growth factor 
        p = max(abs(U), [], 'all') / max(abs(A), [], 'all');
        x(1, i) = m; y(1, i) = p;
        if (mod(i, 8) == 0) 
            m = m + increase;
        end
        if (mod(i, 32) == 0)
            increase = increase + 2; 
        end
    end
    hold on;
    % m^(1/2)
    plot(x, sqrt(x), '--');
    scatter(x, y, zeros(1, trial) + 10, 'filled');
    title('Figure 22.1'); legend('m^1/2', '');
    xlabel('dimension m'); ylabel('growth factor p');
end

