import csv
import os
import numpy as np
import pandas as pd
class Obtain_Hotspot():
    '''parse the data getting from linux perf'''
    
    def __init__(self,record_path,runtime_path):
        self.record_path=record_path
        self.runtime_path=runtime_path
        self.identified_hotspots=pd.DataFrame(data={"symbol": [],"overhead(%)": [],"kernel":[]})
        self.top10_hotspots = pd.DataFrame(data={"symbol": [],"overhead(%)": [],"kernel":[]})
        
    '''get the starting position of hotspot data'''
    def get_hotspot_line_from_text(self,rows):
         index_location = 0
         for i in range(0, len(rows)):
            if rows[i][0] == '# Overhead':
                index_location = i
                break
         return index_location

    '''get the hotspot data from text file'''
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

    '''get the absolute runtime'''
    def obtain_absolute_runtime(self):
        file=open(self.runtime_path)
        runtime=float(file.read())
        return runtime
    
    '''return the hotspot list'''
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

