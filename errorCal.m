function [error] = errorCal(A, B)
%ERROR_CAL 计算矩阵A、B之间的误差，A是预测，B是真实值
%   返回参数:准确率
error = 0;
% 因为这里是计算精度，将原矩阵中没有的置为0
A(B == 0) = 0;

% 计算矩阵中非零元素个数,也就是预测了多少个评分便于后面的归一化计算
data_1 = B(B ~= 0);
numNonZero = sum(data_1(:));
%计算的是平方误差
error = sum(sum((A - B) .^ 2));
error =  error / numNonZero;

end

