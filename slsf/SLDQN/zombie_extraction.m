function percent_cov_results = zombie_extraction(deadfileDir)
    tic
    percent_cov_results = [];
    deadfile = deadfileDir;
    % 成功的模型个数
    dead_fileNum = length(deadfile);
    disp(dead_fileNum)
    deadPath = deadfile.folder;
    for value=1:dead_fileNum
        file_name = fullfile(deadfile(value).folder,deadfile(value).name)
        if exist(file_name,'file')
            try
                handle = load_system(file_name);
                blocks = find_system('LookUnderMasks', 'all');
                testObj = cvtest(handle);
                [data, simOut] = cvsim(testObj,"ReturnWorkspaceOutputs", "on",'TimeOut',11);
                tout = simOut.tout(end);
                num_zero_cov = [];
                all_percent_cov = [];
                for i=1:numel(blocks)
                    cur_blk = blocks(i);
                    cov = executioninfo(data, cur_blk);
                    if ~ isempty(cov)
                        percent_cov = 100 * cov(1) / cov(2);
                    else
                        percent_cov = [];
                    end
                    all_percent_cov = [all_percent_cov,percent_cov];
                end
                zombie_cov = length(find(all_percent_cov==0))/length(all_percent_cov)
                percent_cov_results = [percent_cov_results,zombie_cov]
            catch
                percent_cov_results = [percent_cov_results,0]
            end
        end
        close_system
    end
    toc

end








