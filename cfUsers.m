function [pred, time] = cfUsers(base, method)
%CFUSERS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
t0 = clock;%���㿪ʼʱ��
%��ʼ��
time = 0;
pred = zeros(size(base));


%�����û����ƶ�
users_s = squareform(pdist(base,method));

%���ƶ�Խ��Խ����,Ȩ��Խ��
u_L = eye(size(base, 1));%�ԽǾ���
users_s = (1 - (users_s / max(max(users_s))));
users_s = users_s - users_s .* u_L;

%�����鼮���ƶ���Ԥ�����
pred = (users_s * base) ./ sum(users_s, 2);%�����Ԥ�����


%��������ʱ��
time = etime(clock, t0);
end

