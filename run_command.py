import os
import json
import argparse
import subprocess
import time
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
    def load_hotspot_list(self,app_name):
        app_output=self.output_path+"/"+app_name+"_identified_hotspots.json"
        f = open(app_output)
        data = json.load(f)
        f.close()
        return [i for i in data]
    def obtain_screen_label_list(self):
        screen_label_list=[]
        for app in ["application1","application2"]:
            app_name=self.config_data["application"][app]
            hotspot_lists=self.load_hotspot_list(app_name)
            for hotspot in hotspot_lists:
                screen_label_list.append(app_name+"_"+hotspot)
        return screen_label_list
    def obtain_screen_proc_dict(self):
        proc_dict=dict()
        screen_label_list=self.obtain_screen_label_list()
        return_code, output = subprocess.getstatusoutput('screen -ls')
        text_list=[text for text in output.split("\n")  if "." in text and "\t" in text]
        for text in text_list:
            number,name=text.split("\t")[1].split(".",2)
            if name in screen_label_list:
                proc_dict[number]=name
        return proc_dict
    def output_instrument_proc(self):
        dicts=self.obtain_screen_proc_dict()
        total_counter=len(dicts)
        counter=0
        second=int(self.config_data["sleep_second"])
        while True:
            pid_list=[i for i in dicts]
            for pid in pid_list:
                process_dir = os.path.join('/proc', pid)
                if os.path.exists(process_dir)==False:
                    counter+=1
                    print(dicts[pid]+" instrumentation tool is finished("+str(counter)+"/"+str(total_counter)+")")
                    dicts.pop(pid)
            if counter==total_counter:
                break
            time.sleep(second)
    def report(self,print_it):
        print("Printing results......")
        report_command="python3 ./Instrumentation/output_result.py -c  "+ self.myjson 
        if print_it:
            print("Run command: "+report_command)
        os.system(report_command)
    def main(self,print_command):
        self.mkdir_outputs()
        if self.config_data["runmode"]["logical_address"]=="true":
            self.instrument_logical_address(print_command)
        if self.config_data["runmode"]["function_name"]=="true":
            self.run_perf(print_command)
            self.identified_hotspot(print_command)
            self.instrument_hotspot(print_command)
            self.output_instrument_proc()
            self.report(print_command)
if __name__=="__main__":
    demo=Run()
    demo.main(print_command=True)