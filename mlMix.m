function [pred, theta, time]=mlMix(base, movies, method, iter, p, initial_theta)
%UNTITLED ���л���ml�Ļ���Ƽ��㷨
% ���õĺ��� contentBase.m
%           lrtoClass.m...
%           cfUsers.m...
%           train1toN.m...
%           XPoly.m...
%           pred6to1.m
%   �˴���ʾ��ϸ˵��
time = 0;
[m,n] = size(base);
num_labels = 6;

%����CBԤ�����
p_cb = contentBase(base, movies, 0);
p_cb = lrtoClass(p_cb);
%����CFԤ�����
p_cf = cfUsers(base,method);
p_cf = lrtoClass(p_cf);

y_base = base(:);
y_base(y_base==0) = 6;%����Ѱ�ұ�ǩ
%% ���η���
t0 = clock;
%�����
x1 = p_cb(:);
x2 = p_cf(:);
X = [x1 x2];
X_p = XPoly(X, p);
X_p = [ones(length(x1), 1) X_p];

lambda = 0.1;
thetar = train1toN(X_p, y_base, num_labels, lambda, iter, initial_theta);
pred = pred6to1(X_p, thetar, m, n);
pred = lrtoClass(pred);





time  = etime(clock, t0);
theta = thetar(:);
%mean(double(pred == y)) * 100

end

