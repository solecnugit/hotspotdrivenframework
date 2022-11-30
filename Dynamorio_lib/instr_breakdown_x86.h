#include "dr_api.h"
static bool my_instr_is_mov(instr_t *instr);
static bool my_instr_has_mem_ref(instr_t *instr);
static bool my_instr_is_binary(instr_t *instr);
static bool my_instr_is_logical(instr_t *instr);
static bool my_instr_is_shift_rotate(instr_t *instr);
static bool myinstr_is_jmp_indirect(instr_t *instr);
static bool my_instr_is_stack(instr_t *instr);
static bool myinstr_is_sse2(int opc);
static bool myinstr_is_sse3(int opc);
static bool myinstr_is_ssse3(int opc);
static bool myinstr_is_sse4(int opc);
static bool myinstr_is_avx(int opc);
static bool myinstr_is_avx2(int opc);
static bool myinstr_is_avx512(int opc);
static bool myinstr_belong_to_sses(instr_t *instr);
static bool myinstr_belong_to_avxs(instr_t *instr);
static void get_instr_array_value(uint64 instr_kind_array[]);
int instr_category(instr_t *instr);
enum INSTR_KIND
{
    INDIRECT_CALL,
    INDIRECT_JMP,
    INDIRECT_RET,
    STACK,
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
myinstr_is_sse2(int opc)
{
    return ((opc >= OP_punpcklbw) && (opc <= OP_emms) ||
            (opc >= OP_pinsrw) && (opc <= OP_pslldq));
}

static bool
myinstr_is_sse3(int opc)
{
    return ((opc >= OP_fisttp) && (opc <= OP_movddup));
}

static bool
myinstr_is_ssse3(int opc)
{
    return ((opc >= OP_pshufb) && (opc <= OP_palignr));
}

static bool
myinstr_is_sse4(int opc)
{
    return ((opc >= OP_popcnt) && (opc <= OP_pcmpistri));
}

static bool
myinstr_is_avx(int opc)
{
    return ((opc >= OP_vmovss) && (opc <= OP_vextractf128));
}

static bool
myinstr_is_avx2(int opc)
{
    return ((opc >= OP_vpgatherdd) && (opc <= OP_vpbroadcastq));
}

static bool
myinstr_is_avx512(int opc)
{
    return ((opc >= OP_kmovw) && (opc <= OP_vshufi64x2));
}

static bool
myinstr_belong_to_sses(instr_t *instr)
{
    int opc = instr_get_opcode(instr);
    return (instr_is_sse(instr)) || myinstr_is_sse2(opc) ||
           myinstr_is_sse3(opc) || myinstr_is_ssse3(opc) || myinstr_is_sse4(opc);
}

static bool
myinstr_belong_to_avxs(instr_t *instr)
{
    int opc = instr_get_opcode(instr);
    return myinstr_is_avx(opc) || myinstr_is_avx2(opc) || myinstr_is_avx512(opc);
}
static bool
myinstr_is_simd(instr_t *instr)
{
    return myinstr_belong_to_avxs(instr) || myinstr_belong_to_sses(instr);
}

static bool
my_instr_has_mem_ref(instr_t *instr)
{
    for (int i = 0; i < instr_num_srcs(instr); i++)
    {
        if (opnd_is_memory_reference(instr_get_src(instr, i)))
        {
            return true;
        }
    }
    for (int i = 0; i < instr_num_dsts(instr); i++)
    {
        if (opnd_is_memory_reference(instr_get_dst(instr, i)))
        {
            return true;
        }
    }

    return false;
}

static bool
my_instr_is_mov(instr_t *instr)
{
    int opc = instr_get_opcode(instr);
    return ((opc >= OP_mov_ld && opc <= OP_mov_priv) || (opc == OP_movd) ||
            (opc == OP_movq) || (opc == OP_movzx) || (opc == OP_movsx) ||
            (opc == OP_movnti) || (opc == OP_movs) || (opc == OP_movsxd));
}

static bool
my_instr_is_binary(instr_t *instr)
{
    int opc = instr_get_opcode(instr);
    bool oper = (opc >= OP_add && opc <= OP_dec);
    bool oper_add = (opc == OP_adc);
    bool oper_sub = (opc == OP_neg);
    bool oper_mul = (opc == OP_mul || opc == OP_imul);
    bool oper_div = (opc == OP_div || opc == OP_idiv);
    return oper_sub || oper_add || oper_mul || oper_div || oper;
}

static bool
my_instr_is_logical(instr_t *instr)
{
    int opc = instr_get_opcode(instr);
    bool oper_and = (opc == OP_and) || (opc == OP_pand);
    bool oper_or =
        (opc == OP_or) || (opc == OP_xor) || (opc == OP_por) || (opc == OP_pxor);
    bool oper_test = (opc == OP_test) || (opc == OP_not) || (opc == OP_ptest);
    return oper_and || oper_or || oper_test;
}
static bool
my_instr_is_stack(instr_t *instr)
{
    int opc = instr_get_opcode(instr);
    bool oper_pop = (opc == OP_pop || opc == OP_popa) || (opc == OP_popf);
    bool oper_push = (opc == OP_push) || (opc == OP_push_imm) || (opc == OP_pusha) ||
                     (opc == OP_pushf);
    return oper_pop || oper_push;
}
static bool
myinstr_is_jmp_indirect(instr_t *instr)
{
    int opc = instr_get_opcode(instr);
    return (opc == OP_jmp_ind) || (opc == OP_jmp_far_ind);
}
static bool
my_instr_is_shift_rotate(instr_t *instr)
{
    int opc = instr_get_opcode(instr);
    return (opc == OP_shl) || (opc == OP_shr) || (opc == OP_sar) || (opc == OP_shld) ||
           (opc >= OP_rol && opc <= OP_rcr) || (opc == OP_shrd);
}

static void get_instr_array_value(uint64 instr_kind_array[])
{
    instr_kind_array[INDIRCT_BRANCH] = instr_kind_array[INDIRECT_CALL] + instr_kind_array[INDIRECT_JMP] + instr_kind_array[INDIRECT_RET];
    instr_kind_array[BRANCH_INSTR] = instr_kind_array[UNCONDITIONAL_DIRECT_BRANCH] + instr_kind_array[CONDITIONAL_BRANCH] + instr_kind_array[INDIRCT_BRANCH];
    instr_kind_array[OPERATION_INSTR] = instr_kind_array[BINARY] + instr_kind_array[LOGICAL] + instr_kind_array[SHIFT];
    instr_kind_array[TOTAL_INSTR] = instr_kind_array[REST_INSTR] + instr_kind_array[BRANCH_INSTR] + instr_kind_array[OPERATION_INSTR] + instr_kind_array[DATAXFER] + instr_kind_array[STACK] + instr_kind_array[SIMD_INSTR];
}
int instr_category(instr_t *instr)
{
    INSTR_KIND instr_kind;
    if (instr_is_call_indirect(instr))
    {
        instr_kind = INDIRECT_CALL;
    }
    else if (myinstr_is_jmp_indirect(instr))
    {
        instr_kind = INDIRECT_JMP;
    }
    else if (instr_is_return(instr))
    {
        instr_kind = INDIRECT_RET;
    }
    else if (myinstr_is_simd(instr))
    {
        instr_kind = SIMD_INSTR;
    }
    else if (my_instr_is_stack(instr))
    {
        instr_kind = STACK;
    }
    else if (instr_is_cbr(instr))
    {
        instr_kind = CONDITIONAL_BRANCH;
    }
    else if ((instr_is_ubr(instr)) || instr_is_call_direct(instr))
    {
        instr_kind = UNCONDITIONAL_DIRECT_BRANCH;
    }
    else if (my_instr_is_mov(instr))
    {
        instr_kind = DATAXFER;
    }
    else if (my_instr_is_binary(instr))
    {
        instr_kind = BINARY;
    }
    else if (my_instr_is_logical(instr))
    {
        instr_kind = LOGICAL;
    }
    else if (my_instr_is_shift_rotate(instr))
    {
        instr_kind = SHIFT;
    }
    else
    {
        instr_kind = REST_INSTR;
    }
    return instr_kind;
}
