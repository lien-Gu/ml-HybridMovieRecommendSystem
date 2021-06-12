function [recall] = recallCal(A, B, n)
%RECALLCAL A是预测值，B是真实值，n是推荐个数
%   输出：召回率,是推荐物品中用户实际感兴趣电影占所有感兴趣电影的比例
recall = 0;
m = size(A, 1);
% 真实值中为0的地方预测值也为0，遍于计算
A(B == 0) = 0;
re_A = recomendList(A, n);
re_B = recomendList(B, n);
for i = 1:m
    recall = recall + size(intersect(re_A(i,:), re_B(i,:)), 2) / size(re_B(i,:), 2);
end
recall = recall / m;
end

