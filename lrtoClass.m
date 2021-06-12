function [pred] = lrtoClass(p)
%LRTOCLASS 此处显示有关此函数的摘要
%   此处显示详细说明
[m, n] = size(p);
pred = zeros(m,n);
for i=1:m
    for j=1:n
        if (p(i,j) - floor(p(i,j))) <= 0.5
            pred(i,j) = floor(p(i,j));
        else
            pred(i,j) = ceil(p(i,j));
        end
    end
end

end

