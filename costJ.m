function [J] = costJ(P, Y)
%COSTJ �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
J=0;
m = size(P, 1);
for i=1:m
    J = J + costFunction_row(P(i,:), Y(i,:), [0, 1]);
end
end

