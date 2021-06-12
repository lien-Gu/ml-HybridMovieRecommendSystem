function [base,test] = dataLoad(dataName, m, n)
%DATALOAD 此处显示有关此函数的摘要
%   此处显示详细说明
base = zeros(m, n);
test = zeros(m, n);

path_base = "D:\coder\octave_coder\bishe\ml-100k\u"+dataName+"_base.txt";
path_test= "D:\coder\octave_coder\bishe\ml-100k\u"+dataName+"_test.txt";
%读取数据
u_base = readtable(path_base);
u_test = readtable(path_test);
%将表格转化为数组
u_base = table2array(u_base(:,1:3));
u_test = table2array(u_test(:,1:3));
%将数组转化为二维矩阵
for i = 1:size(u_base, 1)
    base(u_base(i, 1), u_base(i, 2)) = u_base(i, 3);
end
for i = 1:size(u_test, 1)
    test(u_test(i, 1), u_test(i, 2)) = u_test(i, 3);
end

%稀疏矩阵，空缺处置为0
base(isnan(base)) = 0;
test(isnan(test)) = 0;
fprintf('\n数据加载，预处理完成\n');
end

