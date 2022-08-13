function [prestate,preaction,prereward,preterminateFlag] = predata(state,action,reward,terminateFlag)
%PREDATE 此处显示有关此函数的摘要
%   此处显示详细说明
sizestate = size(state);
prestate = zeros(dqncfg.NUM_TESTS,dqncfg.stateLen);
if sizestate(1)==1
    for i=1:dqncfg.stateLen
        prestate([1:dqncfg.NUM_TESTS],i)=state(i);
    end
else
    prestate = state;
end
preaction = zeros(dqncfg.NUM_TESTS,7);
for i=1:7
    preaction([1:dqncfg.NUM_TESTS],i) = action(i);
end
prereward([1:dqncfg.NUM_TESTS],1) = reward;
preterminateFlag([1:dqncfg.NUM_TESTS],1) = terminateFlag;
end

