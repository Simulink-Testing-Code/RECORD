import preprocessing
import modeling
import time
import pandas as pd
import os


def generate_dictionary_table(folder_path=None, word_dic_path=None, sigmoid=1):
    if folder_path is None or word_dic_path is None:
        print("Error: path isn't exist")
        return -1
    print("building dictionary...")
    start = time.time()
    block = preprocessing.make_feature_dictionary(folder_path, sigmoid)
    word_dic = pd.DataFrame.from_dict(block, orient='index', columns=['times'])
    word_dic.to_csv(word_dic_path)
    end = time.time()
    print("building dictionary:done")
    return end - start


def generate_word_vector_table(folder_path=None, word_dic_path=None, word_vector_path=None,
                               metric_path=None, block_flag=True, line_flag=True, metric_flag=True):
    if folder_path is None or word_dic_path is None or word_vector_path is None or metric_path is None:
        print("Error: path isn't exist")
        return -1
    print('building word vector...')
    start = time.time()
    word_vector = modeling.build_word_vector(folder_path, word_dic_path, block_flag=block_flag,line_flag=line_flag)
    word_vector = pd.DataFrame.from_dict(word_vector)
    word_vector = word_vector.T
    word_vector.to_csv(word_vector_path)
    end = time.time()
    print('building word vector:done')
    return end - start

def getfeature(folder_path=None, word_dic_path=None, word_vector_path=None,metric_path=None, block_flag=True, line_flag=True, metric_flag=True):
    generate_dictionary_table(folder_path, word_dic_path)
    generate_word_vector_table(folder_path, word_dic_path, word_vector_path, metric_path,block_flag=True, line_flag=True, metric_flag=True)
    #generate_dictionary_table('.\model', '.\data\word_dic.csv')
    #generate_word_vector_table('.\model', '.\data\word_dic.csv', '.\data\word_vector.csv', metric_path='.\data\word_vector.csv',block_flag=True, line_flag=True, metric_flag=True)
    


