function [n_users, n_movies] = readData()
%READDATA 从ml-100k中读取数据
%   用户评论数据
u_data = readtable('D:\coder\octave_coder\bishe\ml-100k\u_data.txt');
% 电影类型
u_genre = readtable('D:\coder\octave_coder\bishe\ml-100k\u_genre.txt');
% 数据集信息数据
u_info = readtable('D:\coder\octave_coder\bishe\ml-100k\u_info.txt');
% 电影信息数据
u_movies = readtable('D:\coder\octave_coder\bishe\ml-100k\u_item.txt');
% 用户职业
u_occupation = readtable('D:\coder\octave_coder\bishe\ml-100k\u_occupation.txt');
% 用户个人信息
u_user = readtable('D:\coder\octave_coder\bishe\ml-100k\u_user.txt');

u_data = table2array(u_data(:,1:3));
u_data_name = ['user id','item id','rating','timestamp'];
%总的用户数量，总的物品数量，总的评论数量
n_users = table2array(u_info(1,1));
n_movies = table2array(u_info(2,1));
n_ratings = table2array(u_info(3,1));
n_genre = 18;%不算未知

%作品表的表头
u_movies_name = ['movie id','movie title','release date','video release date',...
              'IMDb URL','unknown','Action','Adventure','Animation',...
              'Children''s','Comedy','CrimeDocumentary','Drama','Fantasy',...
              'Film-Noir','Horror','Musical','Mystery','Romance','Sci-Fi',...
              'Thriller','War','Western '];
fprintf('\n数据加载完毕\n');


users_movies = zeros(n_users, n_movies);
users_moviesR = zeros(n_users, n_movies);
for i = 1:size(u_data, 1)
    users_movies(u_data(i, 1), u_data(i, 2)) = u_data(i, 3);
    users_moviesR(u_data(i, 1), u_data(i, 2)) = 1;
end

fprintf('\n用户-书籍表处理完成\n');

%将作品语气内容关联，构建一个二维表
movies = table2array(u_movies(:, 7:24));
movies_title = u_movies_name(7:24);
fprintf('\n作品-类型表处理完成\n');

% 处理电影信息表
u_movies = removevars(u_movies, 'Var4');
u_movies = u_movies(:,1:4);
u_movies.Properties.VariableNames = {'movie id','movie title','video release date','IMDb URL'};
u_movies = table2cell(u_movies);
for i = 1:size(u_movies, 1)
    str = cell2mat(u_movies(i,2));
    u_movies(i,2) = cellstr(str(1:length(str)-6));
end
fprintf('\n数据处理完毕\n');

% 算法训练所需的信息
save('data1.mat','users_movies','users_moviesR','movies','n_users', 'n_movies');
% 推荐表示所需的信息
save('data2.mat','u_genre','u_occupation','u_user','movies_title','u_movies','users_moviesR');

end

