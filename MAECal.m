function [mae] = MAECal(A, B)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   ƽ���������
mae = sum(abs(A - B)) / length(A);
end

