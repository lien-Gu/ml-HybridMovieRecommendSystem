function [J] = costFunction_row(x, y, theta)
%COSTFUNCTION1 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
J = 0;

%�����֪�������
x(y == 0) =0;
% ������ۺ���
h = zeros(size(x));

for i = 1:size(theta, 2)
    h = h + theta(i) * (x.^(i-1));%����һԪn�η��������
end
J = sum((h - y).^2);
end

