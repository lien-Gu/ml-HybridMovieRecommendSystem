function [J] = costFunction(x, y)
%COSTFUNCTION ����Ԥ��ֵ������ֵ֮��ľ���
% MSR
J = 0;
m = size(x,1);
J = sum((x-y).^2) / m ;

end
