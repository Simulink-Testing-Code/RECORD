import dataset
import nltk
import os


def divide_block(filename):
    block = {}
    with open(filename, 'r') as f:
        try:
            codes = f.read()
        except UnicodeDecodeError:
            return {}
        lines = nltk.word_tokenize(codes)
        for i in range(len(lines)):
            if lines[i] == 'BlockType':
                try:
                    if lines[i+1] in dataset.PortsandSubsystems or \
                            lines[i+1] in dataset.MathOperations or \
                            lines[i+1] in dataset.LogicandBitOperations or \
                            lines[i+1] in dataset.Sinks or \
                            lines[i+1] in dataset.Sources or \
                            lines[i+1] in dataset.SignalAttributes:
                        if lines[i+1] in block.keys():
                            block[lines[i+1]] += 1
                        else:
                            block[lines[i+1]] = 1
                    
                except IndexError:
                    print(filename)
    return block


def recognition_line(filename):
    block = []
    line = []
    with open(filename, 'r') as f:
        codes = f.read()
        lines = nltk.word_tokenize(codes)
        pairs = 0
        for i in range(len(lines)):
            if lines[i] == '{':
                pairs += 1
            elif lines[i] == '}':
                pairs -= 1
            if pairs < 0:
                break

        if pairs != 0:
            return None, {('NotInPairs', 'NotInPairs'): 1}

        for i in range(len(lines)):

            if lines[i] == 'BlockType':
                block.append((lines[i+1], lines[i+4]))
            if lines[i] == 'Line' and lines[i+1] == "{":
                j = i + 1
                src = []
                dis = []
                flag3 = False
                while j < len(lines):
                    if lines[j] == "Branch":
                        flag3 = True
                    if lines[j] == 'SrcBlock':
                        src.append(lines[j+2])
                    if lines[j] == 'DstBlock':
                        dis.append(lines[j+2])
                    if lines[j] == '}':
                        if not flag3:
                            break
                        flag3 = False
                    j += 1
                line.append((src, dis))
    return block, line


def divide_line(path):
    block, line = recognition_line(path)#block(类型和名称的键值对)，line(来源块和目标块键值对)
    if not block:
        return line  # without useful line
    block_dic = {}
    for i in block:
        block_dic[i[1]] = i[0]
    node_line = []
    for node in line:
        if not node[0]:
            return {}
        node_line_0 = node[0][0]
        for node_line_1 in node[1]:
            if node_line_0 in block_dic.keys() and node_line_1 in block_dic.keys():
                if block_dic[node_line_0] in dataset.PortsandSubsystems or \
                        block_dic[node_line_0] in dataset.MathOperations or \
                        block_dic[node_line_0] in dataset.LogicandBitOperations or \
                        block_dic[node_line_0] in dataset.Sinks or \
                        block_dic[node_line_0] in dataset.Sources or \
                        block_dic[node_line_0] in dataset.SignalAttributes or \
                        block_dic[node_line_1] in dataset.PortsandSubsystems or \
                        block_dic[node_line_1] in dataset.MathOperations or \
                        block_dic[node_line_1] in dataset.LogicandBitOperations or \
                        block_dic[node_line_1] in dataset.Sinks or \
                        block_dic[node_line_1] in dataset.Sources or \
                        block_dic[node_line_1] in dataset.SignalAttributes:
                    node_line.append((block_dic[node_line_0], block_dic[node_line_1]))
            elif node_line_0 in block_dic.keys():
                if block_dic[node_line_0] in dataset.PortsandSubsystems or \
                        block_dic[node_line_0] in dataset.MathOperations or \
                        block_dic[node_line_0] in dataset.LogicandBitOperations or \
                        block_dic[node_line_0] in dataset.Sinks or \
                        block_dic[node_line_0] in dataset.Sources or \
                        block_dic[node_line_0] in dataset.SignalAttributes:
                    node_line.append((block_dic[node_line_0], 'unknown'))
            elif node_line_1 in block_dic.keys():
                if block_dic[node_line_1] in dataset.PortsandSubsystems or \
                        block_dic[node_line_1] in dataset.MathOperations or \
                        block_dic[node_line_1] in dataset.LogicandBitOperations or \
                        block_dic[node_line_1] in dataset.Sinks or \
                        block_dic[node_line_1] in dataset.Sources or \
                        block_dic[node_line_1] in dataset.SignalAttributes:
                    node_line.append(('unknown', block_dic[node_line_1]))
            else:
                node_line.append(('unknown', 'unknown'))
    line_dict = {}
    for i in node_line:
        if i not in line_dict.keys():
            line_dict[i] = 1
        else:
            line_dict[i] += 1
    return line_dict


def make_feature_dictionary(document_path, sigmoid=0):
    path = document_path
    combine = {}
    result = {}
    if os.path.exists(path):
        filenames = os.listdir(path)
        for filename in filenames:
            if 'mdl' not in filename:
                continue
            filename = path + '/' + filename
            block = divide_block(filename)

            for i in block.keys():
                if i in combine.keys():
                    combine[i] += block[i]
                else:
                    combine[i] = block[i]

            # line = divide_line(filename)
            # if not line:
            #     continue

            # for j in line.keys():
            #     if j in combine.keys():
            #         combine[j] += line[j]
            #     else:
            #         combine[j] = line[j]
    else:
        print('文件夹中无文件')
    for i in combine.keys():
        if combine[i] > sigmoid:
            result[i] = combine[i]
    return result
