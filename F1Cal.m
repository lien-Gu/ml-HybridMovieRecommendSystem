function [F1, prec, rec] = F1Cal(A, B, n)
%F1CAL 有召回率计算f1
%   此处显示详细说明

re_A = recomendList(A, n);
re_B = recomendList(B, n);


tp = sum(sum((re_A == 1)&(re_B == 1)));
fp = sum(sum((re_A == 1)&(re_B == 0)));
fn = sum(sum((re_A == 0)&(re_B == 1)));

prec = tp / (tp + fp); 
rec = tp / (tp + fn);
 
 F1 = 2 * prec * rec / (prec + rec);
end

