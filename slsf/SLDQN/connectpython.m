clear
clc
% pe = pyenv('Version','D:\chengapp\Anaconda3\envs\chenghongyi\python.exe');
pe = pyenv('Version',dqncfg.PYTHON_PATH);
if pe.Status == "NotLoaded"
    [~,exepath] = system("where python");
    pe = pyenv('Version',dqncfg.PYTHON_PATH);
end 


%pycal = py.getfeature('.\model', '.\data\word_dic.csv', '.\data\word_vector.csv',metric_path='.\data\word_vector.csv');