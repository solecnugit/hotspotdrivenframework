# coding=utf-8
"""
Coremark tuner instance
Copyright (C) 2017-2020, Huawei Technologies Co., Ltd. All rights reserved.
"""
import os

from opentuner import Result
from opentuner.search.objective import MinimizeCycle
from autotuner.tuners.tunerbase import CustomTunerBase
from autotuner.utils import create_secure_fd


class Tuner(CustomTunerBase):

    # The run method runs opentuner under the given configuration
    # and returns the calculated performance under this configuration
    def run(self, desired_result, desired_input, limit):
        """
         Compile and run a given configuration then
         return performance
         """
        cycles = float('inf')

        # create a command for running a executable
        run_result = self.call_program(self.run_cmd,
                                       cwd=self.run_dir, limit=120)

        # check if the source program is compiled and run successful
        if run_result['returncode'] == 0:
            std = run_result['stdout']
            if "Correct operation validated." in std:
                cycles_line = std.strip().splitlines()[2]

                cycles = int(cycles_line.replace('Total ticks      :', ''))
            else:
                if not os.path.isdir('errors_log'):
                    os.mkdir('errors_log')

                fd = create_secure_fd("errors_log/errors_" +
                          str(desired_result.configuration.id) + ".log")
                with os.fdopen(fd, 'w') as error_log_file:
                    error_log_file.write(std)
                print('coremark errors detected')
        else:
            self._print_errors(self.run_cmd, run_result)

        return Result(cycle=cycles, time=run_result['time'])

    def objective(self):
        """
        Override the default object MinimizeTime
        """
        return MinimizeCycle()
