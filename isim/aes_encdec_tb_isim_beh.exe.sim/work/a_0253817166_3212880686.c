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
static const char *ng0 = "C:/Users/HP/Desktop/University/Academics/Capstone/aes128_vhdl/aes128_v4/key_expand.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_2592010699_sub_1697423399_503743352(char *, char *, char *, char *, char *, char *);


static void work_a_0253817166_3212880686_p_0(char *t0)
{
    char t1[16];
    char t2[16];
    char t9[16];
    char t18[16];
    char t30[16];
    char t40[16];
    char t50[16];
    char t52[16];
    char t61[16];
    char t71[16];
    char t73[16];
    char t82[16];
    char t92[16];
    char t94[16];
    char t102[16];
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    int t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    char *t19;
    char *t20;
    int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    int t25;
    int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t31;
    char *t32;
    int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    char *t41;
    char *t42;
    int t43;
    unsigned int t44;
    int t45;
    int t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    char *t51;
    char *t53;
    char *t54;
    int t55;
    unsigned int t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    char *t62;
    char *t63;
    int t64;
    unsigned int t65;
    int t66;
    int t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    char *t72;
    char *t74;
    char *t75;
    int t76;
    unsigned int t77;
    char *t78;
    char *t79;
    unsigned int t80;
    unsigned int t81;
    char *t83;
    char *t84;
    int t85;
    unsigned int t86;
    int t87;
    int t88;
    unsigned int t89;
    unsigned int t90;
    char *t91;
    char *t93;
    char *t95;
    char *t96;
    int t97;
    unsigned int t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    char *t103;
    char *t104;
    int t105;
    unsigned int t106;
    char *t107;
    unsigned int t108;
    unsigned char t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    char *t114;
    char *t115;

LAB0:    xsi_set_current_line(72, ng0);

LAB3:    t3 = (t0 + 2408U);
    t4 = *((char **)t3);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t6 = (127 - 23);
    t7 = (t6 * 1U);
    t8 = (0 + t7);
    t3 = (t5 + t8);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 23;
    t11 = (t10 + 4U);
    *((int *)t11) = 16;
    t11 = (t10 + 8U);
    *((int *)t11) = -1;
    t12 = (16 - 23);
    t13 = (t12 * -1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    t14 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t9);
    t15 = (t14 - 0);
    t13 = (t15 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t14);
    t16 = (8U * t13);
    t17 = (0 + t16);
    t11 = (t4 + t17);
    t19 = (t18 + 0U);
    t20 = (t19 + 0U);
    *((int *)t20) = 7;
    t20 = (t19 + 4U);
    *((int *)t20) = 0;
    t20 = (t19 + 8U);
    *((int *)t20) = -1;
    t21 = (0 - 7);
    t22 = (t21 * -1);
    t22 = (t22 + 1);
    t20 = (t19 + 12U);
    *((unsigned int *)t20) = t22;
    t20 = (t0 + 2288U);
    t23 = *((char **)t20);
    t20 = (t0 + 1192U);
    t24 = *((char **)t20);
    t20 = (t0 + 8608U);
    t25 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t24, t20);
    t26 = (t25 - 0);
    t22 = (t26 * 1);
    xsi_vhdl_check_range_of_index(0, 11, 1, t25);
    t27 = (8U * t22);
    t28 = (0 + t27);
    t29 = (t23 + t28);
    t31 = (t30 + 0U);
    t32 = (t31 + 0U);
    *((int *)t32) = 7;
    t32 = (t31 + 4U);
    *((int *)t32) = 0;
    t32 = (t31 + 8U);
    *((int *)t32) = -1;
    t33 = (0 - 7);
    t34 = (t33 * -1);
    t34 = (t34 + 1);
    t32 = (t31 + 12U);
    *((unsigned int *)t32) = t34;
    t32 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t2, t11, t18, t29, t30);
    t35 = (t0 + 2408U);
    t36 = *((char **)t35);
    t35 = (t0 + 1032U);
    t37 = *((char **)t35);
    t34 = (127 - 15);
    t38 = (t34 * 1U);
    t39 = (0 + t38);
    t35 = (t37 + t39);
    t41 = (t40 + 0U);
    t42 = (t41 + 0U);
    *((int *)t42) = 15;
    t42 = (t41 + 4U);
    *((int *)t42) = 8;
    t42 = (t41 + 8U);
    *((int *)t42) = -1;
    t43 = (8 - 15);
    t44 = (t43 * -1);
    t44 = (t44 + 1);
    t42 = (t41 + 12U);
    *((unsigned int *)t42) = t44;
    t45 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t35, t40);
    t46 = (t45 - 0);
    t44 = (t46 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t45);
    t47 = (8U * t44);
    t48 = (0 + t47);
    t42 = (t36 + t48);
    t51 = ((IEEE_P_2592010699) + 4024);
    t53 = (t52 + 0U);
    t54 = (t53 + 0U);
    *((int *)t54) = 7;
    t54 = (t53 + 4U);
    *((int *)t54) = 0;
    t54 = (t53 + 8U);
    *((int *)t54) = -1;
    t55 = (0 - 7);
    t56 = (t55 * -1);
    t56 = (t56 + 1);
    t54 = (t53 + 12U);
    *((unsigned int *)t54) = t56;
    t49 = xsi_base_array_concat(t49, t50, t51, (char)97, t32, t2, (char)97, t42, t52, (char)101);
    t54 = (t0 + 2408U);
    t57 = *((char **)t54);
    t54 = (t0 + 1032U);
    t58 = *((char **)t54);
    t56 = (127 - 7);
    t59 = (t56 * 1U);
    t60 = (0 + t59);
    t54 = (t58 + t60);
    t62 = (t61 + 0U);
    t63 = (t62 + 0U);
    *((int *)t63) = 7;
    t63 = (t62 + 4U);
    *((int *)t63) = 0;
    t63 = (t62 + 8U);
    *((int *)t63) = -1;
    t64 = (0 - 7);
    t65 = (t64 * -1);
    t65 = (t65 + 1);
    t63 = (t62 + 12U);
    *((unsigned int *)t63) = t65;
    t66 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t54, t61);
    t67 = (t66 - 0);
    t65 = (t67 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t66);
    t68 = (8U * t65);
    t69 = (0 + t68);
    t63 = (t57 + t69);
    t72 = ((IEEE_P_2592010699) + 4024);
    t74 = (t73 + 0U);
    t75 = (t74 + 0U);
    *((int *)t75) = 7;
    t75 = (t74 + 4U);
    *((int *)t75) = 0;
    t75 = (t74 + 8U);
    *((int *)t75) = -1;
    t76 = (0 - 7);
    t77 = (t76 * -1);
    t77 = (t77 + 1);
    t75 = (t74 + 12U);
    *((unsigned int *)t75) = t77;
    t70 = xsi_base_array_concat(t70, t71, t72, (char)97, t49, t50, (char)97, t63, t73, (char)101);
    t75 = (t0 + 2408U);
    t78 = *((char **)t75);
    t75 = (t0 + 1032U);
    t79 = *((char **)t75);
    t77 = (127 - 31);
    t80 = (t77 * 1U);
    t81 = (0 + t80);
    t75 = (t79 + t81);
    t83 = (t82 + 0U);
    t84 = (t83 + 0U);
    *((int *)t84) = 31;
    t84 = (t83 + 4U);
    *((int *)t84) = 24;
    t84 = (t83 + 8U);
    *((int *)t84) = -1;
    t85 = (24 - 31);
    t86 = (t85 * -1);
    t86 = (t86 + 1);
    t84 = (t83 + 12U);
    *((unsigned int *)t84) = t86;
    t87 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t75, t82);
    t88 = (t87 - 0);
    t86 = (t88 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t87);
    t89 = (8U * t86);
    t90 = (0 + t89);
    t84 = (t78 + t90);
    t93 = ((IEEE_P_2592010699) + 4024);
    t95 = (t94 + 0U);
    t96 = (t95 + 0U);
    *((int *)t96) = 7;
    t96 = (t95 + 4U);
    *((int *)t96) = 0;
    t96 = (t95 + 8U);
    *((int *)t96) = -1;
    t97 = (0 - 7);
    t98 = (t97 * -1);
    t98 = (t98 + 1);
    t96 = (t95 + 12U);
    *((unsigned int *)t96) = t98;
    t91 = xsi_base_array_concat(t91, t92, t93, (char)97, t70, t71, (char)97, t84, t94, (char)101);
    t96 = (t0 + 1032U);
    t99 = *((char **)t96);
    t98 = (127 - 127);
    t100 = (t98 * 1U);
    t101 = (0 + t100);
    t96 = (t99 + t101);
    t103 = (t102 + 0U);
    t104 = (t103 + 0U);
    *((int *)t104) = 127;
    t104 = (t103 + 4U);
    *((int *)t104) = 96;
    t104 = (t103 + 8U);
    *((int *)t104) = -1;
    t105 = (96 - 127);
    t106 = (t105 * -1);
    t106 = (t106 + 1);
    t104 = (t103 + 12U);
    *((unsigned int *)t104) = t106;
    t104 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t1, t91, t92, t96, t102);
    t107 = (t1 + 12U);
    t106 = *((unsigned int *)t107);
    t108 = (1U * t106);
    t109 = (32U != t108);
    if (t109 == 1)
        goto LAB5;

LAB6:    t110 = (t0 + 4848);
    t111 = (t110 + 56U);
    t112 = *((char **)t111);
    t113 = (t112 + 56U);
    t114 = *((char **)t113);
    memcpy(t114, t104, 32U);
    xsi_driver_first_trans_fast(t110);

LAB2:    t115 = (t0 + 4704);
    *((int *)t115) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t108, 0);
    goto LAB6;

}

static void work_a_0253817166_3212880686_p_1(char *t0)
{
    char t1[16];
    char t9[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(77, ng0);

LAB3:    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 8704U);
    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = (127 - 95);
    t7 = (t6 * 1U);
    t8 = (0 + t7);
    t4 = (t5 + t8);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 95;
    t11 = (t10 + 4U);
    *((int *)t11) = 64;
    t11 = (t10 + 8U);
    *((int *)t11) = -1;
    t12 = (64 - 95);
    t13 = (t12 * -1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    t11 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t1, t3, t2, t4, t9);
    t14 = (t1 + 12U);
    t13 = *((unsigned int *)t14);
    t15 = (1U * t13);
    t16 = (32U != t15);
    if (t16 == 1)
        goto LAB5;

LAB6:    t17 = (t0 + 4912);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t11, 32U);
    xsi_driver_first_trans_fast(t17);

LAB2:    t22 = (t0 + 4720);
    *((int *)t22) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t15, 0);
    goto LAB6;

}

static void work_a_0253817166_3212880686_p_2(char *t0)
{
    char t1[16];
    char t9[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(78, ng0);

LAB3:    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 8720U);
    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = (127 - 63);
    t7 = (t6 * 1U);
    t8 = (0 + t7);
    t4 = (t5 + t8);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 63;
    t11 = (t10 + 4U);
    *((int *)t11) = 32;
    t11 = (t10 + 8U);
    *((int *)t11) = -1;
    t12 = (32 - 63);
    t13 = (t12 * -1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    t11 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t1, t3, t2, t4, t9);
    t14 = (t1 + 12U);
    t13 = *((unsigned int *)t14);
    t15 = (1U * t13);
    t16 = (32U != t15);
    if (t16 == 1)
        goto LAB5;

LAB6:    t17 = (t0 + 4976);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t11, 32U);
    xsi_driver_first_trans_fast(t17);

LAB2:    t22 = (t0 + 4736);
    *((int *)t22) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t15, 0);
    goto LAB6;

}

static void work_a_0253817166_3212880686_p_3(char *t0)
{
    char t1[16];
    char t9[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(79, ng0);

LAB3:    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t2 = (t0 + 8736U);
    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = (127 - 31);
    t7 = (t6 * 1U);
    t8 = (0 + t7);
    t4 = (t5 + t8);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 31;
    t11 = (t10 + 4U);
    *((int *)t11) = 0;
    t11 = (t10 + 8U);
    *((int *)t11) = -1;
    t12 = (0 - 31);
    t13 = (t12 * -1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    t11 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t1, t3, t2, t4, t9);
    t14 = (t1 + 12U);
    t13 = *((unsigned int *)t14);
    t15 = (1U * t13);
    t16 = (32U != t15);
    if (t16 == 1)
        goto LAB5;

LAB6:    t17 = (t0 + 5040);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t11, 32U);
    xsi_driver_first_trans_fast(t17);

LAB2:    t22 = (t0 + 4752);
    *((int *)t22) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t15, 0);
    goto LAB6;

}

static void work_a_0253817166_3212880686_p_4(char *t0)
{
    char t4[16];
    char t10[16];
    char t15[16];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(81, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t5 = ((IEEE_P_2592010699) + 4024);
    t6 = (t0 + 8704U);
    t7 = (t0 + 8720U);
    t1 = xsi_base_array_concat(t1, t4, t5, (char)97, t2, t6, (char)97, t3, t7, (char)101);
    t8 = (t0 + 1832U);
    t9 = *((char **)t8);
    t11 = ((IEEE_P_2592010699) + 4024);
    t12 = (t0 + 8736U);
    t8 = xsi_base_array_concat(t8, t10, t11, (char)97, t1, t4, (char)97, t9, t12, (char)101);
    t13 = (t0 + 1992U);
    t14 = *((char **)t13);
    t16 = ((IEEE_P_2592010699) + 4024);
    t17 = (t0 + 8752U);
    t13 = xsi_base_array_concat(t13, t15, t16, (char)97, t8, t10, (char)97, t14, t17, (char)101);
    t18 = (32U + 32U);
    t19 = (t18 + 32U);
    t20 = (t19 + 32U);
    t21 = (128U != t20);
    if (t21 == 1)
        goto LAB5;

LAB6:    t22 = (t0 + 5104);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t13, 128U);
    xsi_driver_first_trans_fast_port(t22);

LAB2:    t27 = (t0 + 4768);
    *((int *)t27) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(128U, t20, 0);
    goto LAB6;

}


extern void work_a_0253817166_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0253817166_3212880686_p_0,(void *)work_a_0253817166_3212880686_p_1,(void *)work_a_0253817166_3212880686_p_2,(void *)work_a_0253817166_3212880686_p_3,(void *)work_a_0253817166_3212880686_p_4};
	xsi_register_didat("work_a_0253817166_3212880686", "isim/aes_encdec_tb_isim_beh.exe.sim/work/a_0253817166_3212880686.didat");
	xsi_register_executes(pe);
}
