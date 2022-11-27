import os
import sys, getopt
import json
import argparse
class Run_Perf():
    def __init__(self):
        self.config_data={}
        self.output_perf_file=""
    #获取命令行选项并且创建输出文件夹
    def get_opt(self):
        parser = argparse.ArgumentParser()
        parser.add_argument('-c', '--config_file',
                        required=True, help='JSON config file')
        args = parser.parse_args()
        with open(args.config_file, 'r') as myconfig:
            self.config_data = json.load(myconfig)
        output_file=self.config_data["subfile"]
        output_path="./"+self.config_data["paths"]["outpath"] +"/"+output_file
        self.output_perf_file=output_path+"/profile-data/"
        self.output_disassemble_file=output_path+"/disassemble-data/"
        if (os.path.exists(self.output_perf_file))==False:
            os.system("mkdir "+self.output_perf_file)
        if (os.path.exists(self.output_disassemble_file))==False:
            os.system("mkdir "+self.output_disassemble_file)
    #运行具体perf命令
    def perf_command(self,app_name,app_cmd):
        stat_cmd= "perf stat -o "+self.output_perf_file+app_name  +".perf.stat.out "+ app_cmd
        os.system(stat_cmd)
        run_record="perf record  " + app_cmd 
        os.system(run_record)
        record_cmd= "perf report -F overhead,symbol --field-separator=,>"+self.output_perf_file+app_name+".perf.report.csv"
        os.system(record_cmd)
    #运行objdump命令
    def objdump_command(self,app_name,app_cmd):
        objdump_cmd= "objdump -S "+app_cmd+">"+self.output_disassemble_file+app_name+".s"
        os.system(objdump_cmd)
    def run(self):
        run_file1="./"+self.config_data["paths"]["benchpath"]+"/"+self.config_data["application"]["application1"]+" "+self.config_data["application"]["run_command1"]
        run_file2="./"+self.config_data["paths"]["benchpath"]+"/"+self.config_data["application"]["application2"]+" "+self.config_data["application"]["run_command2"]
        self.perf_command(self.config_data["application"]["application1"],run_file1)
        self.perf_command(self.config_data["application"]["application2"],run_file2)
        os.system("rm perf.data*")
        self.objdump_command(self.config_data["application"]["application1"],run_file1)
        self.objdump_command(self.config_data["application"]["application2"],run_file2)
        
    def main(self):
        self.get_opt()
        self.run()
if __name__=="__main__":
    demo=Run_Perf()
    demo.main()
