function [n_users, n_movies] = readData()
%READDATA ��ml-100k�ж�ȡ����
%   �û���������
u_data = readtable('D:\coder\octave_coder\bishe\ml-100k\u_data.txt');
% ��Ӱ����
u_genre = readtable('D:\coder\octave_coder\bishe\ml-100k\u_genre.txt');
% ���ݼ���Ϣ����
u_info = readtable('D:\coder\octave_coder\bishe\ml-100k\u_info.txt');
% ��Ӱ��Ϣ����
u_movies = readtable('D:\coder\octave_coder\bishe\ml-100k\u_item.txt');
% �û�ְҵ
u_occupation = readtable('D:\coder\octave_coder\bishe\ml-100k\u_occupation.txt');
% �û�������Ϣ
u_user = readtable('D:\coder\octave_coder\bishe\ml-100k\u_user.txt');

u_data = table2array(u_data(:,1:3));
u_data_name = ['user id','item id','rating','timestamp'];
%�ܵ��û��������ܵ���Ʒ�������ܵ���������
n_users = table2array(u_info(1,1));
n_movies = table2array(u_info(2,1));
n_ratings = table2array(u_info(3,1));
n_genre = 18;%����δ֪

%��Ʒ��ı�ͷ
u_movies_name = ['movie id','movie title','release date','video release date',...
              'IMDb URL','unknown','Action','Adventure','Animation',...
              'Children''s','Comedy','CrimeDocumentary','Drama','Fantasy',...
              'Film-Noir','Horror','Musical','Mystery','Romance','Sci-Fi',...
              'Thriller','War','Western '];
fprintf('\n���ݼ������\n');


users_movies = zeros(n_users, n_movies);
users_moviesR = zeros(n_users, n_movies);
for i = 1:size(u_data, 1)
    users_movies(u_data(i, 1), u_data(i, 2)) = u_data(i, 3);
    users_moviesR(u_data(i, 1), u_data(i, 2)) = 1;
end

fprintf('\n�û�-�鼮�������\n');

%����Ʒ�������ݹ���������һ����ά��
movies = table2array(u_movies(:, 7:24));
movies_title = u_movies_name(7:24);
fprintf('\n��Ʒ-���ͱ������\n');

% �����Ӱ��Ϣ��
u_movies = removevars(u_movies, 'Var4');
u_movies = u_movies(:,1:4);
u_movies.Properties.VariableNames = {'movie id','movie title','video release date','IMDb URL'};
u_movies = table2cell(u_movies);
for i = 1:size(u_movies, 1)
    str = cell2mat(u_movies(i,2));
    u_movies(i,2) = cellstr(str(1:length(str)-6));
end
fprintf('\n���ݴ������\n');

% �㷨ѵ���������Ϣ
save('data1.mat','users_movies','users_moviesR','movies','n_users', 'n_movies');
% �Ƽ���ʾ�������Ϣ
save('data2.mat','u_genre','u_occupation','u_user','movies_title','u_movies','users_moviesR');

end

