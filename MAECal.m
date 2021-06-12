function [mae] = MAECal(A, B)
%UNTITLED 此处显示有关此函数的摘要
%   平均绝对误差
mae = sum(abs(A - B)) / length(A);
end

