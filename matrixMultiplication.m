function C = matrixMultiplication(A, B, C, version)
%% --------------- Interface ---------------
%   Input
%       A : matrix, size = (m, p)
%       B : matrix, size = (p, n)
%       C : matrix, size = (m, n)
%       version : int
%               Specify the version of matrixMultiplication. 
%               VERSION may be one of the following int:
%                   '1.1.5' : ijk variant(scalar-level, algorithm 1.1.5)
%                   '1.1.6' : Dot product version(algorithm 1.1.6)
%                   '1.1.7' : Saxpy version(algorithm 1.1.7)
%                   '1.1.8' : Outer product version(algorithm 1.1.8)
%   Output
%       C = AB + C
%   Example
%       >> A = [1 2; 3 4; 5 6;]
%       >> B = [7 8 9 10; 11 12 13 14]
%       >> C = [15 16 17 18; 19 20 21 22; 23 24 25 26]
%       >> A*B+C
%       >> tic; C1 = matrixMultiplication(A, B, C, '1.1.5'), toc;
%       >> tic; C2 = matrixMultiplication(A, B, C, '1.1.6'), toc;
%       >> tic; C3 = matrixMultiplication(A, B, C, '1.1.7'), toc;
%       >> tic; C4 = matrixMultiplication(A, B, C, '1.1.8'), toc;
%   Reference
%       Algorithm 1.1.5-1.1.8
%       Golub G H, Van Loan C F. Matrix computations[M]. JHU Press, 2012.
%   Coder
%       Weizhe Chen : cosmo_chan@126.com
%% -----------------------------------------
    [m, p] = size(A);
    [~, n] = size(B);
%% -----------------------------------------
    if strcmp(version, '1.1.5')
        for i = 1 : m
            for j = 1 : n
                 for k = 1 : p
                     C(i, j) = A(i, k) * B(k, j) + C(i, j);
                 end
            end
        end
    elseif strcmp(version, '1.1.6')
        for i = 1 : m
            for j = 1 : n
                C(i, j) = A(i, :) * B(:, j) + C(i, j);
            end
        end
    elseif strcmp(version, '1.1.7')
        for j = 1 : n
            for k = 1 : p
                C(:, j) = saxpy(B(k, j), A(:, k), C(:, j));
            end
        end
    elseif strcmp(version, '1.1.8')
        for k = 1 : p
            C = outerProductUpdate(C, A(:, k), B(k, :));
        end
    else
        warning('VERSION must be string "1.1.5", "1.1.6", "1.1.7" or "1.1.8"')
    end
end