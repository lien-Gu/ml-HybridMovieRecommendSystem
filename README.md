# ml-HybridMovieRecommendSystem
这是一个运用混合推荐算法进行电影推荐的算法

**数据集**
来自MovieLens网站（https://grouplens.org/datasets/movielens/）提供的开源数据集ml-100k

**主要内容**
对传统基于内容的推荐算法和协同过滤推荐算法进行复现
根据数据集特性提出一种基于机器学习地混合推荐算法

**算法**
1、首先将基于内容的推荐算法和基于用户的协同过滤推荐算法预测结果输出；
2、进行特征构建，构建出不同维度特征然后进行测试；
3、训练模型：将特征矩阵输入具有6个分类器的逻辑回归模型中
4、结果输出：将训练输出的结果转化问用户对电影的评分然后输出
