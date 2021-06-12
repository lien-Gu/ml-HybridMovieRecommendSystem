function [recall] = recallCal(A, B, n)
%RECALLCAL A��Ԥ��ֵ��B����ʵֵ��n���Ƽ�����
%   ������ٻ���,���Ƽ���Ʒ���û�ʵ�ʸ���Ȥ��Ӱռ���и���Ȥ��Ӱ�ı���
recall = 0;
m = size(A, 1);
% ��ʵֵ��Ϊ0�ĵط�Ԥ��ֵҲΪ0�����ڼ���
A(B == 0) = 0;
re_A = recomendList(A, n);
re_B = recomendList(B, n);
for i = 1:m
    recall = recall + size(intersect(re_A(i,:), re_B(i,:)), 2) / size(re_B(i,:), 2);
end
recall = recall / m;
end

