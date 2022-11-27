import json
import os
import sys, getopt
import pandas as pd
import argparse
class Output_Identified_Hotspots():
    def __init__(self):
        self.config_data={}
        self.output_path=""
    def get_opt(self):
        parser = argparse.ArgumentParser()
        parser.add_argument('-c', '--config_file',
                        required=True, help='JSON config file')
        args = parser.parse_args()
        with open(args.config_file, 'r') as myconfig:
            self.config_data = json.load(myconfig)
        output_file=self.config_data["subfile"]
        self.output_path="./"+self.config_data["paths"]["outpath"] +"/"+output_file
    def obtain_absolute_runtime(self,runtime_path):
        file=open(runtime_path)
        return file.read()
    def return_runtime(self,app_name):
        return app_name+": "+self.obtain_absolute_runtime(self.output_path+"/profile-data/"+app_name+".runtime.out")
    def obtain_identified_hotspots(self,json_path):
        with open(json_path, 'r') as json_file:
            jsons = json.load(json_file)
        df = pd.DataFrame.from_dict(jsons, orient="index")
        return df
    def return_json_name(self,app_name):
        return self.output_path+"/"+app_name+"_identified_hotspots.json"
    def obtain_instruction_characterization(self,instrument_csv_file):
        os.system("sync")
        if "_simd.csv" not in instrument_csv_file:
            df=pd.read_csv(instrument_csv_file,index_col="Category")
        else:
            df=pd.read_csv(instrument_csv_file,index_col=0)
        return df 
    def load_hotspot_list(self,app_name):
        app_output=self.output_path+"/"+app_name+"_identified_hotspots.json"
        f = open(app_output)
        data = json.load(f)
        f.close()
        return [i for i in data]
    def generate_hotspots_lists(self,app_name,data):
        print(app_name,file=data)
        print(self.obtain_identified_hotspots(self.return_json_name(app_name)),file=data)
    def generate_instructions_characterization(self,app_name,data):
        instrument_path=self.output_path+"/instrument-data/"
        hotspot_list=self.load_hotspot_list(app_name)
        print(app_name,file=data)
        for hotspot in hotspot_list:
            print(app_name+" "+hotspot,file=data)
            file_path=instrument_path+app_name+"_"+hotspot+".csv"
            file_simd_path=instrument_path+app_name+"_"+hotspot+"_simd.csv"
            print(self.obtain_instruction_characterization(file_path),file=data)
            print("\n",file=data)
            print(self.obtain_instruction_characterization(file_simd_path),file=data)
            print("\n",file=data)
    def output_file(self):
        report_path=self.output_path+"/output_report.out"
        #print(report_path)
        data = open(report_path, 'w+')
        #data=None
        print("Runtime",file=data)
        print("="*100,file=data)
        print(self.return_runtime(self.config_data["application"]["application1"]),file=data)
        print(self.return_runtime(self.config_data["application"]["application2"]),file=data)
        print("\nHotspots List",file=data)
        print("="*100,file=data)
        self.generate_hotspots_lists(self.config_data["application"]["application1"],data)
        print("-"*100,file=data)
        self.generate_hotspots_lists(self.config_data["application"]["application2"],data)
        print("\nInstructions Characterization",file=data)
        print("="*100,file=data)
        self.generate_instructions_characterization(self.config_data["application"]["application1"],data)
        print("-"*100,file=data)
        self.generate_instructions_characterization(self.config_data["application"]["application2"],data)
        data.close()
    def main(self):
        self.get_opt()
        self.output_file()
if __name__=='__main__':
    demo=Output_Identified_Hotspots()
    demo.main()
