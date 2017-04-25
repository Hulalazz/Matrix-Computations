function c = dot(x, y)
    c = 0;
    n = length(x);
    for i = 1 : n
        c = c + x(i) * y(i);
    end
end