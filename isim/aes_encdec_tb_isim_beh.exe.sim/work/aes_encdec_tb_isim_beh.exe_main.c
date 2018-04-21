/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *UNISIM_P_0947159679;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    unisim_p_0947159679_init();
    ieee_p_1242562249_init();
    work_a_0567951521_3212880686_init();
    work_a_1341087878_3212880686_init();
    work_a_0895618651_3212880686_init();
    work_a_3052820352_3212880686_init();
    work_a_1405650656_3212880686_init();
    work_a_3282169438_3212880686_init();
    work_a_1958850193_3212880686_init();
    work_a_0253817166_3212880686_init();
    work_a_2868674129_3212880686_init();
    work_a_0491722910_3212880686_init();
    work_a_0968957248_1566020785_init();
    work_a_1805972122_3212880686_init();
    work_a_0109545735_2372691052_init();


    xsi_register_tops("work_a_0109545735_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");

    return xsi_run_simulation(argc, argv);

}
