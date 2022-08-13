function [actionIdx] = takeAction(evn,net,trainFlag,episodeNum)
%takeAction 此处显示有关此函数的摘要
%   此处显示详细说明
%observe the evn
disp('----------------take action evn.State------------------------');
disp(evn.State);
if size(evn.State)==[dqncfg.stateLen dqncfg.NUM_TESTS]
    Q = net(evn.State);            % 根据net和当前状态，拟合求出所有的动作的Q值
else
    Q = net(evn.State');
end
numActions = 3;
if trainFlag
    epsilon = power(0.1,ceil(episodeNum/4));
else
    epsilon = 0;
end

%最大Q值
if rand < epsilon
    actionIdx = randi(numActions);
else
%     actionIdx = find(Q == max(Q));
    [actionIdx, ~] = find(Q == max(Q,[],'all'));        %矩阵中最大值所在的操作
%     actionIdx = actionIdx(randi(length(actionIdx)));        %只返回最大的Q所在索引
    actionIdx = actionIdx(1);
    assert(actionIdx <= numActions, ['actionIdx has an invalid value,actionIdx<=numActions' num2str(actionIdx) '!']);
end


