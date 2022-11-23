import os
import json
import datetime
import argparse
class Run():
    #读取传入的参数
    def __init__(self):
        parser = argparse.ArgumentParser()
        parser.add_argument('-c', '--config_file',
                        required=True, help='JSON config file')
        args = parser.parse_args()
        self.myjson=args.config_file
    #将之前获取到的profile/instrument数据进行总结并输出
    def report(self,print_it):
        print("Printing results......")
        report_command="python3 ./Instrumentation/output_result.py -c  "+ self.myjson 
        if print_it:
            print("Run command: "+report_command)
        os.system(report_command)
    def main(self):
        self.report(True)
if __name__=="__main__":
    demo=Run()
    demo.main()
