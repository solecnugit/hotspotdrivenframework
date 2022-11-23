/* ******************************************************************************
 * Copyright (c) 2011-2018 Google, Inc.  All rights reserved.
 * Copyright (c) 2010 Massachusetts Institute of Technology  All rights reserved.
 * ******************************************************************************/
/*
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice,
 *   this list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * * Neither the name of VMware, Inc. nor the names of its contributors may be
 *   used to endorse or promote products derived from this software without
 *   specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL VMWARE, INC. OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 */
#include <iostream>
#include <fstream>
#include "dr_api.h"
#include "drsyms.h"
#include "droption.h"
#include "get_symbol.h"
#if defined(X86_64)
#include "instr_breakdown_x86.h"
#elif defined(AARCH64)
#include "instr_breakdown_aarch64.h"
#endif

using namespace std;
static uint64 simd_count = 0;
uint64 start_address,end_address;
static droption_t<std::string> app_name(DROPTION_SCOPE_CLIENT, "app",
                                             "ls",
                                             "Name of function to instrument and record",
                                             "");
static droption_t<std::string>
    logical_address(DROPTION_SCOPE_CLIENT, "logical_address", "2b:12bcc",
                    "Name of function to instrument and record", "");
static droption_t<std::string> output_path(DROPTION_SCOPE_CLIENT, "output",
                                             "./",
                                             "Name of function to instrument and record",
                                             "");
#define category_number 15
#if defined(X86_64)
const char* mychars[category_number]={"INDIRECT_CALL","INDIRECT_JMP","INDIRECT_RET","STACK","DATAXFER","BINARY","LOGICAL","SHIFT","CONDITIONAL_BRANCH","UNCONDITIONAL_DIRECT_BRANCH","REST_INSTR","INDIRCT_BRANCH","BRANCH_INSTR","OPERATION_INSTR","TOTAL_INSTR"};
#elif defined(AARCH64)
const char* mychars[category_number]={"INDIRECT_CALL","INDIRECT_JMP","INDIRECT_RET","LOAD_STORE","DATAXFER","BINARY","LOGICAL","SHIFT","CONDITIONAL_BRANCH","UNCONDITIONAL_DIRECT_BRANCH","REST_INSTR","INDIRCT_BRANCH","BRANCH_INSTR","OPERATION_INSTR","TOTAL_INSTR"};
#endif

uint64 instr_kind_array[category_number]={0};
void instr_kind_count(int kind,int is_simd){
    instr_kind_array[kind]+=1;
    simd_count+=is_simd;
}
static dr_emit_flags_t
event_app_instruction(void *drcontext, void *tag, instrlist_t *bb, bool for_trace,
                      bool translating)
{
    instr_t *instr;
    for (instr = instrlist_first(bb); instr != NULL; instr = instr_get_next(instr)) {
        if (!instr_is_app(instr))
            return DR_EMIT_DEFAULT;
        app_pc addr = instr_get_app_pc(instr);
        if (logical_address_is_in_range(addr, start_address,end_address)) {
            int kind =instr_category(instr);
            int is_simd=myinstr_is_simd(instr) ? 1:0;
            dr_insert_clean_call(drcontext, bb, instr, (void *)instr_kind_count, false, 2,
                         OPND_CREATE_INT32(kind),OPND_CREATE_INT32(is_simd));
        }
    }
    return DR_EMIT_DEFAULT;
}

static void
event_exit(void)
{
    std::ofstream MyFile;
    char filename[512];
    sprintf(filename, "%s/%s_%s%s",output_path.get_value().c_str(),app_name.get_value().c_str(),logical_address.get_value().c_str(), ".csv");
    get_instr_array_value(instr_kind_array);
    MyFile.open(filename);
    MyFile << std::setprecision(4)<< "Category,InstructionNumber,InstructionRatio" << std::endl;
    for (int i = 0; i < category_number; i++)
    {
        MyFile<<mychars[i] <<","<<instr_kind_array[i]<<","<<(float)instr_kind_array[i]/(float)instr_kind_array[TOTAL_INSTR]<<endl;
    }
    MyFile.close();
    sprintf(filename, "%s/%s_%s%s",output_path.get_value().c_str(),app_name.get_value().c_str(),logical_address.get_value().c_str(), "_simd.csv");
    MyFile.open(filename);
    MyFile << std::setprecision(4)<< "SimdNumber,SimdRatio" << std::endl;
    MyFile<<simd_count<<","<<simd_count/(float)instr_kind_array[TOTAL_INSTR]<<endl;
    MyFile.close();
}

DR_EXPORT void
dr_client_main(client_id_t id, int argc, const char *argv[])
{
    if (!droption_parser_t::parse_argv(DROPTION_SCOPE_CLIENT, argc, argv, NULL, NULL))
        DR_ASSERT(false);

    string string_range = logical_address.get_value();
    string delimiter1 = ":";
    if (string_range.find(delimiter1) > string_range.length()) {
        DR_ASSERT(false);
    }
    string sub1 = string_range.substr(0, string_range.find(delimiter1));
    string sub2 = string_range.substr(string_range.find(delimiter1) + 1, string_range.length());
    start_address = (uint64)strtol(sub1.c_str(), NULL, 16);
    end_address = (uint64)strtol(sub2.c_str(), NULL, 16);
    dr_register_exit_event(event_exit);
    if (drsym_init(0) != DRSYM_SUCCESS) {
        dr_log(NULL, DR_LOG_ALL, 1, "WARNING: unable to initialize symbol translation\n");
    }
    dr_register_bb_event(event_app_instruction);
}