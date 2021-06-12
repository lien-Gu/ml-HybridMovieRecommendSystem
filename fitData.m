function [J, theta] = fitData(pred, base, initial_theta)
%FITDATA 此处显示有关此函数的摘要
%   此处显示详细说明
m = size(base, 1);

J = 0;
theta = zeros(m, 2);

for i = 1:m
    [theta_cb, ~] = fminunc(@(t)costFunction_row(pred(i,:), base(i,:), t), initial_theta);
    theta(m,:) = theta_cb;
end
end

