function [rec] = recomendList(A, n)
%RECOMENDLIST �����û�����Ϊ�û��Ƽ�n����Ӱ
%   �˴���ʾ��ϸ˵��
m  =size(A, 1);
% �Ƽ�Ϊ1�����Ƽ�Ϊ0���Ƽ�����Ϊm*n�ľ���
rec = zeros(size(A));

for i= 1:m
    [~, L] = sort(A(i,:),'descend');
    rec(i,L(1:n)) = 1;
end
end

