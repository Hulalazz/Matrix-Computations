function y = saxpy(a, x, y)
    n = length(y);
    for i = 1 : n
        y(i) = a * x(i) + y(i);
    end
end