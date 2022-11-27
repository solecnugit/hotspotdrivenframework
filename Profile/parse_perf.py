import csv
import os
import numpy as np
import pandas as pd
class Obtain_Hotspot():
    def __init__(self,record_path,runtime_path):
        self.record_path=record_path
        self.runtime_path=runtime_path
        self.identified_hotspots=pd.DataFrame(data={"symbol": [],"overhead(%)": [],"kernel":[]})
        self.top10_hotspots = pd.DataFrame(data={"symbol": [],"overhead(%)": [],"kernel":[]})
    #从输入文本中获取到正式热点数据的起始行
    def get_hotspot_line_from_text(self,rows):
         index_location = 0
         for i in range(0, len(rows)):
            if rows[i][0] == '# Overhead':
                index_location = i
                break
         return index_location
    #从文本中获取热点信息
    def get_hotspot_list(self,index_location,rows):
        overhead_list = []
        symbol_list = []
        kernel_list = []
        for i in range(index_location + 1, index_location + 11):
            if rows[i] == []:
                break
            overhead = float(rows[i][0].replace(" ", "")[:-1])
            symbol = rows[i][1].replace(" ", "")
            if symbol.find("[k]")!=-1:
                kernel_list.append("true")
            else:
                kernel_list.append("false")
            symbol = symbol[symbol.rfind("]") + 1:]
            overhead_list.append(overhead)
            symbol_list.append(symbol)
        self.top10_hotspots["overhead(%)"] = overhead_list
        self.top10_hotspots["symbol"] = symbol_list
        self.top10_hotspots["kernel"] = kernel_list
    #获取绝对运行时间
    def obtain_absolute_runtime(self):
        file=open(self.runtime_path)
        runtime=float(file.read())
        return runtime
    #返回热点列表
    def main(self):
        with open(self.record_path, 'r', encoding="utf-8") as csvfile:
            reader = csv.reader(csvfile)
            rows = [row for row in reader]
        index_location=self.get_hotspot_line_from_text(rows)
        self.get_hotspot_list(index_location,rows)
        runtime=self.obtain_absolute_runtime()
        runtime_list=runtime*np.array(self.top10_hotspots["overhead(%)"])*0.01
        self.top10_hotspots["runtime(sec)"]= runtime_list
        return self.top10_hotspots
        #self.identified_hotspots = self.top10_hotspots[:identified_hotspot_range]
        #print(self.top10_hotspots)
        #print(self.identified_hotspots)

