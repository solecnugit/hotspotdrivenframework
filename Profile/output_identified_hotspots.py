import json
import os
import sys, getopt
import pandas as pd
from parse_perf import Obtain_Hotspot
import argparse
import warnings

class Output_Identified_Hotspots():
    def __init__(self):
        self.config_data={}
        self.output_perf_file=""
        self.output_path=""
    #获取命令行传入的参数
    def get_opt(self):
        parser = argparse.ArgumentParser()
        parser.add_argument('-c', '--config_file',
                        required=True, help='JSON config file')
        args = parser.parse_args()
        with open(args.config_file, 'r') as myconfig:
            self.config_data = json.load(myconfig)
        output_file=self.config_data["subfile"]
        self.output_path="./"+self.config_data["paths"]["outpath"] +"/"+output_file
        self.output_perf_file=self.output_path+"/profile-data/"
        if (os.path.exists(self.output_perf_file))==False:
            os.system("mkdir "+self.output_perf_file)
    #将dataframe转换成json
    def to_jsonfile(self,df, orient='index'):
        df_json = df.to_json(orient=orient, force_ascii=False)
        return json.loads(df_json)
    #输出json文件
    def output_json(self, myjson, path):
        with open(path, "w") as write_file:
            json.dump(myjson, write_file, indent=4)
    #为df添加新的一行
    def append_row(self,frame,sym,overhead,runtime,kernel):
        frame = frame.append(pd.DataFrame(data={
            "symbol": sym,
            "overhead(%)": overhead,
            "runtime(sec)": runtime,
            "kernel":kernel
        }))
        return frame
    #根据热点选择算法，从热点列表里面进行初步选取“确定”热点
    def get_identified_hotspot(self,overhead_list):
        identified_hotspot_range = 0
        threshold= int(self.config_data["hotspot_selection_threshold"][:-1])
        if sum(overhead_list)> threshold:
            for i in range(0, len(overhead_list)):
                if sum(overhead_list[0:i]) > threshold:
                    identified_hotspot_range = i
                    break
        else:
            avg_overhead = sum(overhead_list) / 10
            for i in range(len(overhead_list) - 1, -1,-1):
                if overhead_list[i] >= avg_overhead:
                    identified_hotspot_range = i+1
                    break
        return identified_hotspot_range
    #获取补充的热点数据（根据对比另一个参考对象的热点列表）
    def obtain_whole_hotspot(self,modified_identified_hotspots,modified_top10_hotspots,refer_identified_hotspots):
        modified_top10_hotspots = modified_top10_hotspots.set_index("symbol", drop=False)
        for symbol in list(refer_identified_hotspots["symbol"]):
            if symbol in list(modified_top10_hotspots["symbol"]) and symbol not in list(
                    modified_identified_hotspots["symbol"]):
                sym = modified_top10_hotspots.loc[symbol]["symbol"]
                overhead = modified_top10_hotspots.loc[symbol]["overhead(%)"]
                runtime = modified_top10_hotspots.loc[symbol]["runtime(sec)"]
                kernel = modified_top10_hotspots.loc[symbol]["kernel"]
                modified_identified_hotspots =self.append_row(modified_identified_hotspots,sym,overhead,runtime,kernel)
        return modified_identified_hotspots
    #初步获取热点数据
    def get_hotspot_object(self,app_name):
        record_path=self.output_perf_file+app_name+".perf.report.csv"
        stat_path=self.output_perf_file+app_name+".perf.stat.out"
        return Obtain_Hotspot(record_path,stat_path)
    def main(self):
        warnings.filterwarnings("ignore")
        self.get_opt()
        app1_top10=self.get_hotspot_object(self.config_data["application"]["application1"]).main()
        app2_top10=self.get_hotspot_object(self.config_data["application"]["application2"]).main()
        init_app1_identified =app1_top10[:self.get_identified_hotspot(list(app1_top10["overhead(%)"]))]
        init_app2_identified =app2_top10[:self.get_identified_hotspot(list(app2_top10["overhead(%)"]))]
        identified_hotspots_binary_1=self.obtain_whole_hotspot(init_app1_identified,app1_top10,init_app2_identified)
        identified_hotspots_binary_2=self.obtain_whole_hotspot(init_app2_identified,app2_top10,init_app1_identified)
        identified_hotspots_binary_1 = identified_hotspots_binary_1.set_index("symbol", drop=True)
        identified_hotspots_binary_2 = identified_hotspots_binary_2.set_index("symbol", drop=True)
        suffix="_identified_hotspots.json"
        app_1_output=self.output_path+"/"+self.config_data["application"]["application1"]+suffix
        app_2_output=self.output_path+"/"+self.config_data["application"]["application2"]+suffix
        self.output_json(self.to_jsonfile(identified_hotspots_binary_1),app_1_output)
        self.output_json(self.to_jsonfile(identified_hotspots_binary_2),app_2_output)
if __name__=='__main__':
    demo=Output_Identified_Hotspots()
    demo.main()