function [J] = costFunction_row(x, y, theta)
%COSTFUNCTION1 此处显示有关此函数的摘要
%   此处显示详细说明
J = 0;

%针对已知数据拟合
x(y == 0) =0;
% 计算代价函数
h = zeros(size(x));

for i = 1:size(theta, 2)
    h = h + theta(i) * (x.^(i-1));%采用一元n次方程来拟合
end
J = sum((h - y).^2);
end

