function [pred, time] = contentBase(base, movies ,tag)
%CONTENTBASE �˴���ʾ�йش˺�����ժҪ

t0 = clock;
[m, n] = size(base);

%������ʼ��
time = 0;
pred = zeros(m, n);

%�����û�����
user_f = userFeature(base,movies);

%Ԥ�����
pred = user_f * movies';
%��������
pred = pred / max(max(pred)) * 5;
%tag��ʾ�Ƿ���ϣ���ϲ���Ӱ���ٻ���
if tag
    [~, theta_cb] = fitData(pred, base,[1, 1]);
    %�������
    for i = 1:m
    pred(i,:) = theta_cb(1) + theta_cb(2) * pred(i,:);
    end
end
time  = etime(clock, t0);
 
end

