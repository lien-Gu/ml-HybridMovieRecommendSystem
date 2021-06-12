function [base,test] = dataLoad(dataName, m, n)
%DATALOAD �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
base = zeros(m, n);
test = zeros(m, n);

path_base = "D:\coder\octave_coder\bishe\ml-100k\u"+dataName+"_base.txt";
path_test= "D:\coder\octave_coder\bishe\ml-100k\u"+dataName+"_test.txt";
%��ȡ����
u_base = readtable(path_base);
u_test = readtable(path_test);
%�����ת��Ϊ����
u_base = table2array(u_base(:,1:3));
u_test = table2array(u_test(:,1:3));
%������ת��Ϊ��ά����
for i = 1:size(u_base, 1)
    base(u_base(i, 1), u_base(i, 2)) = u_base(i, 3);
end
for i = 1:size(u_test, 1)
    test(u_test(i, 1), u_test(i, 2)) = u_test(i, 3);
end

%ϡ����󣬿�ȱ����Ϊ0
base(isnan(base)) = 0;
test(isnan(test)) = 0;
fprintf('\n���ݼ��أ�Ԥ�������\n');
end

