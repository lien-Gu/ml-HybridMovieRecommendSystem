function [msr] = MSRCal(A, B)
%MSRCAL 此处显示有关此函数的摘要
%   此处显示详细说明
msr = sum((A-B).^2) / length(A);
end

