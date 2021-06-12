function [J] = costJ(P, Y)
%COSTJ 此处显示有关此函数的摘要
%   此处显示详细说明
J=0;
m = size(P, 1);
for i=1:m
    J = J + costFunction_row(P(i,:), Y(i,:), [0, 1]);
end
end

