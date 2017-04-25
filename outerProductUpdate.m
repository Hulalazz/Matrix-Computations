function A = outerProductUpdate(A, x, y, version)
%% --------------- Interface ---------------
%   Input
%       A : matrix, size = (m, n)
%       x : vector, size = (1, n) or (n, 1)
%       y : vector, size = (1, n) or (n, 1)
%       version : int
%               Specify the version of outerProductUpdate. 
%               VERSION may be one of the following int:
%                   1 : scalar multiplication
%                   2 : row version saxpy
%                   3 : column version saxpy
%   Output
%       y = A + \mathbf{x} \mathbf{y}^\top.
%   Example
%       >> A = [1 2;3 4;5 6];
%       >> x = [1; 2; 3]; 
%       >> y = [4, 5]; 
%       >> tic; A1 = outerProductUpdate(A, x, y, 1); toc; % 0.003257 sec.
%       >> tic; A2 = outerProductUpdate(A, x, y, 2); toc; % 0.003907 sec.
%       >> tic; A3 = outerProductUpdate(A, x, y, 3); toc; % 0.002816 sec.
%   Reference
%       1.1.9 Outer Product Update
%       Golub G H, Van Loan C F. Matrix computations[M]. JHU Press, 2012.
%   Coder
%       Weizhe Chen : cosmo_chan@126.com
%% -----------------------------------------
    [m, n] = size(A);
    if size(y, 1) > size(y, 2)
        y = y';
    end
    if size(x, 1) < size(x, 2)
        x = x';
    end
    if nargin  == 3
        version = 3;
    end
%% -----------------------------------------
    if version == 1
        for i = 1 : m
            for j = 1 : n
                A(i, j) = A(i, j) + x(i) * y(j);
            end
        end
    elseif version == 2
        for i = 1 : m
            A(i, :) = saxpy(x(i), y, A(i, :));
        end
    elseif version ==3
        for j = 1 : n
            A(:, j) = saxpy(y(j), x, A(:, j));
        end
    else
        warning('VERSION must be 1, 2 or 3, not %d', version)
    end

end