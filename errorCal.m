function [error] = errorCal(A, B)
%ERROR_CAL �������A��B֮�����A��Ԥ�⣬B����ʵֵ
%   ���ز���:׼ȷ��
error = 0;
% ��Ϊ�����Ǽ��㾫�ȣ���ԭ������û�е���Ϊ0
A(B == 0) = 0;

% ��������з���Ԫ�ظ���,Ҳ����Ԥ���˶��ٸ����ֱ��ں���Ĺ�һ������
data_1 = B(B ~= 0);
numNonZero = sum(data_1(:));
%�������ƽ�����
error = sum(sum((A - B) .^ 2));
error =  error / numNonZero;

end

