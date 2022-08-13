function reward = manhantondis(inoldCenter,newCenter)
%UNTITLED2 计算当前中心和之前所有组中心的距离
%   返回一个多样性列表（元素表示和之前每组的曼哈顿差值）
    global totalState;     %保存所有空间几何中心特征的矩阵
    if height(totalState)<1
        totalState = cat(1,totalState,inoldCenter,newCenter);
    else
        totalState = cat(1,totalState,newCenter);
    end
    Rewardlist = [];        %最终空间几何中心计算得到的所有奖励列表
    ARewardtotal = zeros(1,dqncfg.stateLen);        %单次奖励所在行计算得到的奖励值
    for n=1:(height(totalState)-1)
            oldCenter = totalState(n,:);
            for i=1:length(newCenter)
                R1=newCenter(i);
                R2 = oldCenter(i);
                ARewardtotal(i)=abs(R1-R2);
                disp(['R1:' num2str(R1) '     ' 'R2:' num2str(R2) '    ' 'ARewardtotal(' num2str(i) '):' num2str(ARewardtotal(i))])
            end
            diver = sum(ARewardtotal);
            diver
            Rewardlist=[Rewardlist diver];
    end

    reward = min(Rewardlist);

end

