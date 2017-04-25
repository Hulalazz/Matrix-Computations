function c = dot(x, y)
%% --------------- Interface ---------------
%   Input
%       x : vector, size = (1, n) or (n, 1)
%       y : vector, size = (1, n) or (n, 1)
%   Output
%       c = \mathbf{x}^\top \mathbf{y};
%   Example
%       >> x = [1, 2, 3]; 
%       >> y = [4, 5, 6]; 
%       >> c = dot(x, y)
%   Reference
%       Algorithm 1.1.1
%       Golub G H, Van Loan C F. Matrix computations[M]. JHU Press, 2012.
%   Coder
%       Weizhe Chen : cosmo_chan@126.com
%% -----------------------------------------
    c = 0;
    n = length(x);
    for i = 1 : n
        c = c + x(i) * y(i);
    end
end