import json
import os
import sys, getopt
import argparse
class Logical():
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
        self.dynamorio_output=self.output_path+"/instrument-data-logical-address/"
        if (os.path.exists(self.dynamorio_output))==False:
            os.system("mkdir "+self.dynamorio_output)
    def run_app(self,runfile,app):
        app_name=self.config_data["application"][app]
        drpath=self.config_data["paths"]["dynamoriopath"]
        drlibpath=self.config_data["paths"]["dynamoriolibpath"] + "/build/bin/libfunction_instrument_range.so"
        logical_range=str(self.config_data["logical_address"][app]["start"])+":"+str(self.config_data["logical_address"][app]["end"])
        screen_label=app_name+"_"+logical_range
        dynamorio_cmd=drpath +"/bin64/drrun -c " + drlibpath + " -output " +self.dynamorio_output + " -app "+app_name + " -logical_address "+ logical_range + " -- "+ runfile
        cmd = "screen -dmS " + screen_label + " bash -c " +'"'+ dynamorio_cmd +'"'
        os.system(cmd)
    def main(self):
        self.get_opt()
        if self.config_data["logical_address"]["application1"]["instrumentation"]=="true":
            run_file="./"+self.config_data["paths"]["benchpath"]+"/"+self.config_data["application"]["application1"]+" "+self.config_data["application"]["run_command1"]
            self.run_app(run_file,"application1")
        if self.config_data["logical_address"]["application2"]["instrumentation"]=="true":
            run_file="./"+self.config_data["paths"]["benchpath"]+"/"+self.config_data["application"]["application2"]+" "+self.config_data["application"]["run_command2"]
            self.run_app(run_file,"application2")
if __name__=='__main__':
    demo=Logical()
    demo.main()