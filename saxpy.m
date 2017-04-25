function y = saxpy(a, x, y)
%% --------------- Interface ---------------
%   Input
%       a : double, scalar
%       x : vector, size = (1, n) or (n, 1)
%       y : vector, size = (1, n) or (n, 1)
%   Output
%       y = a \mathbf{x} + \mathbf{y}.
%   Example
%       >> a = 2;
%       >> x = [1, 2, 3];
%       >> y = [4, 5, 6];
%       >> y = saxpy(a, x, y)
%   Reference
%       Algorithm 1.1.2
%       Golub G H, Van Loan C F. Matrix computations[M]. JHU Press, 2012.
%   Coder
%       Weizhe Chen : cosmo_chan@126.com
%% -----------------------------------------
    n = length(y);
    for i = 1 : n
        y(i) = a * x(i) + y(i);
    end
end