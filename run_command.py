import os
import json
import datetime
import argparse
class Run():
    #获取传入的json文件，并且初始化json内部的数据
    def __init__(self):
        parser = argparse.ArgumentParser()
        parser.add_argument('-c', '--config_file',
                        required=True, help='JSON config file')
        args = parser.parse_args()
        self.myjson=args.config_file
        with open(self.myjson, 'r') as myconfig:
            self.config_data = json.load(myconfig)
        root_directory = os.path.dirname(os.path.abspath(__file__))
        output_file=self.config_data["subfile"]
        self.output_path=root_directory+"/"+self.config_data["paths"]["outpath"] +"/"+output_file
    #创建输出文件夹
    def mkdir_outputs(self):
        if (os.path.exists(self.output_path))==False:
            os.system("mkdir "+self.output_path)
            print("Output path:"+self.output_path)
    #运行perf命令
    def run_perf(self,print_it):
        print("Getting performance data ......")
        run_perf_command="python3 ./Profile/run_benchmarks.py -c "+ self.myjson 
        if print_it:
            print("Run command: "+run_perf_command)
        os.system(run_perf_command)
    #获取“确定”的热点列表
    def identified_hotspot(self,print_it):
        print("Identifying hotspots ......")
        output_hotspot_command="python3 ./Profile/output_identified_hotspots.py  -c "+ self.myjson 
        if print_it:
            print("Run command: "+output_hotspot_command)
        os.system(output_hotspot_command)
    #基于函数名的热点插桩
    def instrument_hotspot(self,print_it):
        print("Instrumenting multiple hotspots ......")
        instrument_command="python3 ./Instrumentation/instrument_multi_hotspot.py  -c "+ self.myjson 
        if print_it: 
            print("Run command: "+instrument_command)
        os.system(instrument_command)
    #基于逻辑地址区间的插桩
    def instrument_logical_address(self,print_it):
            print("Instrumenting logical address......")
            instrument_command="python3 ./Instrumentation/instrument_logical_address.py  -c "+ self.myjson
            if print_it==True:
                print("Run command: "+instrument_command)
            os.system(instrument_command)
    def main(self,print_command):
        self.mkdir_outputs()
        if self.config_data["runmode"]["function_name"]=="true":
            self.run_perf(print_command)
            self.identified_hotspot(print_command)
            self.instrument_hotspot(print_command)
        if self.config_data["runmode"]["logical_address"]=="true":
            self.instrument_logical_address(print_command)
if __name__=="__main__":
    demo=Run()
    demo.main(print_command=True)