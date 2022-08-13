ObjectiveFunction = @updateGAState;
nvars = 7;%变量个数
LB = [0.15;0.15;0.15;0.15;0.15;0.15;0.15];%定义域下限
UB = [1;1;1;1;1;1;1];%定义域上限
 
[x,fval] = ga(ObjectiveFunction,nvars,[],[],[],[],LB,UB)%调用ga函数
