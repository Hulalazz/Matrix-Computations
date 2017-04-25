function y = gaxpy(A, x, y, rowForm)
%% --------------- Interface ---------------
%   Input
%       A : matrix, size = (m, n)
%       x : vector, size = (1, n) or (n, 1)
%       y : vector, size = (1, n) or (n, 1)
%       rowForm : logical
%               Specify the gaxpy form, if rowForm = true, row form gaxpy
%               will be used, or column form will be used.
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
    if rowForm % row form
        for i = 1 : m
            for j = 1 : n
                y(i) = A(i, j) * x(j) + y(i);
            end
        end
    else % column form
        for j = 1 : n
            for j = 1 : m
                y(i) = A(i, j) * x(j) + y(i);
            end
        end
    end
    
end