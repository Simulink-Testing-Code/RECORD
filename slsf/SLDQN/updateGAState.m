function reward = updateGAState(Action)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
%   产生的新的模型诞生的特征向量，即新的观察值（状�?�向量）以及获取即使奖励
    disp(Action)
    %% 执行slforge过程
    bdclose('all');
    %addpath 'D:\chengfile\slsf_randgen-master\slsf';
    % 更改参数
    cd ..\
    newParam = chengeGASL_BLOCKLIBS(Action);
    %disp(newParam);
    cfg_new = cfg(newParam);
    %scm = cfg_new.SL_BLOCKLIBS;
    %disp(scm);
    disp(cfg_new)
    %执行slforge，生成模�?
    sgtest(cfg_new);
    
    %% 获取生成模型并计算特�?
    cd SLDQN\
    reportsneofile = dir('..\reportsneo\');
    disp(reportsneofile);
    folder = reportsneofile(end-1).name;     %�?新生成的文件�?2021-11-...
    successfile = dir(fullfile('..','reportsneo',folder,'success','*.slx'));
    success_fileNum = length(successfile);
    %死代码特征获�?
    %{
    deadfeature1 = zombie_extraction(successfile);      %1*n
    %不足100个死代码特征�?0补全
    deadsize = size(deadfeature1);
    if length(deadfeature1)<100
        neededState = 100-success_fileNum;
        deadfeature = [deadfeature1 zeros(deadsize(1),neededState)];
    else
        deadfeature = deadfeature1(1:100);      %行向�?1*100
    end
    % 成功的模型个�?
    %}
    Nonfile = fullfile('..','reportsneo',folder); 
    disp(success_fileNum)
    if  isempty(successfile)
        %���ȫ��ʧ��
        new_State = zeros(dqncfg.NUM_TESTS,dqncfg.stateLen);
        reward = 0;
        save(fullfile(Nonfile,'Rewardreport.mat'),'Action','reward','new_State')
        return
    else
        successPath = successfile.folder;
    end
   
    disp(successPath)
    copyfile("get_matlab_metrics.m",successPath);
    copyfile("run_for_metrics.m",successPath);
    copyfile("dqncfg.m",successPath);
    oldpath =  cd(successPath);
    cd
    %new_State = run_for_metrics('D:\cheng_matlab_code\slsf_randgen-master\slsf_randgen-master\slsf\DQNcode');
    new_State1 = run_for_metrics(successPath);
    new_State1
    % 若成功的小于100，则补零
    if success_fileNum<dqncfg.NUM_TESTS
        neededState = dqncfg.NUM_TESTS-success_fileNum;
        new_State2 = cat(1,new_State1,zeros(neededState,dqncfg.stateLen));
    else
        new_State2 = new_State1;
    end
    new_State2
    %deadfeature
%{
    new_State3 = cat(2,new_State2,deadfeature');   %100*22,100*1 =100*23  ����Ӹ��Ӷ�
    disp(new_State3);
    %}
    cd(oldpath)
    cd
 %{
    slxtomdl(successfile)
    blockfeature = getBlockandLine_feature(successPath);
    disp('---------------------------------------BlockFeature-----------------------------')
    blockfeature
    new_State = [new_State3 blockfeature];      %100*23,100*127=100*150
        %}
    new_State = new_State2;
    %% 计算奖励
    % 空间几何中心

    if size(new_State,1)<=1
        newCenter = new_State;
    else
        newCenter = mean(new_State);
    end
      %即时奖励
    disp(newCenter)
    %{
    total = zeros(1,150);
    for i=1:length(newCenter)
        R1=newCenter(i);
        R2 = oldCenter(i);
        total(i)=abs(R1-R2);
        disp(['R1:' num2str(R1) '     ' 'R2:' num2str(R2) '    ' 'total(' num2str(i) ')' num2str(total(i))])
    end
    %}
    diver = sum(newCenter);
    disp(diver);

    reward = -diver;   %即使奖励,GA找最小�?�所以取负号
 
    %reward = manhantondis(oldCenter,newCenter);
    save(fullfile(successPath,'GARewardreport.mat'),'reward','Action','new_State2','new_State')
    clear newParam cfg_new reportsneofile successfile new_State1 new_State2
    
end


