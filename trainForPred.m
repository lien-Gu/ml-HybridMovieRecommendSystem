function trainForPred()
%TRAINFORPRED 为推荐引用而训练
load('data1.mat');
times = 10;
method = "jaccard";

predCB = zeros(size(users_movies));
predCFU = zeros(size(users_movies));
predCFM = zeros(size(users_movies));
predMix = zeros(size(users_movies));


predCB = contentBase(users_movies,movies ,0);
predCFU = cfUsers(users_movies, method);
predCFM = cfUsers(users_movies, method);
for i = 1: times
    predMix = predMix + mlMix(users_movies, movies, method, 20, 1, [0;1;0]);
end
predMix = predMix / times;

save('dataForPredict.mat', 'predCB','predCFU','predCFM', 'predMix');
end

