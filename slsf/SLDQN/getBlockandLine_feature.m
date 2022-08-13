function  blockandline_feature = getBlockandLine_feature(modelfilePath)
    %脚本所在路径，空字符串表示当前目录
    clc
    path = pwd %当前目录
    %path = 'a/' %当前的子目录a
    if count(py.sys.path,path) == 0
        insert(py.sys.path,int32(0),path);
    end
    %清除脚本缓存，执行重载操作
    %clear classes;
    mod = py.importlib.import_module('generate');%载入的脚本模块  
    mod.getfeature(modelfilePath, '.\data\word_dic.csv', '.\data\word_vector.csv', metric_path='.\data\metrics.csv')
    csvfile = '.\data\word_vector.csv';
    blockandline_feature = csvread(csvfile,1,1);
    blsize = size(blockandline_feature);
    
    if blsize(2)<dqncfg.LOCAL_FEATURE
        neededNum = dqncfg.LOCAL_FEATURE-blsize(2);
        blockandline_feature = [blockandline_feature zeros(blsize(1),neededNum)];
    end
    
end
