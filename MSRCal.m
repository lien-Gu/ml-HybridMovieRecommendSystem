function [msr] = MSRCal(A, B)
%MSRCAL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
msr = sum((A-B).^2) / length(A);
end

