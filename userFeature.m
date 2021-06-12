function [user_f] = userFeature(users_movies,movies)
%USERFEATURE 计算用户特征矩阵m*k,m为用户数量，k为电影类型
user_f = zeros(size(users_movies, 1), size(movies, 2));
 m = size(users_movies, 1);
for i = 1:m
    tmp = movies .* users_movies(i,:)';
    user_f(i,:) = sum(tmp);
    % user_f(i,:) = sum(movies .* users_movies(i,:)');
end
user_f(isnan(user_f)) = 0;
end

