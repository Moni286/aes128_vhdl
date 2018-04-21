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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/HP/Desktop/University/Academics/Capstone/aes128_vhdl/aes128_v4/encrypt.vhd";
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_1697423399_503743352(char *, char *, char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0895618651_3212880686_p_0(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(78, ng0);

LAB3:    t2 = (t0 + 3272U);
    t3 = *((char **)t2);
    t2 = (t0 + 10268U);
    t4 = (t0 + 1672U);
    t5 = *((char **)t4);
    t4 = (t0 + 10108U);
    t6 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t1, t3, t2, t5, t4);
    t7 = (t1 + 12U);
    t8 = *((unsigned int *)t7);
    t9 = (1U * t8);
    t10 = (128U != t9);
    if (t10 == 1)
        goto LAB5;

LAB6:    t11 = (t0 + 5680);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 128U);
    xsi_driver_first_trans_fast(t11);

LAB2:    t16 = (t0 + 5568);
    *((int *)t16) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(128U, t9, 0);
    goto LAB6;

}

static void work_a_0895618651_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(80, ng0);

LAB3:    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 5744);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 128U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 5584);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0895618651_3212880686_p_2(char *t0)
{
    char t19[16];
    char t20[16];
    char t21[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    xsi_set_current_line(84, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 5600);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(85, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(87, ng0);
    t3 = (t0 + 1352U);
    t7 = *((char **)t3);
    t3 = (t0 + 11324);
    t9 = 1;
    if (4U == 4U)
        goto LAB11;

LAB12:    t9 = 0;

LAB13:    if (t9 != 0)
        goto LAB8;

LAB10:    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t1 = (t0 + 11328);
    t2 = 1;
    if (4U == 4U)
        goto LAB19;

LAB20:    t2 = 0;

LAB21:    if (t2 != 0)
        goto LAB17;

LAB18:    xsi_set_current_line(93, ng0);
    t1 = (t0 + 2792U);
    t3 = *((char **)t1);
    t1 = (t0 + 5808);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    memcpy(t11, t3, 128U);
    xsi_driver_first_trans_fast(t1);

LAB9:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t1 = (t0 + 5872);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    memcpy(t11, t3, 128U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(97, ng0);
    t1 = (t0 + 2152U);
    t3 = *((char **)t1);
    t1 = (t0 + 2312U);
    t4 = *((char **)t1);
    t7 = ((IEEE_P_2592010699) + 4024);
    t8 = (t0 + 10156U);
    t11 = (t0 + 10172U);
    t1 = xsi_base_array_concat(t1, t19, t7, (char)97, t3, t8, (char)97, t4, t11, (char)101);
    t12 = (t0 + 2472U);
    t13 = *((char **)t12);
    t14 = ((IEEE_P_2592010699) + 4024);
    t15 = (t0 + 10188U);
    t12 = xsi_base_array_concat(t12, t20, t14, (char)97, t1, t19, (char)97, t13, t15, (char)101);
    t16 = (t0 + 2632U);
    t17 = *((char **)t16);
    t18 = ((IEEE_P_2592010699) + 4024);
    t22 = (t0 + 10204U);
    t16 = xsi_base_array_concat(t16, t21, t18, (char)97, t12, t20, (char)97, t17, t22, (char)101);
    t10 = (32U + 32U);
    t23 = (t10 + 32U);
    t24 = (t23 + 32U);
    t2 = (128U != t24);
    if (t2 == 1)
        goto LAB25;

LAB26:    t25 = (t0 + 5936);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memcpy(t29, t16, 128U);
    xsi_driver_first_trans_fast(t25);
    xsi_set_current_line(99, ng0);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t1 = (t0 + 11332);
    t2 = 1;
    if (4U == 4U)
        goto LAB30;

LAB31:    t2 = 0;

LAB32:    if (t2 != 0)
        goto LAB27;

LAB29:    xsi_set_current_line(102, ng0);
    t1 = (t0 + 6000);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB28:    xsi_set_current_line(104, ng0);
    t1 = (t0 + 3432U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (t0 + 6064);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = t2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(106, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB36;

LAB38:
LAB37:    goto LAB6;

LAB8:    xsi_set_current_line(88, ng0);
    t13 = (t0 + 2792U);
    t14 = *((char **)t13);
    t13 = (t0 + 5808);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t14, 128U);
    xsi_driver_first_trans_fast(t13);
    goto LAB9;

LAB11:    t10 = 0;

LAB14:    if (t10 < 4U)
        goto LAB15;
    else
        goto LAB13;

LAB15:    t11 = (t7 + t10);
    t12 = (t3 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB12;

LAB16:    t10 = (t10 + 1);
    goto LAB14;

LAB17:    xsi_set_current_line(91, ng0);
    t11 = (t0 + 1512U);
    t12 = *((char **)t11);
    t11 = (t0 + 5808);
    t13 = (t11 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t12, 128U);
    xsi_driver_first_trans_fast(t11);
    goto LAB9;

LAB19:    t10 = 0;

LAB22:    if (t10 < 4U)
        goto LAB23;
    else
        goto LAB21;

LAB23:    t7 = (t3 + t10);
    t8 = (t1 + t10);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB20;

LAB24:    t10 = (t10 + 1);
    goto LAB22;

LAB25:    xsi_size_not_matching(128U, t24, 0);
    goto LAB26;

LAB27:    xsi_set_current_line(100, ng0);
    t11 = (t0 + 6000);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)3;
    xsi_driver_first_trans_fast(t11);
    goto LAB28;

LAB30:    t10 = 0;

LAB33:    if (t10 < 4U)
        goto LAB34;
    else
        goto LAB32;

LAB34:    t7 = (t3 + t10);
    t8 = (t1 + t10);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB31;

LAB35:    t10 = (t10 + 1);
    goto LAB33;

LAB36:    xsi_set_current_line(107, ng0);
    t1 = (t0 + 3112U);
    t4 = *((char **)t1);
    t1 = (t0 + 5936);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t4, 128U);
    xsi_driver_first_trans_fast(t1);
    goto LAB37;

}


extern void work_a_0895618651_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0895618651_3212880686_p_0,(void *)work_a_0895618651_3212880686_p_1,(void *)work_a_0895618651_3212880686_p_2};
	xsi_register_didat("work_a_0895618651_3212880686", "isim/aes_encdec_tb_isim_beh.exe.sim/work/a_0895618651_3212880686.didat");
	xsi_register_executes(pe);
}
