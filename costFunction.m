function [J] = costFunction(x, y)
%COSTFUNCTION 计算预测值和真是值之间的距离
% MSR
J = 0;
m = size(x,1);
J = sum((x-y).^2) / m ;

end
