function L = predict(id, num, pred, R, movies)
%PREDICT �����Ƽ��б�
% ��������

pred = pred .* R;
[slist, list] = sort(pred,'descend');


fprintf("�û�idΪ%d���Ƽ�%d����:\n",id,num);
for i = 1:num
    fprintf("movie id id:%d,movie title:%s,Ԥ������Ϊ%d\n",list(i), string(movies(list(i), 2)),slist(i));
end
end

