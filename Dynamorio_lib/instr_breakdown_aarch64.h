#include "dr_api.h"
static bool my_instr_is_mov(instr_t *instr);
static bool my_instr_has_mem_ref(instr_t *instr);
static bool my_instr_is_binary(instr_t *instr);
static bool my_instr_is_logical(instr_t *instr);
static bool my_instr_is_shift_rotate(instr_t *instr);
static bool my_instr_is_store_load(instr_t *instr);
static bool reg_is_sve(reg_id_t reg);
static bool myinstr_is_neon(instr_t *instr);
static bool myinstr_is_sve(instr_t *instr);
static bool myinstr_is_simd(instr_t *instr);
static bool myinstr_is_jmp_indirect(instr_t *instr);
static void get_instr_array_value(uint64 instr_kind_array[]);
int instr_category(instr_t *instr);
enum INSTR_KIND {
    INDIRECT_CALL,
    INDIRECT_JMP,
    INDIRECT_RET,
    LOAD_STORE,
    DATAXFER,
    BINARY,
    LOGICAL,
    SHIFT,
    CONDITIONAL_BRANCH,
    UNCONDITIONAL_DIRECT_BRANCH,
    SIMD_INSTR,
    REST_INSTR,
    INDIRCT_BRANCH,
    BRANCH_INSTR,
    OPERATION_INSTR,
    TOTAL_INSTR
};
static bool 
reg_is_sve(reg_id_t reg)
{
    return (DR_REG_Z0 <= reg && reg <= DR_REG_P15);
}
static bool 
myinstr_is_sve(instr_t *instr)
{
    int opc = instr_get_opcode(instr);
    for (int i = 0; i < instr_num_srcs(instr); i++)
    {
        if (opnd_is_reg(instr_get_src(instr, i)))
        {
            if (reg_is_sve(opnd_get_reg(instr_get_src(instr, i))))
            {
                return true;
            }
        }
    }
    for (int i = 0; i < instr_num_dsts(instr); i++)
    {
        if (opnd_is_reg(instr_get_dst(instr, i)))
        {
            if (reg_is_sve(opnd_get_reg(instr_get_dst(instr, i))))
            {
                return true;
            }
        }
    }
    return false;
}
static bool 
myinstr_is_neon(instr_t *instr)
{
    int opc = instr_get_opcode(instr);
    for (int i = 0; i < instr_num_srcs(instr); i++)
    {
        if (opnd_is_reg(instr_get_src(instr, i)))
        {
            if (reg_is_simd(opnd_get_reg(instr_get_src(instr, i))))
            {
                return true;
            }
        }
    }
    for (int i = 0; i < instr_num_dsts(instr); i++)
    {
        if (opnd_is_reg(instr_get_dst(instr, i)))
        {
            if (reg_is_simd(opnd_get_reg(instr_get_dst(instr, i))))
            {
                return true;
            }
        }
    }
    return false;
}

static bool 
myinstr_is_simd(instr_t *instr){
    return myinstr_is_neon(instr) || myinstr_is_sve(instr);
}


static bool
my_instr_is_mov(instr_t *instr)
{
    int opc = instr_get_opcode(instr);
    return ((opc >= OP_movi && opc <= OP_movz) || (opc == OP_fmov));
}
static bool
my_instr_is_binary(instr_t *instr)
{
    int opc = instr_get_opcode(instr);
    bool oper_add = (opc >= OP_add && opc <= OP_addv);
    bool oper_sub = (opc >= OP_sub && opc <= OP_subs) || (opc == OP_fsub);
    bool oper_mul = (opc == OP_fmul) || (opc == OP_fmulx) || (opc == OP_fnmul) || (opc == OP_mul) || (opc == OP_madd) || 
    (opc == OP_msub) || (opc==OP_umulh) || (opc==OP_umull) || (opc==OP_pmul) || (opc==OP_pmull) || (opc==OP_smulh) || (opc==OP_smull) ||
    (opc==OP_sqdmulh)|| (opc == OP_sqdmull) || (opc==OP_sqrdmulh);
    bool oper_div = (opc == OP_fdiv) || (opc == OP_sdiv) || (opc == OP_udiv);
    
    bool oper_cmp = (opc == OP_ccmn) || (opc == OP_ccmp) || (opc >= OP_fccmp && opc <= OP_fccmpe) || (opc >= OP_fcmp && opc <= OP_fcmpe);
    
    bool oper_arith_carry = (opc == OP_adc) || (opc == OP_adcs) || (opc == OP_sbc) || (opc == OP_sbcs)   ;
    
    bool oper_other= (opc == OP_abs) || (opc == OP_adcs) || (opc == OP_sbc) || (opc == OP_sbcs);
    
    return oper_sub || oper_add || oper_mul || oper_div || oper_cmp || oper_arith_carry || oper_other;
}
static bool
my_instr_is_logical(instr_t *instr)
{
    int opc = instr_get_opcode(instr);
    bool oper_and = (opc == OP_and || opc == OP_ands);
    bool oper_or = (opc == OP_orn) || (opc == OP_orr) || (opc == OP_eor) || (opc == OP_eon) || (opc == OP_mvni);
    bool oper_bic = (opc == OP_bic) || (opc == OP_bics);
    return oper_and || oper_or || oper_bic;
}
static bool
my_instr_is_shift_rotate(instr_t *instr)
{
    int opc = instr_get_opcode(instr);
    return (opc == OP_asrv) || (opc == OP_rorv) || (opc == OP_lslv) || (opc == OP_lsrv) || (opc == OP_ubfm) || (opc == OP_bfm) || (opc == OP_sbfm) ;
}
static bool 
my_instr_is_store_load(instr_t *instr)
{
    int opc = instr_get_opcode(instr);
    return (opc >= OP_st1 && opc <= OP_stxrh) || (opc >= OP_ld1 && opc <= OP_ldxrh);
}
static bool
myinstr_is_jmp_indirect(instr_t *instr)
{
    int opc = instr_get_opcode(instr);
    return (opc == OP_br);
}
static bool
my_instr_has_mem_ref(instr_t *instr)
{
    for (int i = 0; i < instr_num_srcs(instr); i++) {
        if (opnd_is_memory_reference(instr_get_src(instr, i))) {
            return true;
        }
    }
    for (int i = 0; i < instr_num_dsts(instr); i++) {
        if (opnd_is_memory_reference(instr_get_dst(instr, i))) {
            return true;
        }
    }
    return false;
}
static void get_instr_array_value(uint64 instr_kind_array[]){
    instr_kind_array[INDIRCT_BRANCH]=instr_kind_array[INDIRECT_CALL]+instr_kind_array[INDIRECT_JMP]+instr_kind_array[INDIRECT_RET];
    instr_kind_array[BRANCH_INSTR]=instr_kind_array[UNCONDITIONAL_DIRECT_BRANCH]+instr_kind_array[CONDITIONAL_BRANCH]+instr_kind_array[INDIRCT_BRANCH];
    instr_kind_array[OPERATION_INSTR]=instr_kind_array[BINARY]+instr_kind_array[LOGICAL]+instr_kind_array[SHIFT];
    instr_kind_array[TOTAL_INSTR]=instr_kind_array[REST_INSTR]+instr_kind_array[BRANCH_INSTR]+instr_kind_array[OPERATION_INSTR]+instr_kind_array[DATAXFER]+instr_kind_array[LOAD_STORE]+instr_kind_array[SIMD_INSTR];
}
int
instr_category(instr_t *instr)
{
    INSTR_KIND instr_kind;
    if (instr_is_call_indirect(instr)) {
        instr_kind = INDIRECT_CALL;
    } else if (myinstr_is_jmp_indirect(instr)) {
        instr_kind = INDIRECT_JMP;
    } else if (instr_is_return(instr)) {
        instr_kind = INDIRECT_RET;
    }else if (myinstr_is_simd(instr))
    {
        instr_kind = SIMD_INSTR;
    }else if (my_instr_is_store_load(instr)){
        instr_kind = LOAD_STORE;
    }else if (instr_is_cbr(instr)) {
        instr_kind = CONDITIONAL_BRANCH;
    } else if ((instr_is_ubr(instr) && (!(instr_is_mbr(instr)))) || instr_is_call_direct(instr)) {
        instr_kind = UNCONDITIONAL_DIRECT_BRANCH;
    } else if (my_instr_is_mov(instr)) {
        instr_kind=DATAXFER;
    } else if (my_instr_is_binary(instr)) {
        instr_kind = BINARY;
    } else if (my_instr_is_logical(instr)) {
        instr_kind = LOGICAL;
    } else if (my_instr_is_shift_rotate(instr)) {
        instr_kind = SHIFT;
    } else {
        instr_kind = REST_INSTR;
    }
    return instr_kind;
}
