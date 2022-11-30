import json
import os
import sys, getopt
import argparse

class Instrument():
    def __init__(self):
        self.config_data={}
        self.output_path=""
        self.dynamorio_output=""
    def get_opt(self):
        parser = argparse.ArgumentParser()
        parser.add_argument('-c', '--config_file',
                        required=True, help='JSON config file')
        args = parser.parse_args()
        with open(args.config_file, 'r') as myconfig:
            self.config_data = json.load(myconfig)
        output_file=self.config_data["subfile"]
        self.output_path="./"+self.config_data["paths"]["outpath"] +"/"+output_file
    #创建输出插桩数据的文件夹
    def mkdir_output(self):
        self.dynamorio_output=self.output_path+"/instrument-data"
        if (os.path.exists(self.dynamorio_output))==False:
            os.system("mkdir "+self.dynamorio_output)
    #加载“确定”的热点列表
    def load_hotspot_list(self,app):
        app_output=self.output_path+"/"+app+"_identified_hotspots.json"
        f = open(app_output)
        data = json.load(f)
        f.close()
        return [i for i in data]
    def run_app(self,app,run_file):
        drpath=self.config_data["paths"]["dynamoriopath"]
        drlibpath=self.config_data["paths"]["dynamoriolibpath"] + "/build/bin/libfunction_instrument.so"
        hotspot_lists=self.load_hotspot_list(app)
        for hotspot in hotspot_lists:
            screen_label=app+"_"+hotspot
            dynamorio_cmd=drpath +"/bin64/drrun -c " + drlibpath + " -output " +self.dynamorio_output + " -app "+app + " -function "+ hotspot + " -- "+ run_file
            cmd = "screen -dmS " + screen_label + " bash -c " +'"'+ dynamorio_cmd +'"'
            os.system(cmd)
    def main(self):
        self.get_opt()
        self.mkdir_output()
        run_file1="./"+self.config_data["paths"]["benchpath"]+"/"+self.config_data["application"]["application1"]+" "+self.config_data["application"]["run_command1"]
        run_file2="./"+self.config_data["paths"]["benchpath"]+"/"+self.config_data["application"]["application2"]+" "+self.config_data["application"]["run_command2"]
        self.run_app(self.config_data["application"]["application1"],run_file1 )
        self.run_app(self.config_data["application"]["application2"],run_file2 )
if __name__=='__main__':
    demo=Instrument()
    demo.main()