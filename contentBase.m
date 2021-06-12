function [pred, time] = contentBase(base, movies ,tag)
%CONTENTBASE 此处显示有关此函数的摘要

t0 = clock;
[m, n] = size(base);

%参数初始化
time = 0;
pred = zeros(m, n);

%计算用户矩阵
user_f = userFeature(base,movies);

%预测矩阵
pred = user_f * movies';
%特征缩放
pred = pred / max(max(pred)) * 5;
%tag表示是否拟合，拟合不会影响召回率
if tag
    [~, theta_cb] = fitData(pred, base,[1, 1]);
    %矩阵拟合
    for i = 1:m
    pred(i,:) = theta_cb(1) + theta_cb(2) * pred(i,:);
    end
end
time  = etime(clock, t0);
 
end

