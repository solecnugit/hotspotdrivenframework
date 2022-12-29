# coding=utf-8
"""
Dhrystone tuner instance
Copyright (C) 2017-2020, Huawei Technologies Co., Ltd. All rights reserved.
"""
import re

from opentuner import Result
from opentuner.search.objective import MaximizeRate
from autotuner.tuners.tunerbase import CustomTunerBase


class Tuner(CustomTunerBase):

    # The run method runs opentuner under the given configuration
    # and returns the calculated performance under this configuration
    def run(self, desired_result, desired_input, limit):
        """
         Compile and run a given configuration then
         return performance
         """
        rate = -1

        # create a command for running a executable
        run_result = self.call_program(self.run_cmd,
                                       cwd=self.run_dir, limit=120)

        # check if the source program is compiled and run successful
        if run_result['returncode'] == 0:
            std = run_result['stdout']
            rate_line = std.strip().splitlines()[-1]
            match = re.search(r"Dhrystones per Second:\s*(\d+)", rate_line)
            rate = int(match.groups()[0])

        else:
            self._print_errors(self.run_cmd, run_result)

        return Result(rate=rate, time=run_result['time'])

    def objective(self):
        """
        Override the default object MinimizeTime
        """
        return MaximizeRate()
