import pandas as pd
import preprocessing
import dataset
import os
from tqdm import tqdm


def build_word_vector(model_path, word_dic_path, block_flag=True, line_flag=False):
    word_dic = pd.read_csv(word_dic_path)
    word_vector = {}
    if os.path.exists(model_path):
        filenames = os.listdir(model_path)
        for filename in filenames:
            if 'mdl' not in filename:
                continue
            filename_i = filename
            filename = model_path + '/' + filename
            block = preprocessing.divide_block(filename)
            line = preprocessing.divide_line(filename)
            model = {}
            for mytype in dataset.SignalAttributes+dataset.Sources+dataset.Sinks+dataset.MathOperations+dataset.PortsandSubsystems:   
                model[mytype] = 0
            for i in word_dic.iloc[:, 0]:
                model[i] = 0
            if block_flag:
                for i in block.keys():
                    if i in model.keys():
                        #model[i] = 1
                        model[i] = block[i]
            # if line_flag:
            #     for j in line.keys():
            #         str_j = "(" + "'" + j[0] + "'" + ", " + "'" + j[1] + "'" + ")"
            #         if str_j in model.keys():
            #             model[str_j] = 1
            word_vector[filename_i] = model
    return word_vector


def build_rv(word_vector_path, metric_path=None):
    word_vector = pd.read_csv(word_vector_path, index_col=0)
    metric = None
    if metric_path is not None:
        metric = pd.read_csv(metric_path, index_col=0)
    rv = build_rv_2(word_vector, metric)
    return rv


def build_rv_2(word_vector, metric=None):
    rv = {}
    row_name = word_vector._stat_axis.values.tolist()
    for i in range(len(word_vector)):
        cnt = 0
        for j in word_vector.loc[row_name[i], :]:
            cnt += j
        rv[row_name[i]] = cnt

    if metric is not None:
        for i in range(len(word_vector)):
            cnt = 0
            for j in metric.loc[row_name[i], :]:
                cnt += j
            rv[row_name[i]] += cnt
    return rv


def build_dis(word_vector_path):
    word_vector = pd.read_csv(word_vector_path)
    tr, block = build_dis_2(word_vector)
    return tr, block


def build_dis_2(word_vector):
    word_vector_len = len(word_vector)
    tr = [[0 for _ in range(word_vector_len)] for _ in range(word_vector_len)]
    block = []
    for i in tqdm(range(len(word_vector))):
        block.append(word_vector.iloc[i, 0])
        for j in range(i + 1, len(word_vector)):
            cnt = 0
            for k in range(1, 1 + len(word_vector.iloc[i, 1:])):
                diff = word_vector.iloc[i, k] - word_vector.iloc[j, k]
                if diff >= 0:
                    cnt += diff
                else:
                    cnt += (-diff)
            tr[i][j] = tr[j][i] = cnt
    return tr, block
