function new_State = caculate_model_Metrics()
%% 获取生成模型并计算特征
    reportsneofile = dir('..\reportsneo\');
    disp(reportsneofile);
    folder = reportsneofile(end).name;     %最新生成的文件夹2021-11-...
    successfile = dir(fullfile('..','reportsneo',folder,'success','*.slx'));
    success_fileNum = length(successfile);
    %死代码特征获取
    deadfeature1 = zombie_extraction(successfile);      %1*n
    deadsize = size(deadfeature1);
    % 成功的模型个数
    disp(success_fileNum)
    successPath = successfile.folder;
   
    disp(successPath)
    copyfile("get_matlab_metrics.m",successPath);
    copyfile("run_for_metrics.m",successPath);
    oldpath =  cd(successPath);
    cd
    new_State1 = run_for_metrics(successPath);
    new_State3 = cat(2,new_State1,deadfeature1'); 
    
    disp(new_State3);
    cd(oldpath)
    cd
     %转换模型为mdl格式
    slxtomdl(successfile)
    blockfeature = getBlockandLine_feature(successPath);
    disp('---------------------------------------BlockFeature-----------------------------')
    blockfeature
    new_State = [new_State3 blockfeature];      %100*23,100*127=100*150
    new_State
end
    