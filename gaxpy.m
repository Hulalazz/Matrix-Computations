function y = gaxpy(A, x, y, version)
%% --------------- Interface ---------------
%   Input
%       A : matrix, size = (m, n)
%       x : vector, size = (1, n) or (n, 1)
%       y : vector, size = (1, n) or (n, 1)
%       version : int
%               Specify the version of gaxpy. VERSION may be one of the 
%               following int:
%                   1 : algorithm 1.1.3
%                   2 : algorithm 1.1.4
%                   3 : algorithm 1.1.3 row partition
%                   4 : algorithm 1.1.4 column partition
%   Output
%       y = A \mathbf{x} + \mathbf{y}.
%   Example
%       >> A = [1 2;3 4;5 6];
%       >> x = [7; 8]; 
%       >> y = [0; 0; 0]; 
%       >> y = gaxpy(A, x, y, true)
%   Reference
%       Algorithm 1.1.3
%       Golub G H, Van Loan C F. Matrix computations[M]. JHU Press, 2012.
%   Coder
%       Weizhe Chen : cosmo_chan@126.com
%% -----------------------------------------
    [m, n] = size(A);
    if version == 1 % algorithm 1.1.3
        for i = 1 : m
            for j = 1 : n
                y(i) = A(i, j) * x(j) + y(i);
            end
        end
    elseif version == 2 % algorithm 1.1.4
        for j = 1 : n
            for i = 1 : m
                y(i) = A(i, j) * x(j) + y(i);
            end
        end
    elseif version == 3 % algorithm 1.1.3 row partition
        for i = 1 : m
            y(i) = dot(A(i, :), x) + y(i);
        end
    elseif version == 4 % algorithm 1.1.4 column partition
        for j = 1 : n
            y = x(j) * A(:, j) + y;
        end
    else
        warning('VERSION must be 1, 2, 3 or 4, not %f', version);
    end
    
end