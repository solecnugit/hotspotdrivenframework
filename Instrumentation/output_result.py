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
    def search_public_hotspots(self,hotspots1,hotspots2):
        public_list=[]
        for i in hotspots1:
            if i in hotspots2:
                public_list.append(i)
        return public_list
    def obtain_identified_hotspots(self,app_name):
        with open(self.return_json_name(app_name), 'r') as json_file:
            jsons = json.load(json_file)
        df = pd.DataFrame.from_dict(jsons, orient="index")
        df.columns=[app_name+",overhead(%)",app_name+",kernel",app_name+",runtime(sec)"]
        return df
    def return_json_name(self,app_name):
        return self.output_path+"/"+app_name+"_identified_hotspots.json"
    def obtain_instruction_characterization(self,instrument_csv_file):
        if "_simd.csv" not in instrument_csv_file:
            df=pd.read_csv(instrument_csv_file,index_col="Category")
        else:
            df=pd.read_csv(instrument_csv_file,index_col=False)
        return df
    def load_hotspot_list(self,app_name):
        app_output=self.output_path+"/"+app_name+"_identified_hotspots.json"
        f = open(app_output)
        data = json.load(f)
        f.close()
        return [i for i in data]
    def generate_hotspots_lists(self,data):
        df1=self.obtain_identified_hotspots(self.config_data["application"]["application1"])
        df2=self.obtain_identified_hotspots(self.config_data["application"]["application2"])
        public=self.search_public_hotspots(list(df1.index),list(df2.index))
        result = pd.concat([df1, df2], axis=1)
        print(result,file=data)
        return public
    def generate_instructions_characterization_single_app(self,public_list,data):
        instrument_path=self.output_path+"/instrument-data/"
        for app in ["application1","application2"]:
            app_name=self.config_data["application"][app]
            all_hotspots=self.load_hotspot_list(app_name)
            hotspot_list=[i for i in all_hotspots if i not in public_list]
            if len(hotspot_list)!=0:
                print(app_name,file=data)
                for hotspot in hotspot_list:
                    print(app_name+" "+hotspot,file=data)
                    file_path=instrument_path+app_name+"_"+hotspot+".csv"
                    file_simd_path=instrument_path+app_name+"_"+hotspot+"_simd.csv"
                    print(self.obtain_instruction_characterization(file_path),file=data)
                    print("\n",file=data)
    def generate_instructions_characterization_both_apps(self,public_list,data):
        instrument_path=self.output_path+"/instrument-data/"
        app1=self.config_data["application"]["application1"]
        app2=self.config_data["application"]["application2"]
        apps=app1+","+app2
        print(apps,file=data)
        for hotspot in public_list:
            print(apps+" "+hotspot,file=data)
            df1=self.obtain_instruction_characterization(instrument_path+self.config_data["application"]["application1"]+"_"+hotspot+".csv")
            df1.columns=[app1+",number",app1+",ratio"]
            df2=self.obtain_instruction_characterization(instrument_path+self.config_data["application"]["application2"]+"_"+hotspot+".csv")
            df2.columns=[app2+",number",app2+",ratio"]
            print(pd.concat([df1, df2], axis=1),file=data)
            print("\n",file=data)
    def output_file(self,data):
        print("Runtime",file=data)
        print("="*100,file=data)
        print(self.return_runtime(self.config_data["application"]["application1"]),file=data)
        print(self.return_runtime(self.config_data["application"]["application2"]),file=data)
        print("\nHotspots List",file=data)
        print("="*100,file=data)
        public_list=self.generate_hotspots_lists(data)
        print("\nInstructions Characterization",file=data)
        print("="*100,file=data)
        self.generate_instructions_characterization_both_apps(public_list,data)
        print("-"*100,file=data)
        self.generate_instructions_characterization_single_app(public_list,data)
    def main(self):
        pd.set_option('display.width', None)
        self.get_opt()
        report_path=self.output_path+"/report.out"
        data = open(report_path, 'w+')
        self.output_file(data)
        data.close()

if __name__=='__main__':
    demo=Output_Identified_Hotspots()
    demo.main()
