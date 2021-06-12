function [X_p] = XPoly(X, p)
%XPLOY 将X变为最高p次的变量矩阵，增加特征数
%   X是具有x1,x1向量
x1 = X(:,1);
x2 = X(:,2);

if p == 1
    X_p = X;
elseif p == 2
    X_p = [X x1.^2 x1.*x1 x2.^2];
elseif p == 3
     X_p = [X x1.^2 x1.*x1 x2.^2];
     X_p = [X_p X_p(:,3).*x1 X_p(:,3).*x2 X_p(:,5).*x1 X_p(:,5).*x2];
end

end

