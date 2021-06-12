function [rec] = recomendList(A, n)
%RECOMENDLIST 根据用户评分为用户推荐n个电影
%   此处显示详细说明
m  =size(A, 1);
% 推荐为1，不推荐为0，推荐矩阵为m*n的矩阵
rec = zeros(size(A));

for i= 1:m
    [~, L] = sort(A(i,:),'descend');
    rec(i,L(1:n)) = 1;
end
end

