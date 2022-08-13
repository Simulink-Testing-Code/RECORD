function [new_State,reward,restart] = updateState(Action,oldstate)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
%   产生的新的模型诞生的特征向量，即新的观察值（状态向量）以及获取即使奖励
    global totalState;
    global totalFeature;
    totalFeature = load(dqncfg.CACHDATA_FILE,'totalFeature');
    totalFeature = struct2array(totalFeature);
    totalState = load(dqncfg.CACHDATA_FILE,'totalState');
    totalState = struct2array(totalState);
    disp(Action)
    %% 执行slforge过程
                
    % 更改参数
    cd ..\
    [cfg_newParam,newParam] = chengeSL_BLOCKLIBS(Action);      %cfg_newParam是归一化后的结构体，newParam临时变量，是我们随机得到的参数，函数末尾可clear newParam
    cfg_new = cfg(cfg_newParam);                     %函数末尾可clear cfg_new
    disp(cfg_new)
    %执行slforge，生成模型
    slforgestart = tic;
    sgtest(cfg_new);
    slforgeTime = toc(slforgestart);
    save('time.mat','slforgeTime');
    clear slforgeTime
    
    %% 获取生成模型并计算特征
    
    cd SLDQN\
    reportsneofile = dir('..\reportsneo\');     %函数末尾可清除clear reportsneofile
    disp(reportsneofile);
    folder = reportsneofile(end-1).name;     %最新生成的文件夹2021-11-...
    copyfile("..\time.mat",fullfile("..\reportsneo",folder,"success"));
    successfile = dir(fullfile('..','reportsneo',folder,'success','*.slx'));        %函数末尾可清除successfile
    success_fileNum = length(successfile);      
    %死代码特征获取
    %{
    deadfeature1 = zombie_extraction(successfile);      %1*n
    %不足100个死代码特征用0补全
    deadsize = size(deadfeature1);
    if length(deadfeature1)<dqncfg.NUM_TESTS
        neededState = dqncfg.NUM_TESTS-success_fileNum;
        deadfeature = [deadfeature1 zeros(deadsize(1),neededState)];
    else
        deadfeature = deadfeature1(1:dqncfg.NUM_TESTS);      %行向量1*100
    end
    %}
    Nonfile = fullfile('..','reportsneo',folder);  
    disp(success_fileNum)
    if  isempty(successfile)
        %如果全部失败
        new_State = -0.5*ones(dqncfg.NUM_TESTS,dqncfg.stateLen);
        Feature = zeros(dqncfg.NUM_TESTS,dqncfg.stateLen);
        totalState = cat(1,totalState,mean(new_State));
        totalFeature = cat(1,totalFeature,mean(Feature));
        reward = -100;
        restart = true;
        save(fullfile(Nonfile,'Rewardreport.mat'),'totalState','totalFeature','reward','Action','oldstate','new_State','Feature','newParam')
        save(dqncfg.CACHDATA_FILE,'totalState')
        save(dqncfg.CACHDATAFEATURE_FILE,'totalFeature')
        clear totalState
        clear totalFeature
        clear Feature
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
    
    metricsstart = tic;
    new_State = run_for_metrics(successPath);
    metricstime = toc(metricsstart);
    save('run_formetric_time.mat','metricstime');
    clear metricstime
    %加上成功文件个数的特征
    succstate = (success_fileNum/dqncfg.NUM_TESTS)*ones(success_fileNum,1);      %列向量n*1
    new_State = cat(2,new_State,succstate);
    new_State          %可清除 clear new_State1
    
    cd(oldpath)
    cd
        %转换模型为mdl格式,计算局部特征

    slxtomdl(successfile)
    blockfeature = getBlockandLine_feature(successPath);
    disp('---------------------------------------BlockFeature-----------------------------')
    blockfeature
    new_State = [new_State blockfeature];      %100*8,100*109=100*117


    %% 计算奖励
    % 空间几何中心
    %oldstate n*117;
    %归一化处理
    new_State = mapminmax(new_State);

    
    % 补充维度。补零
    if success_fileNum<dqncfg.NUM_TESTS
        neededState = dqncfg.NUM_TESTS-success_fileNum;
        new_State = cat(1,new_State,zeros(neededState,dqncfg.stateLen));
    end
    new_State     

    Feature  = new_State;
    totalFeature = cat(1,totalFeature,mean(Feature));
    save(fullfile(successPath,'Rewardreport.mat'),'totalFeature','Action','Feature','newParam')
    save(dqncfg.CACHDATA_FILE,'totalFeature')
    clear totalFeature
    
    
    
    statesize = size(oldstate);
    if ~statesize(2) == dqncfg.stateLen
        old = oldstate';
    else
        old = oldstate;
    end
    
    if statesize(1)>1
        oldCenter = mean(old);
    else
        oldCenter = old;
    end
    if size(new_State,1)<=1
        newCenter = new_State;
    else
        newCenter = mean(new_State);
    end

    
      %即时奖励
    reward = -manhantondis(oldCenter,newCenter);
    
    if success_fileNum <=dqncfg.MINSUCC_NUM
        restart = true;
    else
        restart = false;
    end
    save(fullfile(successPath,'Rewardreport.mat'),'totalState','reward','Action','oldstate','new_State','-append')
    save(dqncfg.CACHDATA_FILE,'totalState')
    clear totalState
    clear Feature
    
    %%  清除变量
    vars = {'newParam','cfg_newParam','cfg_new','reportsneofile','successfile'};
    clear(vars{:})
    rmdir(fullfile(successPath,'slprj'),'s')
    %{
    total = zeros(1,150);
    disp(newCenter)
    for i=1:length(newCenter)
        R1=newCenter(i);
        R2 = oldCenter(i);
        total(i)=abs(R1-R2);
        disp(['R1:' num2str(R1) '     ' 'R2:' num2str(R2) '    ' 'total(' num2str(i) ')' num2str(total(i))])
    end
    diver = sum(total);
    disp(diver);

    reward = diver;   %即使奖励
    %}
end


