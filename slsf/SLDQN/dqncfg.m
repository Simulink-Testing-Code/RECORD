classdef dqncfg
    properties(Constant = true)
        stateLen = 117;        %模型信息的个数
        NUM_TESTS = 100;      %需要和cfg中的变量保持一致
        MINSUCC_NUM = 15;   %最少成功三十个 ,必须小于或等于生成模型总数
        LOCAL_FEATURE = 109;  %总共为113个，有多个重复。
        MAX_ITERATER = 5;
        MAX_EPISODE = 2;
        CACHDATA_DIR = 'cachdata';   %保存totalState和totalfeature
        CACHDATA_BASE = 'cachdata';
        CACHDATA_FILE = ['cachdata' filesep 'totalstate']
        CACHDATAFEATURE_FILE = ['cachdata' filesep 'totalfeature']
        NETREPORT_DIR = 'NetReport'
        PYTHON_PATH = 'D:\chengapp\Anaconda3\envs\chenghongyi\python.exe';
    end


end