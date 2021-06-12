function [pred, time] = cfMovies(base, method)
%CFUSERS 此处显示有关此函数的摘要
%   此处显示详细说明
time = 0;
pred = zeros(size(base));
t0 = clock;

%  首先计算用户之间地相似度
%  相似度计算可以采用多种方法
n = size(base, 2);
books_s = zeros(n, n);

%计算书籍相似度
books_s = squareform(pdist(base',method));

%相似度越大越相似,权重越高
b_L = eye(size(base, 2));%对角矩阵
books_s = (1 - (books_s / max(max(books_s))));
books_s = books_s - books_s .* b_L;


%根据书籍相似度来预测分数
pred = ((books_s * base') ./ sum(books_s, 2))';%计算出预测分数

pred(isnan(pred)) = 0;
time = etime(clock, t0);
end
