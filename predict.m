function L = predict(id, num, pred, R, movies)
%PREDICT 给出推荐列表
% 加载数据

pred = pred .* R;
[slist, list] = sort(pred,'descend');


fprintf("用户id为%d的推荐%d本书:\n",id,num);
for i = 1:num
    fprintf("movie id id:%d,movie title:%s,预测评分为%d\n",list(i), string(movies(list(i), 2)),slist(i));
end
end

