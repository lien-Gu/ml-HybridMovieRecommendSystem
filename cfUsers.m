function [pred, time] = cfUsers(base, method)
%CFUSERS 此处显示有关此函数的摘要
%   此处显示详细说明
t0 = clock;%计算开始时间
%初始化
time = 0;
pred = zeros(size(base));


%计算用户相似度
users_s = squareform(pdist(base,method));

%相似度越大越相似,权重越高
u_L = eye(size(base, 1));%对角矩阵
users_s = (1 - (users_s / max(max(users_s))));
users_s = users_s - users_s .* u_L;

%根据书籍相似度来预测分数
pred = (users_s * base) ./ sum(users_s, 2);%计算出预测分数


%计算运行时长
time = etime(clock, t0);
end

