#include "string.h"
#include "dr_api.h"
#include "drsyms.h"
#define MAX_SYM_RESULT 5096
#define MAXIMUM_PATH 512
char * get_symbol_name(app_pc instr_address);
const char *get_module_name(app_pc instr_address);
const char *get_module_path(app_pc instr_address);
bool symbol_name_is_equal(app_pc instr_address,const char *given_symname);
size_t get_logical_address(app_pc physical_address);
app_pc get_physical_address_symbol_head(app_pc physical_address,const char *symbol_name);
bool physical_address_is_symbol_head(app_pc physical_address,const char *symbol_name);
bool tag_is_main_module(void *tag);
bool logical_address_is_in_range(app_pc physical_address, u_long start_address,u_long end_address);
const char *get_main_module_name();
bool physical_address_is_in_range(app_pc physical_address, u_long start_address,u_long end_address);

/*Looks up the function name for the corresponding instruction*/
char *
get_symbol_name(app_pc instr_address)
{
    module_data_t *data = dr_lookup_module(instr_address);
    if (data == NULL) {
        return NULL;
    }
    drsym_info_t sym;
    char name[MAX_SYM_RESULT];
    char file[MAXIMUM_PATH];
    sym.struct_size = sizeof(sym);
    sym.name = name;
    sym.name_size = MAX_SYM_RESULT;
    sym.file = file;
    sym.file_size = MAXIMUM_PATH;
    drsym_error_t symres = drsym_lookup_address(
        data->full_path, (app_pc)instr_address - data->start, &sym, DRSYM_DEFAULT_FLAGS);
    return sym.name;
}

/*Looks up module name for the main executable*/
const char *
get_main_module_name()
{
    const char *modname;
    modname = dr_module_preferred_name(dr_get_main_module());
    return modname;
}

/*Looks up module name for the corresponding instruction*/
const char *
get_module_name(app_pc instr_address)
{
    module_data_t *data = dr_lookup_module(instr_address);
    if (data == NULL) {
        return NULL;
    }
    const char *modname;
    modname = dr_module_preferred_name(data);
    return modname;
}

/*Looks up absolute path for the module of corresponding instruction*/
const char *
get_module_path(app_pc instr_address)
{
    module_data_t *data = dr_lookup_module(instr_address);
    if (data == NULL) {
        return NULL;
    }
    return data->full_path;
}

/*Determines whether the physical address belongs to given function*/
bool
symbol_name_is_equal(app_pc instr_address,const char *given_symname)
{
    module_data_t *data = dr_lookup_module(instr_address);
    if (data == NULL) {
        return false;
    }
    drsym_info_t sym;
    char name[MAX_SYM_RESULT];
    char file[MAXIMUM_PATH];
    sym.struct_size = sizeof(sym);
    sym.name = name;
    sym.name_size = MAX_SYM_RESULT;
    sym.file = file;
    sym.file_size = MAXIMUM_PATH;
    drsym_error_t symres = drsym_lookup_address(
        data->full_path, instr_address - data->start, &sym, DRSYM_DEFAULT_FLAGS);
    const char *symname = sym.name;
    if (strcmp(given_symname, symname) == 0) {
        return true;
    } else {
        return false;
    }
}

/*Looks up the logical address of given physical address*/
size_t
get_logical_address(app_pc physical_address)
{
    module_data_t *data = dr_lookup_module(physical_address);
    if (data == NULL) {
        return 0;
    }
    size_t logical_address = physical_address - data->start;
    return logical_address;
}

/*Looks up the first physical address for given function*/
app_pc
get_physical_address_symbol_head(app_pc physical_address,const char *symbol_name)
{
    module_data_t *data = dr_lookup_module(physical_address);
    if (data == NULL) {
        return 0;
    }
    size_t modoffs;
    drsym_error_t sym_res = drsym_lookup_symbol(
        data->full_path, symbol_name, &modoffs, DRSYM_DEMANGLE);
    if (sym_res=DRSYM_ERROR_SYMBOL_NOT_FOUND)
    {
        return 0;   
    }
    app_pc physical_address_symbol_head =  data->start+ modoffs;
    return physical_address_symbol_head;
}

/*Determines whether the physical address is the first instruction of given function*/
bool
physical_address_is_symbol_head(app_pc physical_address,const char *symbol_name)
{
    module_data_t *data = dr_lookup_module(physical_address);
    if (data == NULL) {
        return false;
    }
    size_t modoffs;
    drsym_error_t sym_res = drsym_lookup_symbol(
    data->full_path, symbol_name, &modoffs, DRSYM_DEMANGLE);
    app_pc physical_address_symbol_head =  data->start+ modoffs;
    std::cout<<std::hex<<physical_address_symbol_head<<std::endl;
    return (uint64)physical_address_symbol_head==(uint64)physical_address;    
}

/*Looks up the first instruction of the main executable*/
uint64
get_main_module_symbol_head(const char *symbol_name)
{
    module_data_t *data = dr_get_main_module();
    if (data == NULL) {
        return 0;
    }
    size_t modoffs;
    drsym_error_t sym_res = drsym_lookup_symbol(
        data->full_path, symbol_name, &modoffs, DRSYM_DEMANGLE);
    app_pc physical_address_symbol_head =  data->start+ modoffs;
    return (uint64)physical_address_symbol_head;
}

/*Determines whether the tag belongs to the module of main executable*/
bool tag_is_main_module(void *tag){
    module_data_t *main_module = dr_get_main_module();
    return dr_module_contains_addr(main_module, dr_fragment_app_pc(tag));
}

/*Determines whether the logical address is within a certain range*/
bool
logical_address_is_in_range(app_pc physical_address, u_long start_address,
                            u_long end_address)
{
    module_data_t *data = dr_lookup_module(physical_address);
    if (data == NULL) {
        return false;
    }
    size_t logical_address = physical_address - data->start;
    if ((logical_address >= start_address) && (logical_address <= end_address)) {
        return true;
    }else
    {
        return false;
    }
}

/*Determines whether the physical address is within a certain range*/
bool
physical_address_is_in_range(app_pc physical_address, u_long start_address, //static linking
                            u_long end_address)
{
    size_t logical_address = (u_long)physical_address;
    if ((logical_address >= start_address) && (logical_address <= end_address)) {
        return true;
    }else
    {
        return false;
    }
}