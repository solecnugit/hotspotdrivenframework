import json
import os
import sys, getopt
import argparse

class Instrument():
    ''' instrument the instructions inside the range of logical address '''

    def __init__(self):
        self.config_data={}
        self.output_path=""
        self.dynamorio_output=""
        
    ''' gets options in the command line, and create the  output folder.'''
    def get_opt(self):
        parser = argparse.ArgumentParser()
        parser.add_argument('-c', '--config_file',
                        required=True, help='JSON config file')
        args = parser.parse_args()
        with open(args.config_file, 'r') as myconfig:
            self.config_data = json.load(myconfig)
        output_file=self.config_data["subfile"]
        self.output_path="./"+self.config_data["paths"]["outpath"] +"/"+output_file

    '''create the subfolder for instrumentation data.'''
    def mkdir_output(self):
        self.dynamorio_output=self.output_path+"/instrument-data"
        if (os.path.exists(self.dynamorio_output))==False:
            os.system("mkdir "+self.dynamorio_output)
   
    '''load the list of identified hotspots'''
    def load_hotspot_list(self,app):
        app_output=self.output_path+"/"+app+"_identified_hotspots.json"
        f = open(app_output)
        data = json.load(f)
        f.close()
        return [i for i in data]
                                
    '''the startup engine of multi-hotspots instrumentation'''
    def run_app(self,app,run_file):
        drpath=self.config_data["paths"]["dynamoriopath"]
        drlibpath=self.config_data["paths"]["dynamoriolibpath"] + "/build/bin/libfunction_instrument.so"
        hotspot_lists=self.load_hotspot_list(app)
        for hotspot in hotspot_lists:
            screen_label=app+"_"+hotspot
            dynamorio_cmd=drpath +"/bin64/drrun -max_bb_instrs 8 -c  " + drlibpath + " -output " +self.dynamorio_output + " -app "+app + " -function "+ hotspot + " -- "+ run_file
            cmd = "screen -dmS " + screen_label + " bash -c " +'"'+ dynamorio_cmd +'"'
            os.system(cmd)
    
    '''start up the program'''
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