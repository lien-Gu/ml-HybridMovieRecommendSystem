function [pred, time] = cfMovies(base, method)
%CFUSERS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
time = 0;
pred = zeros(size(base));
t0 = clock;

%  ���ȼ����û�֮������ƶ�
%  ���ƶȼ�����Բ��ö��ַ���
n = size(base, 2);
books_s = zeros(n, n);

%�����鼮���ƶ�
books_s = squareform(pdist(base',method));

%���ƶ�Խ��Խ����,Ȩ��Խ��
b_L = eye(size(base, 2));%�ԽǾ���
books_s = (1 - (books_s / max(max(books_s))));
books_s = books_s - books_s .* b_L;


%�����鼮���ƶ���Ԥ�����
pred = ((books_s * base') ./ sum(books_s, 2))';%�����Ԥ�����

pred(isnan(pred)) = 0;
time = etime(clock, t0);
end
