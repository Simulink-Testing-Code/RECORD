classdef dqncfg
    properties(Constant = true)
        stateLen = 117;        %ģ����Ϣ�ĸ���
        NUM_TESTS = 100;      %��Ҫ��cfg�еı�������һ��
        MINSUCC_NUM = 15;   %���ٳɹ���ʮ�� ,����С�ڻ��������ģ������
        LOCAL_FEATURE = 109;  %�ܹ�Ϊ113�����ж���ظ���
        MAX_ITERATER = 5;
        MAX_EPISODE = 2;
        CACHDATA_DIR = 'cachdata';   %����totalState��totalfeature
        CACHDATA_BASE = 'cachdata';
        CACHDATA_FILE = ['cachdata' filesep 'totalstate']
        CACHDATAFEATURE_FILE = ['cachdata' filesep 'totalfeature']
        NETREPORT_DIR = 'NetReport'
        PYTHON_PATH = 'D:\chengapp\Anaconda3\envs\chenghongyi\python.exe';
    end


end