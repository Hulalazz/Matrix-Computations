function y = gaxpy(A, x, y, rowForm)

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