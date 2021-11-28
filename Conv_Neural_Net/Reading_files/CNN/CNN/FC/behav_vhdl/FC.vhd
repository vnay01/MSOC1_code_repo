-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
-- Date        : Tue Oct 16 00:46:21 2018
-- Host        : pax-15 running 64-bit major release  (build 9200)
-- Command     : write_vhdl FC.vhd
-- Design      : FC_TOP
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FC1_Controller is
  port (
    start_out : out STD_LOGIC;
    DI : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    valid_pooling_IBUF : in STD_LOGIC;
    valid_FC1_in_IBUF : in STD_LOGIC;
    \counter_temp_reg[5]\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \pooling[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end FC1_Controller;

architecture STRUCTURE of FC1_Controller is
  signal FC_input_del : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal FC_weight_del : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \counter_in[1]_i_1_n_0\ : STD_LOGIC;
  signal \counter_in[2]_i_1_n_0\ : STD_LOGIC;
  signal \counter_in[3]_i_1_n_0\ : STD_LOGIC;
  signal \counter_in[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_in_access[1]_i_1_n_0\ : STD_LOGIC;
  signal \counter_in_access_reg_n_0_[0]\ : STD_LOGIC;
  signal \counter_in_access_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter_in_access_reg_n_0_[2]\ : STD_LOGIC;
  signal \counter_in_access_reg_n_0_[3]\ : STD_LOGIC;
  signal \counter_in_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \counter_w[1]_i_1_n_0\ : STD_LOGIC;
  signal \counter_w[5]_i_1_n_0\ : STD_LOGIC;
  signal \counter_w_access[1]_i_1_n_0\ : STD_LOGIC;
  signal \counter_w_access_reg__0\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \counter_w_reg__0\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal curr_state_access : STD_LOGIC;
  signal curr_state_access_i_2_n_0 : STD_LOGIC;
  signal curr_state_buf : STD_LOGIC;
  signal curr_state_buf0 : STD_LOGIC;
  signal \in_FC[15][3]_i_2_n_0\ : STD_LOGIC;
  signal \in_FC[7][3]_i_2_n_0\ : STD_LOGIC;
  signal \in_FC_reg[10]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \in_FC_reg[11]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \in_FC_reg[12]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \in_FC_reg[13]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \in_FC_reg[14]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \in_FC_reg[15]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \in_FC_reg[3]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \in_FC_reg[4]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \in_FC_reg[5]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \in_FC_reg[6]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \in_FC_reg[7]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \in_FC_reg[8]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \in_FC_reg[9]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \in_FC_reg_n_0_[0][0]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[0][1]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[0][2]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[0][3]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[1][0]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[1][1]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[1][2]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[1][3]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[2][0]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[2][1]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[2][2]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[2][3]\ : STD_LOGIC;
  signal \mul_FC[0]_i_1_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_13_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_14_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_15_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_16_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_2_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_32_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_33_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_34_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_35_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_36_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_37_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_38_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_39_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_3_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_40_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_41_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_42_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_43_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_44_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_45_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_46_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_47_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_48_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_49_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_4_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_50_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_51_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_52_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_53_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_54_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_55_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_5_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_6_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_7_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_8_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_9_n_0\ : STD_LOGIC;
  signal \mul_FC[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \mul_FC[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \mul_FC[4]_i_1_n_0\ : STD_LOGIC;
  signal \mul_FC[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \mul_FC[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \mul_FC[7]_i_1_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_10_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_11_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_12_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_17_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_18_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_19_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_20_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_21_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_22_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_23_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_24_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_25_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_26_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_27_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_28_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_29_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_30_n_0\ : STD_LOGIC;
  signal \mul_FC_reg[1]_i_31_n_0\ : STD_LOGIC;
  signal next_counter_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal next_counter_in_access : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal next_counter_w : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal next_counter_w_access : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \next_in_FC[0]_2\ : STD_LOGIC;
  signal \next_in_FC[10]_28\ : STD_LOGIC;
  signal \next_in_FC[11]_26\ : STD_LOGIC;
  signal \next_in_FC[12]_29\ : STD_LOGIC;
  signal \next_in_FC[13]_27\ : STD_LOGIC;
  signal \next_in_FC[14]_7\ : STD_LOGIC;
  signal \next_in_FC[15]_4\ : STD_LOGIC;
  signal \next_in_FC[1]_1\ : STD_LOGIC;
  signal \next_in_FC[2]_32\ : STD_LOGIC;
  signal \next_in_FC[3]_30\ : STD_LOGIC;
  signal \next_in_FC[4]_33\ : STD_LOGIC;
  signal \next_in_FC[5]_31\ : STD_LOGIC;
  signal \next_in_FC[6]_6\ : STD_LOGIC;
  signal \next_in_FC[7]_5\ : STD_LOGIC;
  signal \next_in_FC[8]_3\ : STD_LOGIC;
  signal \next_in_FC[9]_0\ : STD_LOGIC;
  signal next_mul_FC0 : STD_LOGIC_VECTOR ( 6 downto 2 );
  signal \next_mul_FC0__0_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_11_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_12_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_13_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_14_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_15_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_16_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_17_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_18_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_19_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_20_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_21_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_22_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_23_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_24_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_25_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_26_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_27_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_28_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_29_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_30_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_31_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_32_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_i_9_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry__0_n_2\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_10_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_11_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_12_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_13_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_14_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_15_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_16_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_17_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_18_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_19_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_1_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_20_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_21_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_22_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_23_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_24_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_25_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_26_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_27_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_28_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_29_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_2_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_30_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_31_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_32_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_33_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_34_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_35_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_36_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_37_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_38_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_39_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_3_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_40_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_41_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_42_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_43_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_44_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_45_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_4_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_5_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_6_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_7_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_8_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_i_9_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_n_0\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_n_1\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_n_2\ : STD_LOGIC;
  signal \next_mul_FC0__0_carry_n_3\ : STD_LOGIC;
  signal next_state_access : STD_LOGIC;
  signal \next_w_FC[0]_55\ : STD_LOGIC;
  signal \next_w_FC[10]_58\ : STD_LOGIC;
  signal \next_w_FC[11]_18\ : STD_LOGIC;
  signal \next_w_FC[12]_8\ : STD_LOGIC;
  signal \next_w_FC[13]_9\ : STD_LOGIC;
  signal \next_w_FC[14]_10\ : STD_LOGIC;
  signal \next_w_FC[15]_15\ : STD_LOGIC;
  signal \next_w_FC[16]_24\ : STD_LOGIC;
  signal \next_w_FC[17]_34\ : STD_LOGIC;
  signal \next_w_FC[18]_23\ : STD_LOGIC;
  signal \next_w_FC[19]_17\ : STD_LOGIC;
  signal \next_w_FC[1]_53\ : STD_LOGIC;
  signal \next_w_FC[20]_39\ : STD_LOGIC;
  signal \next_w_FC[21]_40\ : STD_LOGIC;
  signal \next_w_FC[22]_25\ : STD_LOGIC;
  signal \next_w_FC[23]_59\ : STD_LOGIC;
  signal \next_w_FC[24]_38\ : STD_LOGIC;
  signal \next_w_FC[26]_35\ : STD_LOGIC;
  signal \next_w_FC[28]_37\ : STD_LOGIC;
  signal \next_w_FC[29]_36\ : STD_LOGIC;
  signal \next_w_FC[2]_57\ : STD_LOGIC;
  signal \next_w_FC[30]_11\ : STD_LOGIC;
  signal \next_w_FC[31]_14\ : STD_LOGIC;
  signal \next_w_FC[32]_49\ : STD_LOGIC;
  signal \next_w_FC[33]_47\ : STD_LOGIC;
  signal \next_w_FC[34]_45\ : STD_LOGIC;
  signal \next_w_FC[36]_41\ : STD_LOGIC;
  signal \next_w_FC[37]_44\ : STD_LOGIC;
  signal \next_w_FC[38]_50\ : STD_LOGIC;
  signal \next_w_FC[39]_21\ : STD_LOGIC;
  signal \next_w_FC[3]_20\ : STD_LOGIC;
  signal \next_w_FC[40]_43\ : STD_LOGIC;
  signal \next_w_FC[41]_48\ : STD_LOGIC;
  signal \next_w_FC[42]_46\ : STD_LOGIC;
  signal \next_w_FC[43]_22\ : STD_LOGIC;
  signal \next_w_FC[44]_42\ : STD_LOGIC;
  signal \next_w_FC[45]_12\ : STD_LOGIC;
  signal \next_w_FC[46]_13\ : STD_LOGIC;
  signal \next_w_FC[47]_16\ : STD_LOGIC;
  signal \next_w_FC[5]_52\ : STD_LOGIC;
  signal \next_w_FC[6]_54\ : STD_LOGIC;
  signal \next_w_FC[7]_19\ : STD_LOGIC;
  signal \next_w_FC[8]_56\ : STD_LOGIC;
  signal \next_w_FC[9]_51\ : STD_LOGIC;
  signal start : STD_LOGIC;
  signal valid_data_in_del : STD_LOGIC;
  signal valid_data_weight_del : STD_LOGIC;
  signal \w_FC[15][3]_i_2_n_0\ : STD_LOGIC;
  signal \w_FC[18][3]_i_2_n_0\ : STD_LOGIC;
  signal \w_FC[21][3]_i_2_n_0\ : STD_LOGIC;
  signal \w_FC[22][3]_i_2_n_0\ : STD_LOGIC;
  signal \w_FC[23][3]_i_2_n_0\ : STD_LOGIC;
  signal \w_FC[25][3]_i_1_n_0\ : STD_LOGIC;
  signal \w_FC[27][3]_i_1_n_0\ : STD_LOGIC;
  signal \w_FC[27][3]_i_2_n_0\ : STD_LOGIC;
  signal \w_FC[29][3]_i_2_n_0\ : STD_LOGIC;
  signal \w_FC[30][3]_i_2_n_0\ : STD_LOGIC;
  signal \w_FC[31][3]_i_2_n_0\ : STD_LOGIC;
  signal \w_FC[35][3]_i_1_n_0\ : STD_LOGIC;
  signal \w_FC[44][3]_i_2_n_0\ : STD_LOGIC;
  signal \w_FC[47][3]_i_2_n_0\ : STD_LOGIC;
  signal \w_FC[4][3]_i_1_n_0\ : STD_LOGIC;
  signal \w_FC_reg[10]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[11]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[12]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[13]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[14]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[15]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[16]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[17]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[18]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[19]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[20]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[21]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[22]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[23]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[24]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[25]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[26]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[27]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[28]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[29]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[30]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[31]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[32]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[33]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[34]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[35]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[36]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[37]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[38]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[39]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[3]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[40]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[41]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[42]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[43]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[44]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[45]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[46]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[47]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[4]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[5]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[6]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[7]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[8]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg[9]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w_FC_reg_n_0_[0][0]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[0][1]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[0][2]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[0][3]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[1][0]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[1][1]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[1][2]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[1][3]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[2][0]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[2][1]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[2][2]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[2][3]\ : STD_LOGIC;
  signal \NLW_next_mul_FC0__0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_next_mul_FC0__0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \counter_in[0]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \counter_in[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \counter_in[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \counter_in[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \counter_in_access[0]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \counter_in_access[1]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \counter_in_access[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \counter_in_access[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \counter_w[0]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \counter_w[1]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \counter_w[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \counter_w[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \counter_w_access[0]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \counter_w_access[1]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \counter_w_access[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \counter_w_access[3]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \counter_w_access[5]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of curr_state_access_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of curr_state_access_i_2 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of curr_state_buf_i_1 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \in_FC[15][3]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \in_FC[7][3]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \mul_FC[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \mul_FC[1]_i_1__0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \mul_FC[2]_i_1__0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \mul_FC[3]_i_1__0\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \mul_FC[5]_i_1__0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \mul_FC[6]_i_1__0\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \mul_FC[7]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \next_mul_FC0__0_carry_i_12\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \next_mul_FC0__0_carry_i_16\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \next_mul_FC0__0_carry_i_23\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \next_mul_FC0__0_carry_i_9\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \w_FC[15][3]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \w_FC[18][3]_i_2\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \w_FC[21][3]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \w_FC[23][3]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \w_FC[27][3]_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \w_FC[30][3]_i_2\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \w_FC[31][3]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \w_FC[44][3]_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \w_FC[47][3]_i_2\ : label is "soft_lutpair6";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
\FC_input_del_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \pooling[3]\(0),
      Q => FC_input_del(0)
    );
\FC_input_del_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \pooling[3]\(1),
      Q => FC_input_del(1)
    );
\FC_input_del_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \pooling[3]\(2),
      Q => FC_input_del(2)
    );
\FC_input_del_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \pooling[3]\(3),
      Q => FC_input_del(3)
    );
\FC_weight_del_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => D(0),
      Q => FC_weight_del(0)
    );
\FC_weight_del_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => D(1),
      Q => FC_weight_del(1)
    );
\FC_weight_del_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => D(2),
      Q => FC_weight_del(2)
    );
\FC_weight_del_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => D(3),
      Q => FC_weight_del(3)
    );
\counter_in[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state_buf,
      I1 => \counter_in_reg__0\(0),
      O => next_counter_in(0)
    );
\counter_in[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \counter_in_reg__0\(0),
      I1 => \counter_in_reg__0\(1),
      I2 => curr_state_buf,
      O => \counter_in[1]_i_1_n_0\
    );
\counter_in[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7800"
    )
        port map (
      I0 => \counter_in_reg__0\(1),
      I1 => \counter_in_reg__0\(0),
      I2 => \counter_in_reg__0\(2),
      I3 => curr_state_buf,
      O => \counter_in[2]_i_1_n_0\
    );
\counter_in[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F800000"
    )
        port map (
      I0 => \counter_in_reg__0\(1),
      I1 => \counter_in_reg__0\(2),
      I2 => \counter_in_reg__0\(0),
      I3 => \counter_in_reg__0\(3),
      I4 => curr_state_buf,
      O => \counter_in[3]_i_1_n_0\
    );
\counter_in[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => valid_data_in_del,
      I1 => curr_state_buf,
      O => \counter_in[4]_i_1_n_0\
    );
\counter_in[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
        port map (
      I0 => curr_state_buf,
      I1 => \counter_in_reg__0\(3),
      I2 => \counter_in_reg__0\(0),
      I3 => \counter_in_reg__0\(2),
      I4 => \counter_in_reg__0\(1),
      I5 => \counter_in_reg__0\(4),
      O => next_counter_in(4)
    );
\counter_in_access[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state_access,
      I1 => \counter_in_access_reg_n_0_[0]\,
      O => next_counter_in_access(0)
    );
\counter_in_access[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \counter_in_access_reg_n_0_[0]\,
      I1 => \counter_in_access_reg_n_0_[1]\,
      I2 => curr_state_access,
      O => \counter_in_access[1]_i_1_n_0\
    );
\counter_in_access[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => curr_state_access,
      I1 => \counter_in_access_reg_n_0_[1]\,
      I2 => \counter_in_access_reg_n_0_[0]\,
      I3 => \counter_in_access_reg_n_0_[2]\,
      O => next_counter_in_access(2)
    );
\counter_in_access[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => curr_state_access,
      I1 => \counter_in_access_reg_n_0_[0]\,
      I2 => \counter_in_access_reg_n_0_[1]\,
      I3 => \counter_in_access_reg_n_0_[2]\,
      I4 => \counter_in_access_reg_n_0_[3]\,
      O => next_counter_in_access(3)
    );
\counter_in_access_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_counter_in_access(0),
      Q => \counter_in_access_reg_n_0_[0]\
    );
\counter_in_access_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \counter_in_access[1]_i_1_n_0\,
      Q => \counter_in_access_reg_n_0_[1]\
    );
\counter_in_access_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_counter_in_access(2),
      Q => \counter_in_access_reg_n_0_[2]\
    );
\counter_in_access_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_counter_in_access(3),
      Q => \counter_in_access_reg_n_0_[3]\
    );
\counter_in_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \counter_in[4]_i_1_n_0\,
      CLR => AR(0),
      D => next_counter_in(0),
      Q => \counter_in_reg__0\(0)
    );
\counter_in_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \counter_in[4]_i_1_n_0\,
      CLR => AR(0),
      D => \counter_in[1]_i_1_n_0\,
      Q => \counter_in_reg__0\(1)
    );
\counter_in_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \counter_in[4]_i_1_n_0\,
      CLR => AR(0),
      D => \counter_in[2]_i_1_n_0\,
      Q => \counter_in_reg__0\(2)
    );
\counter_in_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \counter_in[4]_i_1_n_0\,
      CLR => AR(0),
      D => \counter_in[3]_i_1_n_0\,
      Q => \counter_in_reg__0\(3)
    );
\counter_in_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \counter_in[4]_i_1_n_0\,
      CLR => AR(0),
      D => next_counter_in(4),
      Q => \counter_in_reg__0\(4)
    );
\counter_w[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state_buf,
      I1 => \counter_w_reg__0\(0),
      O => next_counter_w(0)
    );
\counter_w[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \counter_w_reg__0\(1),
      I1 => \counter_w_reg__0\(0),
      I2 => curr_state_buf,
      O => \counter_w[1]_i_1_n_0\
    );
\counter_w[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => curr_state_buf,
      I1 => \counter_w_reg__0\(0),
      I2 => \counter_w_reg__0\(1),
      I3 => \counter_w_reg__0\(2),
      O => next_counter_w(2)
    );
\counter_w[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => curr_state_buf,
      I1 => \counter_w_reg__0\(2),
      I2 => \counter_w_reg__0\(1),
      I3 => \counter_w_reg__0\(0),
      I4 => \counter_w_reg__0\(3),
      O => next_counter_w(3)
    );
\counter_w[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
        port map (
      I0 => curr_state_buf,
      I1 => \counter_w_reg__0\(1),
      I2 => \counter_w_reg__0\(0),
      I3 => \counter_w_reg__0\(2),
      I4 => \counter_w_reg__0\(3),
      I5 => \counter_w_reg__0\(4),
      O => next_counter_w(4)
    );
\counter_w[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => valid_data_weight_del,
      I1 => curr_state_buf,
      O => \counter_w[5]_i_1_n_0\
    );
\counter_w[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
        port map (
      I0 => curr_state_buf,
      I1 => \w_FC[30][3]_i_2_n_0\,
      I2 => \counter_w_reg__0\(0),
      I3 => \counter_w_reg__0\(1),
      I4 => \counter_w_reg__0\(4),
      I5 => \counter_w_reg__0\(5),
      O => next_counter_w(5)
    );
\counter_w_access[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state_access,
      I1 => \counter_w_access_reg__0\(0),
      O => next_counter_w_access(0)
    );
\counter_w_access[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \counter_w_access_reg__0\(0),
      I1 => \counter_w_access_reg__0\(1),
      I2 => curr_state_access,
      O => \counter_w_access[1]_i_1_n_0\
    );
\counter_w_access[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => curr_state_access,
      I1 => \counter_w_access_reg__0\(1),
      I2 => \counter_w_access_reg__0\(0),
      I3 => \counter_w_access_reg__0\(2),
      O => next_counter_w_access(2)
    );
\counter_w_access[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => curr_state_access,
      I1 => \counter_w_access_reg__0\(2),
      I2 => \counter_w_access_reg__0\(0),
      I3 => \counter_w_access_reg__0\(1),
      I4 => \counter_w_access_reg__0\(3),
      O => next_counter_w_access(3)
    );
\counter_w_access[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
        port map (
      I0 => curr_state_access,
      I1 => \counter_w_access_reg__0\(1),
      I2 => \counter_w_access_reg__0\(0),
      I3 => \counter_w_access_reg__0\(2),
      I4 => \counter_w_access_reg__0\(3),
      I5 => \counter_w_access_reg__0\(4),
      O => next_counter_w_access(4)
    );
\counter_w_access[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => curr_state_access,
      I1 => curr_state_access_i_2_n_0,
      I2 => \counter_w_access_reg__0\(4),
      I3 => \counter_w_access_reg__0\(5),
      O => next_counter_w_access(5)
    );
\counter_w_access_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_counter_w_access(0),
      Q => \counter_w_access_reg__0\(0)
    );
\counter_w_access_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \counter_w_access[1]_i_1_n_0\,
      Q => \counter_w_access_reg__0\(1)
    );
\counter_w_access_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_counter_w_access(2),
      Q => \counter_w_access_reg__0\(2)
    );
\counter_w_access_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_counter_w_access(3),
      Q => \counter_w_access_reg__0\(3)
    );
\counter_w_access_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_counter_w_access(4),
      Q => \counter_w_access_reg__0\(4)
    );
\counter_w_access_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_counter_w_access(5),
      Q => \counter_w_access_reg__0\(5)
    );
\counter_w_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \counter_w[5]_i_1_n_0\,
      CLR => AR(0),
      D => next_counter_w(0),
      Q => \counter_w_reg__0\(0)
    );
\counter_w_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \counter_w[5]_i_1_n_0\,
      CLR => AR(0),
      D => \counter_w[1]_i_1_n_0\,
      Q => \counter_w_reg__0\(1)
    );
\counter_w_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \counter_w[5]_i_1_n_0\,
      CLR => AR(0),
      D => next_counter_w(2),
      Q => \counter_w_reg__0\(2)
    );
\counter_w_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \counter_w[5]_i_1_n_0\,
      CLR => AR(0),
      D => next_counter_w(3),
      Q => \counter_w_reg__0\(3)
    );
\counter_w_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \counter_w[5]_i_1_n_0\,
      CLR => AR(0),
      D => next_counter_w(4),
      Q => \counter_w_reg__0\(4)
    );
\counter_w_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \counter_w[5]_i_1_n_0\,
      CLR => AR(0),
      D => next_counter_w(5),
      Q => \counter_w_reg__0\(5)
    );
curr_state_access_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFDFFF00"
    )
        port map (
      I0 => \counter_w_access_reg__0\(5),
      I1 => \counter_w_access_reg__0\(4),
      I2 => curr_state_access_i_2_n_0,
      I3 => start,
      I4 => curr_state_access,
      O => next_state_access
    );
curr_state_access_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \counter_w_access_reg__0\(1),
      I1 => \counter_w_access_reg__0\(0),
      I2 => \counter_w_access_reg__0\(2),
      I3 => \counter_w_access_reg__0\(3),
      O => curr_state_access_i_2_n_0
    );
curr_state_access_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_state_access,
      Q => curr_state_access
    );
curr_state_buf_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5554"
    )
        port map (
      I0 => start,
      I1 => valid_pooling_IBUF,
      I2 => valid_FC1_in_IBUF,
      I3 => curr_state_buf,
      O => curr_state_buf0
    );
curr_state_buf_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => curr_state_buf0,
      Q => curr_state_buf
    );
\in_FC[0][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \counter_in_reg__0\(1),
      I1 => \counter_in_reg__0\(2),
      I2 => \in_FC[7][3]_i_2_n_0\,
      I3 => \counter_in_reg__0\(0),
      O => \next_in_FC[0]_2\
    );
\in_FC[10][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \counter_in_reg__0\(0),
      I1 => \in_FC[15][3]_i_2_n_0\,
      I2 => \counter_in_reg__0\(2),
      I3 => \counter_in_reg__0\(1),
      O => \next_in_FC[10]_28\
    );
\in_FC[11][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \in_FC[15][3]_i_2_n_0\,
      I1 => \counter_in_reg__0\(0),
      I2 => \counter_in_reg__0\(1),
      I3 => \counter_in_reg__0\(2),
      O => \next_in_FC[11]_26\
    );
\in_FC[12][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \counter_in_reg__0\(0),
      I1 => \in_FC[15][3]_i_2_n_0\,
      I2 => \counter_in_reg__0\(1),
      I3 => \counter_in_reg__0\(2),
      O => \next_in_FC[12]_29\
    );
\in_FC[13][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \in_FC[15][3]_i_2_n_0\,
      I1 => \counter_in_reg__0\(0),
      I2 => \counter_in_reg__0\(2),
      I3 => \counter_in_reg__0\(1),
      O => \next_in_FC[13]_27\
    );
\in_FC[14][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => \counter_in_reg__0\(1),
      I1 => \counter_in_reg__0\(2),
      I2 => \counter_in_reg__0\(0),
      I3 => \in_FC[15][3]_i_2_n_0\,
      O => \next_in_FC[14]_7\
    );
\in_FC[15][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \counter_in_reg__0\(0),
      I1 => \counter_in_reg__0\(2),
      I2 => \counter_in_reg__0\(1),
      I3 => \in_FC[15][3]_i_2_n_0\,
      O => \next_in_FC[15]_4\
    );
\in_FC[15][3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => valid_data_in_del,
      I1 => curr_state_buf,
      I2 => \counter_in_reg__0\(3),
      I3 => \counter_in_reg__0\(4),
      O => \in_FC[15][3]_i_2_n_0\
    );
\in_FC[1][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \counter_in_reg__0\(0),
      I1 => \counter_in_reg__0\(2),
      I2 => \counter_in_reg__0\(1),
      I3 => \in_FC[7][3]_i_2_n_0\,
      O => \next_in_FC[1]_1\
    );
\in_FC[2][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \counter_in_reg__0\(2),
      I1 => \counter_in_reg__0\(1),
      I2 => \in_FC[7][3]_i_2_n_0\,
      I3 => \counter_in_reg__0\(0),
      O => \next_in_FC[2]_32\
    );
\in_FC[3][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \counter_in_reg__0\(0),
      I1 => \counter_in_reg__0\(1),
      I2 => \counter_in_reg__0\(2),
      I3 => \in_FC[7][3]_i_2_n_0\,
      O => \next_in_FC[3]_30\
    );
\in_FC[4][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \counter_in_reg__0\(1),
      I1 => \counter_in_reg__0\(2),
      I2 => \in_FC[7][3]_i_2_n_0\,
      I3 => \counter_in_reg__0\(0),
      O => \next_in_FC[4]_33\
    );
\in_FC[5][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \counter_in_reg__0\(0),
      I1 => \counter_in_reg__0\(2),
      I2 => \counter_in_reg__0\(1),
      I3 => \in_FC[7][3]_i_2_n_0\,
      O => \next_in_FC[5]_31\
    );
\in_FC[6][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \counter_in_reg__0\(1),
      I1 => \counter_in_reg__0\(2),
      I2 => \in_FC[7][3]_i_2_n_0\,
      I3 => \counter_in_reg__0\(0),
      O => \next_in_FC[6]_6\
    );
\in_FC[7][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \counter_in_reg__0\(0),
      I1 => \counter_in_reg__0\(2),
      I2 => \counter_in_reg__0\(1),
      I3 => \in_FC[7][3]_i_2_n_0\,
      O => \next_in_FC[7]_5\
    );
\in_FC[7][3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => valid_data_in_del,
      I1 => curr_state_buf,
      I2 => \counter_in_reg__0\(4),
      I3 => \counter_in_reg__0\(3),
      O => \in_FC[7][3]_i_2_n_0\
    );
\in_FC[8][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => \counter_in_reg__0\(1),
      I1 => \counter_in_reg__0\(2),
      I2 => \counter_in_reg__0\(0),
      I3 => \in_FC[15][3]_i_2_n_0\,
      O => \next_in_FC[8]_3\
    );
\in_FC[9][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \in_FC[15][3]_i_2_n_0\,
      I1 => \counter_in_reg__0\(0),
      I2 => \counter_in_reg__0\(2),
      I3 => \counter_in_reg__0\(1),
      O => \next_in_FC[9]_0\
    );
\in_FC_reg[0][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[0]_2\,
      CLR => AR(0),
      D => FC_input_del(0),
      Q => \in_FC_reg_n_0_[0][0]\
    );
\in_FC_reg[0][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[0]_2\,
      CLR => AR(0),
      D => FC_input_del(1),
      Q => \in_FC_reg_n_0_[0][1]\
    );
\in_FC_reg[0][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[0]_2\,
      CLR => AR(0),
      D => FC_input_del(2),
      Q => \in_FC_reg_n_0_[0][2]\
    );
\in_FC_reg[0][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[0]_2\,
      CLR => AR(0),
      D => FC_input_del(3),
      Q => \in_FC_reg_n_0_[0][3]\
    );
\in_FC_reg[10][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[10]_28\,
      CLR => AR(0),
      D => FC_input_del(0),
      Q => \in_FC_reg[10]\(0)
    );
\in_FC_reg[10][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[10]_28\,
      CLR => AR(0),
      D => FC_input_del(1),
      Q => \in_FC_reg[10]\(1)
    );
\in_FC_reg[10][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[10]_28\,
      CLR => AR(0),
      D => FC_input_del(2),
      Q => \in_FC_reg[10]\(2)
    );
\in_FC_reg[10][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[10]_28\,
      CLR => AR(0),
      D => FC_input_del(3),
      Q => \in_FC_reg[10]\(3)
    );
\in_FC_reg[11][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[11]_26\,
      CLR => AR(0),
      D => FC_input_del(0),
      Q => \in_FC_reg[11]\(0)
    );
\in_FC_reg[11][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[11]_26\,
      CLR => AR(0),
      D => FC_input_del(1),
      Q => \in_FC_reg[11]\(1)
    );
\in_FC_reg[11][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[11]_26\,
      CLR => AR(0),
      D => FC_input_del(2),
      Q => \in_FC_reg[11]\(2)
    );
\in_FC_reg[11][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[11]_26\,
      CLR => AR(0),
      D => FC_input_del(3),
      Q => \in_FC_reg[11]\(3)
    );
\in_FC_reg[12][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[12]_29\,
      CLR => AR(0),
      D => FC_input_del(0),
      Q => \in_FC_reg[12]\(0)
    );
\in_FC_reg[12][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[12]_29\,
      CLR => AR(0),
      D => FC_input_del(1),
      Q => \in_FC_reg[12]\(1)
    );
\in_FC_reg[12][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[12]_29\,
      CLR => AR(0),
      D => FC_input_del(2),
      Q => \in_FC_reg[12]\(2)
    );
\in_FC_reg[12][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[12]_29\,
      CLR => AR(0),
      D => FC_input_del(3),
      Q => \in_FC_reg[12]\(3)
    );
\in_FC_reg[13][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[13]_27\,
      CLR => AR(0),
      D => FC_input_del(0),
      Q => \in_FC_reg[13]\(0)
    );
\in_FC_reg[13][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[13]_27\,
      CLR => AR(0),
      D => FC_input_del(1),
      Q => \in_FC_reg[13]\(1)
    );
\in_FC_reg[13][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[13]_27\,
      CLR => AR(0),
      D => FC_input_del(2),
      Q => \in_FC_reg[13]\(2)
    );
\in_FC_reg[13][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[13]_27\,
      CLR => AR(0),
      D => FC_input_del(3),
      Q => \in_FC_reg[13]\(3)
    );
\in_FC_reg[14][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[14]_7\,
      CLR => AR(0),
      D => FC_input_del(0),
      Q => \in_FC_reg[14]\(0)
    );
\in_FC_reg[14][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[14]_7\,
      CLR => AR(0),
      D => FC_input_del(1),
      Q => \in_FC_reg[14]\(1)
    );
\in_FC_reg[14][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[14]_7\,
      CLR => AR(0),
      D => FC_input_del(2),
      Q => \in_FC_reg[14]\(2)
    );
\in_FC_reg[14][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[14]_7\,
      CLR => AR(0),
      D => FC_input_del(3),
      Q => \in_FC_reg[14]\(3)
    );
\in_FC_reg[15][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[15]_4\,
      CLR => AR(0),
      D => FC_input_del(0),
      Q => \in_FC_reg[15]\(0)
    );
\in_FC_reg[15][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[15]_4\,
      CLR => AR(0),
      D => FC_input_del(1),
      Q => \in_FC_reg[15]\(1)
    );
\in_FC_reg[15][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[15]_4\,
      CLR => AR(0),
      D => FC_input_del(2),
      Q => \in_FC_reg[15]\(2)
    );
\in_FC_reg[15][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[15]_4\,
      CLR => AR(0),
      D => FC_input_del(3),
      Q => \in_FC_reg[15]\(3)
    );
\in_FC_reg[1][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[1]_1\,
      CLR => AR(0),
      D => FC_input_del(0),
      Q => \in_FC_reg_n_0_[1][0]\
    );
\in_FC_reg[1][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[1]_1\,
      CLR => AR(0),
      D => FC_input_del(1),
      Q => \in_FC_reg_n_0_[1][1]\
    );
\in_FC_reg[1][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[1]_1\,
      CLR => AR(0),
      D => FC_input_del(2),
      Q => \in_FC_reg_n_0_[1][2]\
    );
\in_FC_reg[1][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[1]_1\,
      CLR => AR(0),
      D => FC_input_del(3),
      Q => \in_FC_reg_n_0_[1][3]\
    );
\in_FC_reg[2][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[2]_32\,
      CLR => AR(0),
      D => FC_input_del(0),
      Q => \in_FC_reg_n_0_[2][0]\
    );
\in_FC_reg[2][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[2]_32\,
      CLR => AR(0),
      D => FC_input_del(1),
      Q => \in_FC_reg_n_0_[2][1]\
    );
\in_FC_reg[2][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[2]_32\,
      CLR => AR(0),
      D => FC_input_del(2),
      Q => \in_FC_reg_n_0_[2][2]\
    );
\in_FC_reg[2][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[2]_32\,
      CLR => AR(0),
      D => FC_input_del(3),
      Q => \in_FC_reg_n_0_[2][3]\
    );
\in_FC_reg[3][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[3]_30\,
      CLR => AR(0),
      D => FC_input_del(0),
      Q => \in_FC_reg[3]\(0)
    );
\in_FC_reg[3][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[3]_30\,
      CLR => AR(0),
      D => FC_input_del(1),
      Q => \in_FC_reg[3]\(1)
    );
\in_FC_reg[3][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[3]_30\,
      CLR => AR(0),
      D => FC_input_del(2),
      Q => \in_FC_reg[3]\(2)
    );
\in_FC_reg[3][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[3]_30\,
      CLR => AR(0),
      D => FC_input_del(3),
      Q => \in_FC_reg[3]\(3)
    );
\in_FC_reg[4][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[4]_33\,
      CLR => AR(0),
      D => FC_input_del(0),
      Q => \in_FC_reg[4]\(0)
    );
\in_FC_reg[4][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[4]_33\,
      CLR => AR(0),
      D => FC_input_del(1),
      Q => \in_FC_reg[4]\(1)
    );
\in_FC_reg[4][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[4]_33\,
      CLR => AR(0),
      D => FC_input_del(2),
      Q => \in_FC_reg[4]\(2)
    );
\in_FC_reg[4][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[4]_33\,
      CLR => AR(0),
      D => FC_input_del(3),
      Q => \in_FC_reg[4]\(3)
    );
\in_FC_reg[5][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[5]_31\,
      CLR => AR(0),
      D => FC_input_del(0),
      Q => \in_FC_reg[5]\(0)
    );
\in_FC_reg[5][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[5]_31\,
      CLR => AR(0),
      D => FC_input_del(1),
      Q => \in_FC_reg[5]\(1)
    );
\in_FC_reg[5][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[5]_31\,
      CLR => AR(0),
      D => FC_input_del(2),
      Q => \in_FC_reg[5]\(2)
    );
\in_FC_reg[5][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[5]_31\,
      CLR => AR(0),
      D => FC_input_del(3),
      Q => \in_FC_reg[5]\(3)
    );
\in_FC_reg[6][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[6]_6\,
      CLR => AR(0),
      D => FC_input_del(0),
      Q => \in_FC_reg[6]\(0)
    );
\in_FC_reg[6][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[6]_6\,
      CLR => AR(0),
      D => FC_input_del(1),
      Q => \in_FC_reg[6]\(1)
    );
\in_FC_reg[6][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[6]_6\,
      CLR => AR(0),
      D => FC_input_del(2),
      Q => \in_FC_reg[6]\(2)
    );
\in_FC_reg[6][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[6]_6\,
      CLR => AR(0),
      D => FC_input_del(3),
      Q => \in_FC_reg[6]\(3)
    );
\in_FC_reg[7][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[7]_5\,
      CLR => AR(0),
      D => FC_input_del(0),
      Q => \in_FC_reg[7]\(0)
    );
\in_FC_reg[7][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[7]_5\,
      CLR => AR(0),
      D => FC_input_del(1),
      Q => \in_FC_reg[7]\(1)
    );
\in_FC_reg[7][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[7]_5\,
      CLR => AR(0),
      D => FC_input_del(2),
      Q => \in_FC_reg[7]\(2)
    );
\in_FC_reg[7][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[7]_5\,
      CLR => AR(0),
      D => FC_input_del(3),
      Q => \in_FC_reg[7]\(3)
    );
\in_FC_reg[8][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[8]_3\,
      CLR => AR(0),
      D => FC_input_del(0),
      Q => \in_FC_reg[8]\(0)
    );
\in_FC_reg[8][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[8]_3\,
      CLR => AR(0),
      D => FC_input_del(1),
      Q => \in_FC_reg[8]\(1)
    );
\in_FC_reg[8][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[8]_3\,
      CLR => AR(0),
      D => FC_input_del(2),
      Q => \in_FC_reg[8]\(2)
    );
\in_FC_reg[8][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[8]_3\,
      CLR => AR(0),
      D => FC_input_del(3),
      Q => \in_FC_reg[8]\(3)
    );
\in_FC_reg[9][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[9]_0\,
      CLR => AR(0),
      D => FC_input_del(0),
      Q => \in_FC_reg[9]\(0)
    );
\in_FC_reg[9][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[9]_0\,
      CLR => AR(0),
      D => FC_input_del(1),
      Q => \in_FC_reg[9]\(1)
    );
\in_FC_reg[9][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[9]_0\,
      CLR => AR(0),
      D => FC_input_del(2),
      Q => \in_FC_reg[9]\(2)
    );
\in_FC_reg[9][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_in_FC[9]_0\,
      CLR => AR(0),
      D => FC_input_del(3),
      Q => \in_FC_reg[9]\(3)
    );
\mul_FC[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \mul_FC[1]_i_5_n_0\,
      I1 => curr_state_access,
      I2 => \mul_FC[1]_i_2_n_0\,
      O => \mul_FC[0]_i_1_n_0\
    );
\mul_FC[1]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \in_FC_reg[15]\(1),
      I1 => \in_FC_reg[14]\(1),
      I2 => \counter_in_access_reg_n_0_[1]\,
      I3 => \in_FC_reg[13]\(1),
      I4 => \counter_in_access_reg_n_0_[0]\,
      I5 => \in_FC_reg[12]\(1),
      O => \mul_FC[1]_i_13_n_0\
    );
\mul_FC[1]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \in_FC_reg[11]\(1),
      I1 => \in_FC_reg[10]\(1),
      I2 => \counter_in_access_reg_n_0_[1]\,
      I3 => \in_FC_reg[9]\(1),
      I4 => \counter_in_access_reg_n_0_[0]\,
      I5 => \in_FC_reg[8]\(1),
      O => \mul_FC[1]_i_14_n_0\
    );
\mul_FC[1]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \in_FC_reg[3]\(1),
      I1 => \in_FC_reg_n_0_[2][1]\,
      I2 => \counter_in_access_reg_n_0_[1]\,
      I3 => \in_FC_reg_n_0_[1][1]\,
      I4 => \counter_in_access_reg_n_0_[0]\,
      I5 => \in_FC_reg_n_0_[0][1]\,
      O => \mul_FC[1]_i_15_n_0\
    );
\mul_FC[1]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \in_FC_reg[7]\(1),
      I1 => \in_FC_reg[6]\(1),
      I2 => \counter_in_access_reg_n_0_[1]\,
      I3 => \in_FC_reg[5]\(1),
      I4 => \counter_in_access_reg_n_0_[0]\,
      I5 => \in_FC_reg[4]\(1),
      O => \mul_FC[1]_i_16_n_0\
    );
\mul_FC[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4B440000"
    )
        port map (
      I0 => \mul_FC[1]_i_2_n_0\,
      I1 => \mul_FC[1]_i_3_n_0\,
      I2 => \mul_FC[1]_i_4_n_0\,
      I3 => \mul_FC[1]_i_5_n_0\,
      I4 => curr_state_access,
      O => \mul_FC[1]_i_1__0_n_0\
    );
\mul_FC[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"303F303F50505F5F"
    )
        port map (
      I0 => \mul_FC[1]_i_6_n_0\,
      I1 => \mul_FC[1]_i_7_n_0\,
      I2 => \counter_in_access_reg_n_0_[3]\,
      I3 => \mul_FC[1]_i_8_n_0\,
      I4 => \mul_FC[1]_i_9_n_0\,
      I5 => \counter_in_access_reg_n_0_[2]\,
      O => \mul_FC[1]_i_2_n_0\
    );
\mul_FC[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \mul_FC_reg[1]_i_10_n_0\,
      I1 => \counter_w_access_reg__0\(5),
      I2 => \mul_FC_reg[1]_i_11_n_0\,
      I3 => \counter_w_access_reg__0\(4),
      I4 => \mul_FC_reg[1]_i_12_n_0\,
      O => \mul_FC[1]_i_3_n_0\
    );
\mul_FC[1]_i_32\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[35]\(1),
      I1 => \w_FC_reg[34]\(1),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[33]\(1),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[32]\(1),
      O => \mul_FC[1]_i_32_n_0\
    );
\mul_FC[1]_i_33\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[39]\(1),
      I1 => \w_FC_reg[38]\(1),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[37]\(1),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[36]\(1),
      O => \mul_FC[1]_i_33_n_0\
    );
\mul_FC[1]_i_34\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[43]\(1),
      I1 => \w_FC_reg[42]\(1),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[41]\(1),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[40]\(1),
      O => \mul_FC[1]_i_34_n_0\
    );
\mul_FC[1]_i_35\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[47]\(1),
      I1 => \w_FC_reg[46]\(1),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[45]\(1),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[44]\(1),
      O => \mul_FC[1]_i_35_n_0\
    );
\mul_FC[1]_i_36\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[19]\(1),
      I1 => \w_FC_reg[18]\(1),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[17]\(1),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[16]\(1),
      O => \mul_FC[1]_i_36_n_0\
    );
\mul_FC[1]_i_37\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[23]\(1),
      I1 => \w_FC_reg[22]\(1),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[21]\(1),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[20]\(1),
      O => \mul_FC[1]_i_37_n_0\
    );
\mul_FC[1]_i_38\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[27]\(1),
      I1 => \w_FC_reg[26]\(1),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[25]\(1),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[24]\(1),
      O => \mul_FC[1]_i_38_n_0\
    );
\mul_FC[1]_i_39\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[31]\(1),
      I1 => \w_FC_reg[30]\(1),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[29]\(1),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[28]\(1),
      O => \mul_FC[1]_i_39_n_0\
    );
\mul_FC[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"50505F5F303F303F"
    )
        port map (
      I0 => \mul_FC[1]_i_13_n_0\,
      I1 => \mul_FC[1]_i_14_n_0\,
      I2 => \counter_in_access_reg_n_0_[3]\,
      I3 => \mul_FC[1]_i_15_n_0\,
      I4 => \mul_FC[1]_i_16_n_0\,
      I5 => \counter_in_access_reg_n_0_[2]\,
      O => \mul_FC[1]_i_4_n_0\
    );
\mul_FC[1]_i_40\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[3]\(1),
      I1 => \w_FC_reg_n_0_[2][1]\,
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg_n_0_[1][1]\,
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg_n_0_[0][1]\,
      O => \mul_FC[1]_i_40_n_0\
    );
\mul_FC[1]_i_41\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[7]\(1),
      I1 => \w_FC_reg[6]\(1),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[5]\(1),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[4]\(1),
      O => \mul_FC[1]_i_41_n_0\
    );
\mul_FC[1]_i_42\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[11]\(1),
      I1 => \w_FC_reg[10]\(1),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[9]\(1),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[8]\(1),
      O => \mul_FC[1]_i_42_n_0\
    );
\mul_FC[1]_i_43\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[15]\(1),
      I1 => \w_FC_reg[14]\(1),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[13]\(1),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[12]\(1),
      O => \mul_FC[1]_i_43_n_0\
    );
\mul_FC[1]_i_44\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[35]\(0),
      I1 => \w_FC_reg[34]\(0),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[33]\(0),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[32]\(0),
      O => \mul_FC[1]_i_44_n_0\
    );
\mul_FC[1]_i_45\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[39]\(0),
      I1 => \w_FC_reg[38]\(0),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[37]\(0),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[36]\(0),
      O => \mul_FC[1]_i_45_n_0\
    );
\mul_FC[1]_i_46\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[43]\(0),
      I1 => \w_FC_reg[42]\(0),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[41]\(0),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[40]\(0),
      O => \mul_FC[1]_i_46_n_0\
    );
\mul_FC[1]_i_47\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[47]\(0),
      I1 => \w_FC_reg[46]\(0),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[45]\(0),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[44]\(0),
      O => \mul_FC[1]_i_47_n_0\
    );
\mul_FC[1]_i_48\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[19]\(0),
      I1 => \w_FC_reg[18]\(0),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[17]\(0),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[16]\(0),
      O => \mul_FC[1]_i_48_n_0\
    );
\mul_FC[1]_i_49\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[23]\(0),
      I1 => \w_FC_reg[22]\(0),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[21]\(0),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[20]\(0),
      O => \mul_FC[1]_i_49_n_0\
    );
\mul_FC[1]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \mul_FC_reg[1]_i_17_n_0\,
      I1 => \counter_w_access_reg__0\(5),
      I2 => \mul_FC_reg[1]_i_18_n_0\,
      I3 => \counter_w_access_reg__0\(4),
      I4 => \mul_FC_reg[1]_i_19_n_0\,
      O => \mul_FC[1]_i_5_n_0\
    );
\mul_FC[1]_i_50\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[27]\(0),
      I1 => \w_FC_reg[26]\(0),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[25]\(0),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[24]\(0),
      O => \mul_FC[1]_i_50_n_0\
    );
\mul_FC[1]_i_51\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[31]\(0),
      I1 => \w_FC_reg[30]\(0),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[29]\(0),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[28]\(0),
      O => \mul_FC[1]_i_51_n_0\
    );
\mul_FC[1]_i_52\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[3]\(0),
      I1 => \w_FC_reg_n_0_[2][0]\,
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg_n_0_[1][0]\,
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg_n_0_[0][0]\,
      O => \mul_FC[1]_i_52_n_0\
    );
\mul_FC[1]_i_53\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[7]\(0),
      I1 => \w_FC_reg[6]\(0),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[5]\(0),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[4]\(0),
      O => \mul_FC[1]_i_53_n_0\
    );
\mul_FC[1]_i_54\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[11]\(0),
      I1 => \w_FC_reg[10]\(0),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[9]\(0),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[8]\(0),
      O => \mul_FC[1]_i_54_n_0\
    );
\mul_FC[1]_i_55\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[15]\(0),
      I1 => \w_FC_reg[14]\(0),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[13]\(0),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[12]\(0),
      O => \mul_FC[1]_i_55_n_0\
    );
\mul_FC[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \in_FC_reg[11]\(0),
      I1 => \in_FC_reg[10]\(0),
      I2 => \counter_in_access_reg_n_0_[1]\,
      I3 => \in_FC_reg[9]\(0),
      I4 => \counter_in_access_reg_n_0_[0]\,
      I5 => \in_FC_reg[8]\(0),
      O => \mul_FC[1]_i_6_n_0\
    );
\mul_FC[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \in_FC_reg[15]\(0),
      I1 => \in_FC_reg[14]\(0),
      I2 => \counter_in_access_reg_n_0_[1]\,
      I3 => \in_FC_reg[13]\(0),
      I4 => \counter_in_access_reg_n_0_[0]\,
      I5 => \in_FC_reg[12]\(0),
      O => \mul_FC[1]_i_7_n_0\
    );
\mul_FC[1]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \in_FC_reg[7]\(0),
      I1 => \in_FC_reg[6]\(0),
      I2 => \counter_in_access_reg_n_0_[1]\,
      I3 => \in_FC_reg[5]\(0),
      I4 => \counter_in_access_reg_n_0_[0]\,
      I5 => \in_FC_reg[4]\(0),
      O => \mul_FC[1]_i_8_n_0\
    );
\mul_FC[1]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \in_FC_reg[3]\(0),
      I1 => \in_FC_reg_n_0_[2][0]\,
      I2 => \counter_in_access_reg_n_0_[1]\,
      I3 => \in_FC_reg_n_0_[1][0]\,
      I4 => \counter_in_access_reg_n_0_[0]\,
      I5 => \in_FC_reg_n_0_[0][0]\,
      O => \mul_FC[1]_i_9_n_0\
    );
\mul_FC[2]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => curr_state_access,
      I1 => next_mul_FC0(2),
      O => \mul_FC[2]_i_1__0_n_0\
    );
\mul_FC[3]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => curr_state_access,
      I1 => next_mul_FC0(3),
      O => \mul_FC[3]_i_1__0_n_0\
    );
\mul_FC[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => curr_state_access,
      I1 => next_mul_FC0(4),
      O => \mul_FC[4]_i_1_n_0\
    );
\mul_FC[5]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => curr_state_access,
      I1 => next_mul_FC0(5),
      O => \mul_FC[5]_i_1__0_n_0\
    );
\mul_FC[6]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => curr_state_access,
      I1 => next_mul_FC0(6),
      O => \mul_FC[6]_i_1__0_n_0\
    );
\mul_FC[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state_access,
      I1 => \next_mul_FC0__0_carry__0_n_2\,
      O => \mul_FC[7]_i_1_n_0\
    );
\mul_FC_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \mul_FC[0]_i_1_n_0\,
      Q => \^q\(0)
    );
\mul_FC_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \mul_FC[1]_i_1__0_n_0\,
      Q => \^q\(1)
    );
\mul_FC_reg[1]_i_10\: unisim.vcomponents.MUXF8
     port map (
      I0 => \mul_FC_reg[1]_i_20_n_0\,
      I1 => \mul_FC_reg[1]_i_21_n_0\,
      O => \mul_FC_reg[1]_i_10_n_0\,
      S => \counter_w_access_reg__0\(3)
    );
\mul_FC_reg[1]_i_11\: unisim.vcomponents.MUXF8
     port map (
      I0 => \mul_FC_reg[1]_i_22_n_0\,
      I1 => \mul_FC_reg[1]_i_23_n_0\,
      O => \mul_FC_reg[1]_i_11_n_0\,
      S => \counter_w_access_reg__0\(3)
    );
\mul_FC_reg[1]_i_12\: unisim.vcomponents.MUXF8
     port map (
      I0 => \mul_FC_reg[1]_i_24_n_0\,
      I1 => \mul_FC_reg[1]_i_25_n_0\,
      O => \mul_FC_reg[1]_i_12_n_0\,
      S => \counter_w_access_reg__0\(3)
    );
\mul_FC_reg[1]_i_17\: unisim.vcomponents.MUXF8
     port map (
      I0 => \mul_FC_reg[1]_i_26_n_0\,
      I1 => \mul_FC_reg[1]_i_27_n_0\,
      O => \mul_FC_reg[1]_i_17_n_0\,
      S => \counter_w_access_reg__0\(3)
    );
\mul_FC_reg[1]_i_18\: unisim.vcomponents.MUXF8
     port map (
      I0 => \mul_FC_reg[1]_i_28_n_0\,
      I1 => \mul_FC_reg[1]_i_29_n_0\,
      O => \mul_FC_reg[1]_i_18_n_0\,
      S => \counter_w_access_reg__0\(3)
    );
\mul_FC_reg[1]_i_19\: unisim.vcomponents.MUXF8
     port map (
      I0 => \mul_FC_reg[1]_i_30_n_0\,
      I1 => \mul_FC_reg[1]_i_31_n_0\,
      O => \mul_FC_reg[1]_i_19_n_0\,
      S => \counter_w_access_reg__0\(3)
    );
\mul_FC_reg[1]_i_20\: unisim.vcomponents.MUXF7
     port map (
      I0 => \mul_FC[1]_i_32_n_0\,
      I1 => \mul_FC[1]_i_33_n_0\,
      O => \mul_FC_reg[1]_i_20_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\mul_FC_reg[1]_i_21\: unisim.vcomponents.MUXF7
     port map (
      I0 => \mul_FC[1]_i_34_n_0\,
      I1 => \mul_FC[1]_i_35_n_0\,
      O => \mul_FC_reg[1]_i_21_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\mul_FC_reg[1]_i_22\: unisim.vcomponents.MUXF7
     port map (
      I0 => \mul_FC[1]_i_36_n_0\,
      I1 => \mul_FC[1]_i_37_n_0\,
      O => \mul_FC_reg[1]_i_22_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\mul_FC_reg[1]_i_23\: unisim.vcomponents.MUXF7
     port map (
      I0 => \mul_FC[1]_i_38_n_0\,
      I1 => \mul_FC[1]_i_39_n_0\,
      O => \mul_FC_reg[1]_i_23_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\mul_FC_reg[1]_i_24\: unisim.vcomponents.MUXF7
     port map (
      I0 => \mul_FC[1]_i_40_n_0\,
      I1 => \mul_FC[1]_i_41_n_0\,
      O => \mul_FC_reg[1]_i_24_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\mul_FC_reg[1]_i_25\: unisim.vcomponents.MUXF7
     port map (
      I0 => \mul_FC[1]_i_42_n_0\,
      I1 => \mul_FC[1]_i_43_n_0\,
      O => \mul_FC_reg[1]_i_25_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\mul_FC_reg[1]_i_26\: unisim.vcomponents.MUXF7
     port map (
      I0 => \mul_FC[1]_i_44_n_0\,
      I1 => \mul_FC[1]_i_45_n_0\,
      O => \mul_FC_reg[1]_i_26_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\mul_FC_reg[1]_i_27\: unisim.vcomponents.MUXF7
     port map (
      I0 => \mul_FC[1]_i_46_n_0\,
      I1 => \mul_FC[1]_i_47_n_0\,
      O => \mul_FC_reg[1]_i_27_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\mul_FC_reg[1]_i_28\: unisim.vcomponents.MUXF7
     port map (
      I0 => \mul_FC[1]_i_48_n_0\,
      I1 => \mul_FC[1]_i_49_n_0\,
      O => \mul_FC_reg[1]_i_28_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\mul_FC_reg[1]_i_29\: unisim.vcomponents.MUXF7
     port map (
      I0 => \mul_FC[1]_i_50_n_0\,
      I1 => \mul_FC[1]_i_51_n_0\,
      O => \mul_FC_reg[1]_i_29_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\mul_FC_reg[1]_i_30\: unisim.vcomponents.MUXF7
     port map (
      I0 => \mul_FC[1]_i_52_n_0\,
      I1 => \mul_FC[1]_i_53_n_0\,
      O => \mul_FC_reg[1]_i_30_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\mul_FC_reg[1]_i_31\: unisim.vcomponents.MUXF7
     port map (
      I0 => \mul_FC[1]_i_54_n_0\,
      I1 => \mul_FC[1]_i_55_n_0\,
      O => \mul_FC_reg[1]_i_31_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\mul_FC_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \mul_FC[2]_i_1__0_n_0\,
      Q => \^q\(2)
    );
\mul_FC_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \mul_FC[3]_i_1__0_n_0\,
      Q => \^q\(3)
    );
\mul_FC_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \mul_FC[4]_i_1_n_0\,
      Q => \^q\(4)
    );
\mul_FC_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \mul_FC[5]_i_1__0_n_0\,
      Q => \^q\(5)
    );
\mul_FC_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \mul_FC[6]_i_1__0_n_0\,
      Q => \^q\(6)
    );
\mul_FC_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \mul_FC[7]_i_1_n_0\,
      Q => \^q\(7)
    );
\next_mul_FC0__0_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \next_mul_FC0__0_carry_n_0\,
      CO(2) => \next_mul_FC0__0_carry_n_1\,
      CO(1) => \next_mul_FC0__0_carry_n_2\,
      CO(0) => \next_mul_FC0__0_carry_n_3\,
      CYINIT => '0',
      DI(3) => \next_mul_FC0__0_carry_i_1_n_0\,
      DI(2) => \next_mul_FC0__0_carry_i_2_n_0\,
      DI(1) => \next_mul_FC0__0_carry_i_3_n_0\,
      DI(0) => '0',
      O(3 downto 0) => next_mul_FC0(5 downto 2),
      S(3) => \next_mul_FC0__0_carry_i_4_n_0\,
      S(2) => \next_mul_FC0__0_carry_i_5_n_0\,
      S(1) => \next_mul_FC0__0_carry_i_6_n_0\,
      S(0) => \next_mul_FC0__0_carry_i_7_n_0\
    );
\next_mul_FC0__0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_mul_FC0__0_carry_n_0\,
      CO(3 downto 2) => \NLW_next_mul_FC0__0_carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \next_mul_FC0__0_carry__0_n_2\,
      CO(0) => \NLW_next_mul_FC0__0_carry__0_CO_UNCONNECTED\(0),
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \next_mul_FC0__0_carry__0_i_1_n_0\,
      O(3 downto 1) => \NLW_next_mul_FC0__0_carry__0_O_UNCONNECTED\(3 downto 1),
      O(0) => next_mul_FC0(6),
      S(3 downto 1) => B"001",
      S(0) => \next_mul_FC0__0_carry__0_i_2_n_0\
    );
\next_mul_FC0__0_carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B0"
    )
        port map (
      I0 => \next_mul_FC0__0_carry_i_14_n_0\,
      I1 => \next_mul_FC0__0_carry_i_13_n_0\,
      I2 => \next_mul_FC0__0_carry_i_15_n_0\,
      O => \next_mul_FC0__0_carry__0_i_1_n_0\
    );
\next_mul_FC0__0_carry__0_i_10\: unisim.vcomponents.MUXF8
     port map (
      I0 => \next_mul_FC0__0_carry__0_i_19_n_0\,
      I1 => \next_mul_FC0__0_carry__0_i_20_n_0\,
      O => \next_mul_FC0__0_carry__0_i_10_n_0\,
      S => \counter_w_access_reg__0\(3)
    );
\next_mul_FC0__0_carry__0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"05F5030305F5F3F3"
    )
        port map (
      I0 => \in_FC_reg_n_0_[1][3]\,
      I1 => \in_FC_reg_n_0_[0][3]\,
      I2 => \counter_in_access_reg_n_0_[1]\,
      I3 => \in_FC_reg[3]\(3),
      I4 => \counter_in_access_reg_n_0_[0]\,
      I5 => \in_FC_reg_n_0_[2][3]\,
      O => \next_mul_FC0__0_carry__0_i_11_n_0\
    );
\next_mul_FC0__0_carry__0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"05F5030305F5F3F3"
    )
        port map (
      I0 => \in_FC_reg[5]\(3),
      I1 => \in_FC_reg[4]\(3),
      I2 => \counter_in_access_reg_n_0_[1]\,
      I3 => \in_FC_reg[7]\(3),
      I4 => \counter_in_access_reg_n_0_[0]\,
      I5 => \in_FC_reg[6]\(3),
      O => \next_mul_FC0__0_carry__0_i_12_n_0\
    );
\next_mul_FC0__0_carry__0_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"05F5030305F5F3F3"
    )
        port map (
      I0 => \in_FC_reg[9]\(3),
      I1 => \in_FC_reg[8]\(3),
      I2 => \counter_in_access_reg_n_0_[1]\,
      I3 => \in_FC_reg[11]\(3),
      I4 => \counter_in_access_reg_n_0_[0]\,
      I5 => \in_FC_reg[10]\(3),
      O => \next_mul_FC0__0_carry__0_i_13_n_0\
    );
\next_mul_FC0__0_carry__0_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"05F5030305F5F3F3"
    )
        port map (
      I0 => \in_FC_reg[13]\(3),
      I1 => \in_FC_reg[12]\(3),
      I2 => \counter_in_access_reg_n_0_[1]\,
      I3 => \in_FC_reg[15]\(3),
      I4 => \counter_in_access_reg_n_0_[0]\,
      I5 => \in_FC_reg[14]\(3),
      O => \next_mul_FC0__0_carry__0_i_14_n_0\
    );
\next_mul_FC0__0_carry__0_i_15\: unisim.vcomponents.MUXF7
     port map (
      I0 => \next_mul_FC0__0_carry__0_i_21_n_0\,
      I1 => \next_mul_FC0__0_carry__0_i_22_n_0\,
      O => \next_mul_FC0__0_carry__0_i_15_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\next_mul_FC0__0_carry__0_i_16\: unisim.vcomponents.MUXF7
     port map (
      I0 => \next_mul_FC0__0_carry__0_i_23_n_0\,
      I1 => \next_mul_FC0__0_carry__0_i_24_n_0\,
      O => \next_mul_FC0__0_carry__0_i_16_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\next_mul_FC0__0_carry__0_i_17\: unisim.vcomponents.MUXF7
     port map (
      I0 => \next_mul_FC0__0_carry__0_i_25_n_0\,
      I1 => \next_mul_FC0__0_carry__0_i_26_n_0\,
      O => \next_mul_FC0__0_carry__0_i_17_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\next_mul_FC0__0_carry__0_i_18\: unisim.vcomponents.MUXF7
     port map (
      I0 => \next_mul_FC0__0_carry__0_i_27_n_0\,
      I1 => \next_mul_FC0__0_carry__0_i_28_n_0\,
      O => \next_mul_FC0__0_carry__0_i_18_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\next_mul_FC0__0_carry__0_i_19\: unisim.vcomponents.MUXF7
     port map (
      I0 => \next_mul_FC0__0_carry__0_i_29_n_0\,
      I1 => \next_mul_FC0__0_carry__0_i_30_n_0\,
      O => \next_mul_FC0__0_carry__0_i_19_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\next_mul_FC0__0_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCF3CFDFCFFFFF2F"
    )
        port map (
      I0 => \mul_FC[1]_i_3_n_0\,
      I1 => \next_mul_FC0__0_carry__0_i_3_n_0\,
      I2 => \next_mul_FC0__0_carry__0_i_4_n_0\,
      I3 => \next_mul_FC0__0_carry_i_14_n_0\,
      I4 => \next_mul_FC0__0_carry_i_13_n_0\,
      I5 => \next_mul_FC0__0_carry__0_i_5_n_0\,
      O => \next_mul_FC0__0_carry__0_i_2_n_0\
    );
\next_mul_FC0__0_carry__0_i_20\: unisim.vcomponents.MUXF7
     port map (
      I0 => \next_mul_FC0__0_carry__0_i_31_n_0\,
      I1 => \next_mul_FC0__0_carry__0_i_32_n_0\,
      O => \next_mul_FC0__0_carry__0_i_20_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\next_mul_FC0__0_carry__0_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[35]\(2),
      I1 => \w_FC_reg[34]\(2),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[33]\(2),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[32]\(2),
      O => \next_mul_FC0__0_carry__0_i_21_n_0\
    );
\next_mul_FC0__0_carry__0_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[39]\(2),
      I1 => \w_FC_reg[38]\(2),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[37]\(2),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[36]\(2),
      O => \next_mul_FC0__0_carry__0_i_22_n_0\
    );
\next_mul_FC0__0_carry__0_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[43]\(2),
      I1 => \w_FC_reg[42]\(2),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[41]\(2),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[40]\(2),
      O => \next_mul_FC0__0_carry__0_i_23_n_0\
    );
\next_mul_FC0__0_carry__0_i_24\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[47]\(2),
      I1 => \w_FC_reg[46]\(2),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[45]\(2),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[44]\(2),
      O => \next_mul_FC0__0_carry__0_i_24_n_0\
    );
\next_mul_FC0__0_carry__0_i_25\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[19]\(2),
      I1 => \w_FC_reg[18]\(2),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[17]\(2),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[16]\(2),
      O => \next_mul_FC0__0_carry__0_i_25_n_0\
    );
\next_mul_FC0__0_carry__0_i_26\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[23]\(2),
      I1 => \w_FC_reg[22]\(2),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[21]\(2),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[20]\(2),
      O => \next_mul_FC0__0_carry__0_i_26_n_0\
    );
\next_mul_FC0__0_carry__0_i_27\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[27]\(2),
      I1 => \w_FC_reg[26]\(2),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[25]\(2),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[24]\(2),
      O => \next_mul_FC0__0_carry__0_i_27_n_0\
    );
\next_mul_FC0__0_carry__0_i_28\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[31]\(2),
      I1 => \w_FC_reg[30]\(2),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[29]\(2),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[28]\(2),
      O => \next_mul_FC0__0_carry__0_i_28_n_0\
    );
\next_mul_FC0__0_carry__0_i_29\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[3]\(2),
      I1 => \w_FC_reg_n_0_[2][2]\,
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg_n_0_[1][2]\,
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg_n_0_[0][2]\,
      O => \next_mul_FC0__0_carry__0_i_29_n_0\
    );
\next_mul_FC0__0_carry__0_i_3\: unisim.vcomponents.MUXF8
     port map (
      I0 => \next_mul_FC0__0_carry__0_i_6_n_0\,
      I1 => \next_mul_FC0__0_carry__0_i_7_n_0\,
      O => \next_mul_FC0__0_carry__0_i_3_n_0\,
      S => \counter_in_access_reg_n_0_[3]\
    );
\next_mul_FC0__0_carry__0_i_30\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[7]\(2),
      I1 => \w_FC_reg[6]\(2),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[5]\(2),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[4]\(2),
      O => \next_mul_FC0__0_carry__0_i_30_n_0\
    );
\next_mul_FC0__0_carry__0_i_31\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[11]\(2),
      I1 => \w_FC_reg[10]\(2),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[9]\(2),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[8]\(2),
      O => \next_mul_FC0__0_carry__0_i_31_n_0\
    );
\next_mul_FC0__0_carry__0_i_32\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[15]\(2),
      I1 => \w_FC_reg[14]\(2),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[13]\(2),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[12]\(2),
      O => \next_mul_FC0__0_carry__0_i_32_n_0\
    );
\next_mul_FC0__0_carry__0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \next_mul_FC0__0_carry__0_i_8_n_0\,
      I1 => \counter_w_access_reg__0\(5),
      I2 => \next_mul_FC0__0_carry__0_i_9_n_0\,
      I3 => \counter_w_access_reg__0\(4),
      I4 => \next_mul_FC0__0_carry__0_i_10_n_0\,
      O => \next_mul_FC0__0_carry__0_i_4_n_0\
    );
\next_mul_FC0__0_carry__0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFD4D400"
    )
        port map (
      I0 => \next_mul_FC0__0_carry_i_8_n_0\,
      I1 => \next_mul_FC0__0_carry_i_9_n_0\,
      I2 => \next_mul_FC0__0_carry_i_10_n_0\,
      I3 => \next_mul_FC0__0_carry_i_11_n_0\,
      I4 => \next_mul_FC0__0_carry_i_12_n_0\,
      O => \next_mul_FC0__0_carry__0_i_5_n_0\
    );
\next_mul_FC0__0_carry__0_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \next_mul_FC0__0_carry__0_i_11_n_0\,
      I1 => \next_mul_FC0__0_carry__0_i_12_n_0\,
      O => \next_mul_FC0__0_carry__0_i_6_n_0\,
      S => \counter_in_access_reg_n_0_[2]\
    );
\next_mul_FC0__0_carry__0_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \next_mul_FC0__0_carry__0_i_13_n_0\,
      I1 => \next_mul_FC0__0_carry__0_i_14_n_0\,
      O => \next_mul_FC0__0_carry__0_i_7_n_0\,
      S => \counter_in_access_reg_n_0_[2]\
    );
\next_mul_FC0__0_carry__0_i_8\: unisim.vcomponents.MUXF8
     port map (
      I0 => \next_mul_FC0__0_carry__0_i_15_n_0\,
      I1 => \next_mul_FC0__0_carry__0_i_16_n_0\,
      O => \next_mul_FC0__0_carry__0_i_8_n_0\,
      S => \counter_w_access_reg__0\(3)
    );
\next_mul_FC0__0_carry__0_i_9\: unisim.vcomponents.MUXF8
     port map (
      I0 => \next_mul_FC0__0_carry__0_i_17_n_0\,
      I1 => \next_mul_FC0__0_carry__0_i_18_n_0\,
      O => \next_mul_FC0__0_carry__0_i_9_n_0\,
      S => \counter_w_access_reg__0\(3)
    );
\next_mul_FC0__0_carry_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2BD4D42B"
    )
        port map (
      I0 => \next_mul_FC0__0_carry_i_8_n_0\,
      I1 => \next_mul_FC0__0_carry_i_9_n_0\,
      I2 => \next_mul_FC0__0_carry_i_10_n_0\,
      I3 => \next_mul_FC0__0_carry_i_11_n_0\,
      I4 => \next_mul_FC0__0_carry_i_12_n_0\,
      O => \next_mul_FC0__0_carry_i_1_n_0\
    );
\next_mul_FC0__0_carry_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44B444B4BB4B44B4"
    )
        port map (
      I0 => \next_mul_FC0__0_carry__0_i_3_n_0\,
      I1 => \mul_FC[1]_i_5_n_0\,
      I2 => \next_mul_FC0__0_carry__0_i_4_n_0\,
      I3 => \mul_FC[1]_i_4_n_0\,
      I4 => \mul_FC[1]_i_3_n_0\,
      I5 => \next_mul_FC0__0_carry_i_14_n_0\,
      O => \next_mul_FC0__0_carry_i_10_n_0\
    );
\next_mul_FC0__0_carry_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F2FF2022F2FFF2FF"
    )
        port map (
      I0 => \mul_FC[1]_i_5_n_0\,
      I1 => \next_mul_FC0__0_carry__0_i_3_n_0\,
      I2 => \next_mul_FC0__0_carry_i_14_n_0\,
      I3 => \mul_FC[1]_i_3_n_0\,
      I4 => \mul_FC[1]_i_4_n_0\,
      I5 => \next_mul_FC0__0_carry__0_i_4_n_0\,
      O => \next_mul_FC0__0_carry_i_11_n_0\
    );
\next_mul_FC0__0_carry_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => \next_mul_FC0__0_carry_i_17_n_0\,
      I1 => \next_mul_FC0__0_carry__0_i_3_n_0\,
      I2 => \mul_FC[1]_i_3_n_0\,
      O => \next_mul_FC0__0_carry_i_12_n_0\
    );
\next_mul_FC0__0_carry_i_13\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \next_mul_FC0__0_carry_i_18_n_0\,
      I1 => \counter_w_access_reg__0\(5),
      I2 => \next_mul_FC0__0_carry_i_19_n_0\,
      I3 => \counter_w_access_reg__0\(4),
      I4 => \next_mul_FC0__0_carry_i_20_n_0\,
      O => \next_mul_FC0__0_carry_i_13_n_0\
    );
\next_mul_FC0__0_carry_i_14\: unisim.vcomponents.MUXF8
     port map (
      I0 => \next_mul_FC0__0_carry_i_21_n_0\,
      I1 => \next_mul_FC0__0_carry_i_22_n_0\,
      O => \next_mul_FC0__0_carry_i_14_n_0\,
      S => \counter_in_access_reg_n_0_[3]\
    );
\next_mul_FC0__0_carry_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"566A6A6A5656566A"
    )
        port map (
      I0 => \next_mul_FC0__0_carry_i_23_n_0\,
      I1 => \next_mul_FC0__0_carry_i_12_n_0\,
      I2 => \next_mul_FC0__0_carry_i_11_n_0\,
      I3 => \next_mul_FC0__0_carry_i_10_n_0\,
      I4 => \next_mul_FC0__0_carry_i_9_n_0\,
      I5 => \next_mul_FC0__0_carry_i_8_n_0\,
      O => \next_mul_FC0__0_carry_i_15_n_0\
    );
\next_mul_FC0__0_carry_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22D2"
    )
        port map (
      I0 => \mul_FC[1]_i_3_n_0\,
      I1 => \mul_FC[1]_i_4_n_0\,
      I2 => \next_mul_FC0__0_carry__0_i_4_n_0\,
      I3 => \mul_FC[1]_i_2_n_0\,
      O => \next_mul_FC0__0_carry_i_16_n_0\
    );
\next_mul_FC0__0_carry_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \next_mul_FC0__0_carry__0_i_10_n_0\,
      I1 => \counter_w_access_reg__0\(4),
      I2 => \next_mul_FC0__0_carry__0_i_9_n_0\,
      I3 => \counter_w_access_reg__0\(5),
      I4 => \next_mul_FC0__0_carry__0_i_8_n_0\,
      I5 => \next_mul_FC0__0_carry_i_14_n_0\,
      O => \next_mul_FC0__0_carry_i_17_n_0\
    );
\next_mul_FC0__0_carry_i_18\: unisim.vcomponents.MUXF8
     port map (
      I0 => \next_mul_FC0__0_carry_i_24_n_0\,
      I1 => \next_mul_FC0__0_carry_i_25_n_0\,
      O => \next_mul_FC0__0_carry_i_18_n_0\,
      S => \counter_w_access_reg__0\(3)
    );
\next_mul_FC0__0_carry_i_19\: unisim.vcomponents.MUXF8
     port map (
      I0 => \next_mul_FC0__0_carry_i_26_n_0\,
      I1 => \next_mul_FC0__0_carry_i_27_n_0\,
      O => \next_mul_FC0__0_carry_i_19_n_0\,
      S => \counter_w_access_reg__0\(3)
    );
\next_mul_FC0__0_carry_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \next_mul_FC0__0_carry_i_1_n_0\,
      O => \next_mul_FC0__0_carry_i_2_n_0\
    );
\next_mul_FC0__0_carry_i_20\: unisim.vcomponents.MUXF8
     port map (
      I0 => \next_mul_FC0__0_carry_i_28_n_0\,
      I1 => \next_mul_FC0__0_carry_i_29_n_0\,
      O => \next_mul_FC0__0_carry_i_20_n_0\,
      S => \counter_w_access_reg__0\(3)
    );
\next_mul_FC0__0_carry_i_21\: unisim.vcomponents.MUXF7
     port map (
      I0 => \next_mul_FC0__0_carry_i_30_n_0\,
      I1 => \next_mul_FC0__0_carry_i_31_n_0\,
      O => \next_mul_FC0__0_carry_i_21_n_0\,
      S => \counter_in_access_reg_n_0_[2]\
    );
\next_mul_FC0__0_carry_i_22\: unisim.vcomponents.MUXF7
     port map (
      I0 => \next_mul_FC0__0_carry_i_32_n_0\,
      I1 => \next_mul_FC0__0_carry_i_33_n_0\,
      O => \next_mul_FC0__0_carry_i_22_n_0\,
      S => \counter_in_access_reg_n_0_[2]\
    );
\next_mul_FC0__0_carry_i_23\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3E00"
    )
        port map (
      I0 => \mul_FC[1]_i_3_n_0\,
      I1 => \next_mul_FC0__0_carry_i_14_n_0\,
      I2 => \next_mul_FC0__0_carry__0_i_3_n_0\,
      I3 => \next_mul_FC0__0_carry__0_i_4_n_0\,
      O => \next_mul_FC0__0_carry_i_23_n_0\
    );
\next_mul_FC0__0_carry_i_24\: unisim.vcomponents.MUXF7
     port map (
      I0 => \next_mul_FC0__0_carry_i_34_n_0\,
      I1 => \next_mul_FC0__0_carry_i_35_n_0\,
      O => \next_mul_FC0__0_carry_i_24_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\next_mul_FC0__0_carry_i_25\: unisim.vcomponents.MUXF7
     port map (
      I0 => \next_mul_FC0__0_carry_i_36_n_0\,
      I1 => \next_mul_FC0__0_carry_i_37_n_0\,
      O => \next_mul_FC0__0_carry_i_25_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\next_mul_FC0__0_carry_i_26\: unisim.vcomponents.MUXF7
     port map (
      I0 => \next_mul_FC0__0_carry_i_38_n_0\,
      I1 => \next_mul_FC0__0_carry_i_39_n_0\,
      O => \next_mul_FC0__0_carry_i_26_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\next_mul_FC0__0_carry_i_27\: unisim.vcomponents.MUXF7
     port map (
      I0 => \next_mul_FC0__0_carry_i_40_n_0\,
      I1 => \next_mul_FC0__0_carry_i_41_n_0\,
      O => \next_mul_FC0__0_carry_i_27_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\next_mul_FC0__0_carry_i_28\: unisim.vcomponents.MUXF7
     port map (
      I0 => \next_mul_FC0__0_carry_i_42_n_0\,
      I1 => \next_mul_FC0__0_carry_i_43_n_0\,
      O => \next_mul_FC0__0_carry_i_28_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\next_mul_FC0__0_carry_i_29\: unisim.vcomponents.MUXF7
     port map (
      I0 => \next_mul_FC0__0_carry_i_44_n_0\,
      I1 => \next_mul_FC0__0_carry_i_45_n_0\,
      O => \next_mul_FC0__0_carry_i_29_n_0\,
      S => \counter_w_access_reg__0\(2)
    );
\next_mul_FC0__0_carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \mul_FC[1]_i_2_n_0\,
      I1 => \next_mul_FC0__0_carry_i_13_n_0\,
      O => \next_mul_FC0__0_carry_i_3_n_0\
    );
\next_mul_FC0__0_carry_i_30\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"05F5030305F5F3F3"
    )
        port map (
      I0 => \in_FC_reg_n_0_[1][2]\,
      I1 => \in_FC_reg_n_0_[0][2]\,
      I2 => \counter_in_access_reg_n_0_[1]\,
      I3 => \in_FC_reg[3]\(2),
      I4 => \counter_in_access_reg_n_0_[0]\,
      I5 => \in_FC_reg_n_0_[2][2]\,
      O => \next_mul_FC0__0_carry_i_30_n_0\
    );
\next_mul_FC0__0_carry_i_31\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"05F5030305F5F3F3"
    )
        port map (
      I0 => \in_FC_reg[5]\(2),
      I1 => \in_FC_reg[4]\(2),
      I2 => \counter_in_access_reg_n_0_[1]\,
      I3 => \in_FC_reg[7]\(2),
      I4 => \counter_in_access_reg_n_0_[0]\,
      I5 => \in_FC_reg[6]\(2),
      O => \next_mul_FC0__0_carry_i_31_n_0\
    );
\next_mul_FC0__0_carry_i_32\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"05F5030305F5F3F3"
    )
        port map (
      I0 => \in_FC_reg[9]\(2),
      I1 => \in_FC_reg[8]\(2),
      I2 => \counter_in_access_reg_n_0_[1]\,
      I3 => \in_FC_reg[11]\(2),
      I4 => \counter_in_access_reg_n_0_[0]\,
      I5 => \in_FC_reg[10]\(2),
      O => \next_mul_FC0__0_carry_i_32_n_0\
    );
\next_mul_FC0__0_carry_i_33\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"05F5030305F5F3F3"
    )
        port map (
      I0 => \in_FC_reg[13]\(2),
      I1 => \in_FC_reg[12]\(2),
      I2 => \counter_in_access_reg_n_0_[1]\,
      I3 => \in_FC_reg[15]\(2),
      I4 => \counter_in_access_reg_n_0_[0]\,
      I5 => \in_FC_reg[14]\(2),
      O => \next_mul_FC0__0_carry_i_33_n_0\
    );
\next_mul_FC0__0_carry_i_34\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[35]\(3),
      I1 => \w_FC_reg[34]\(3),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[33]\(3),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[32]\(3),
      O => \next_mul_FC0__0_carry_i_34_n_0\
    );
\next_mul_FC0__0_carry_i_35\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[39]\(3),
      I1 => \w_FC_reg[38]\(3),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[37]\(3),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[36]\(3),
      O => \next_mul_FC0__0_carry_i_35_n_0\
    );
\next_mul_FC0__0_carry_i_36\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[43]\(3),
      I1 => \w_FC_reg[42]\(3),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[41]\(3),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[40]\(3),
      O => \next_mul_FC0__0_carry_i_36_n_0\
    );
\next_mul_FC0__0_carry_i_37\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[47]\(3),
      I1 => \w_FC_reg[46]\(3),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[45]\(3),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[44]\(3),
      O => \next_mul_FC0__0_carry_i_37_n_0\
    );
\next_mul_FC0__0_carry_i_38\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[19]\(3),
      I1 => \w_FC_reg[18]\(3),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[17]\(3),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[16]\(3),
      O => \next_mul_FC0__0_carry_i_38_n_0\
    );
\next_mul_FC0__0_carry_i_39\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[23]\(3),
      I1 => \w_FC_reg[22]\(3),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[21]\(3),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[20]\(3),
      O => \next_mul_FC0__0_carry_i_39_n_0\
    );
\next_mul_FC0__0_carry_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B44B"
    )
        port map (
      I0 => \next_mul_FC0__0_carry_i_14_n_0\,
      I1 => \next_mul_FC0__0_carry_i_13_n_0\,
      I2 => \next_mul_FC0__0_carry_i_1_n_0\,
      I3 => \next_mul_FC0__0_carry_i_15_n_0\,
      O => \next_mul_FC0__0_carry_i_4_n_0\
    );
\next_mul_FC0__0_carry_i_40\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[27]\(3),
      I1 => \w_FC_reg[26]\(3),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[25]\(3),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[24]\(3),
      O => \next_mul_FC0__0_carry_i_40_n_0\
    );
\next_mul_FC0__0_carry_i_41\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[31]\(3),
      I1 => \w_FC_reg[30]\(3),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[29]\(3),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[28]\(3),
      O => \next_mul_FC0__0_carry_i_41_n_0\
    );
\next_mul_FC0__0_carry_i_42\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[3]\(3),
      I1 => \w_FC_reg_n_0_[2][3]\,
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg_n_0_[1][3]\,
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg_n_0_[0][3]\,
      O => \next_mul_FC0__0_carry_i_42_n_0\
    );
\next_mul_FC0__0_carry_i_43\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[7]\(3),
      I1 => \w_FC_reg[6]\(3),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[5]\(3),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[4]\(3),
      O => \next_mul_FC0__0_carry_i_43_n_0\
    );
\next_mul_FC0__0_carry_i_44\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[11]\(3),
      I1 => \w_FC_reg[10]\(3),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[9]\(3),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[8]\(3),
      O => \next_mul_FC0__0_carry_i_44_n_0\
    );
\next_mul_FC0__0_carry_i_45\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \w_FC_reg[15]\(3),
      I1 => \w_FC_reg[14]\(3),
      I2 => \counter_w_access_reg__0\(1),
      I3 => \w_FC_reg[13]\(3),
      I4 => \counter_w_access_reg__0\(0),
      I5 => \w_FC_reg[12]\(3),
      O => \next_mul_FC0__0_carry_i_45_n_0\
    );
\next_mul_FC0__0_carry_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A6"
    )
        port map (
      I0 => \next_mul_FC0__0_carry_i_1_n_0\,
      I1 => \next_mul_FC0__0_carry_i_13_n_0\,
      I2 => \mul_FC[1]_i_4_n_0\,
      O => \next_mul_FC0__0_carry_i_5_n_0\
    );
\next_mul_FC0__0_carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => \next_mul_FC0__0_carry_i_3_n_0\,
      I1 => \next_mul_FC0__0_carry_i_9_n_0\,
      I2 => \next_mul_FC0__0_carry_i_10_n_0\,
      I3 => \next_mul_FC0__0_carry_i_8_n_0\,
      O => \next_mul_FC0__0_carry_i_6_n_0\
    );
\next_mul_FC0__0_carry_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFF04FF0400FB00"
    )
        port map (
      I0 => \mul_FC[1]_i_2_n_0\,
      I1 => \mul_FC[1]_i_3_n_0\,
      I2 => \mul_FC[1]_i_4_n_0\,
      I3 => \mul_FC[1]_i_5_n_0\,
      I4 => \next_mul_FC0__0_carry_i_14_n_0\,
      I5 => \next_mul_FC0__0_carry_i_16_n_0\,
      O => \next_mul_FC0__0_carry_i_7_n_0\
    );
\next_mul_FC0__0_carry_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000030B0002000A0"
    )
        port map (
      I0 => \mul_FC[1]_i_3_n_0\,
      I1 => \mul_FC[1]_i_2_n_0\,
      I2 => \mul_FC[1]_i_5_n_0\,
      I3 => \mul_FC[1]_i_4_n_0\,
      I4 => \next_mul_FC0__0_carry_i_14_n_0\,
      I5 => \next_mul_FC0__0_carry__0_i_4_n_0\,
      O => \next_mul_FC0__0_carry_i_8_n_0\
    );
\next_mul_FC0__0_carry_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FDFF"
    )
        port map (
      I0 => \mul_FC[1]_i_3_n_0\,
      I1 => \mul_FC[1]_i_2_n_0\,
      I2 => \mul_FC[1]_i_4_n_0\,
      I3 => \next_mul_FC0__0_carry__0_i_4_n_0\,
      O => \next_mul_FC0__0_carry_i_9_n_0\
    );
\p_sum_1[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(1),
      I1 => \counter_temp_reg[5]\,
      O => DI(1)
    );
\p_sum_1[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(0),
      I1 => \counter_temp_reg[5]\,
      O => DI(0)
    );
start_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000040"
    )
        port map (
      I0 => \counter_in_reg__0\(0),
      I1 => curr_state_buf,
      I2 => \counter_in_reg__0\(4),
      I3 => \counter_in_reg__0\(3),
      I4 => \counter_in_reg__0\(2),
      I5 => \counter_in_reg__0\(1),
      O => start
    );
start_out_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => start,
      Q => start_out
    );
valid_data_in_del_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => valid_pooling_IBUF,
      Q => valid_data_in_del
    );
valid_data_weight_del_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => valid_FC1_in_IBUF,
      Q => valid_data_weight_del
    );
\w_FC[0][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \counter_w_reg__0\(1),
      I1 => \counter_w_reg__0\(2),
      I2 => \w_FC[15][3]_i_2_n_0\,
      I3 => \counter_w_reg__0\(3),
      I4 => \counter_w_reg__0\(0),
      O => \next_w_FC[0]_55\
    );
\w_FC[10][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => \counter_w_reg__0\(3),
      I2 => \counter_w_reg__0\(1),
      I3 => \counter_w_reg__0\(0),
      I4 => \w_FC[15][3]_i_2_n_0\,
      O => \next_w_FC[10]_58\
    );
\w_FC[11][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => \counter_w_reg__0\(3),
      I2 => \counter_w_reg__0\(0),
      I3 => \counter_w_reg__0\(1),
      I4 => \w_FC[15][3]_i_2_n_0\,
      O => \next_w_FC[11]_18\
    );
\w_FC[12][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => \counter_w_reg__0\(3),
      I2 => \w_FC[15][3]_i_2_n_0\,
      I3 => \counter_w_reg__0\(0),
      I4 => \counter_w_reg__0\(1),
      O => \next_w_FC[12]_8\
    );
\w_FC[13][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => \counter_w_reg__0\(3),
      I2 => \counter_w_reg__0\(0),
      I3 => \counter_w_reg__0\(1),
      I4 => \w_FC[15][3]_i_2_n_0\,
      O => \next_w_FC[13]_9\
    );
\w_FC[14][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => \counter_w_reg__0\(3),
      I2 => \counter_w_reg__0\(1),
      I3 => \counter_w_reg__0\(0),
      I4 => \w_FC[15][3]_i_2_n_0\,
      O => \next_w_FC[14]_10\
    );
\w_FC[15][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => \counter_w_reg__0\(3),
      I1 => \counter_w_reg__0\(2),
      I2 => \counter_w_reg__0\(0),
      I3 => \counter_w_reg__0\(1),
      I4 => \w_FC[15][3]_i_2_n_0\,
      O => \next_w_FC[15]_15\
    );
\w_FC[15][3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFBF"
    )
        port map (
      I0 => \counter_w_reg__0\(5),
      I1 => curr_state_buf,
      I2 => valid_data_weight_del,
      I3 => \counter_w_reg__0\(4),
      O => \w_FC[15][3]_i_2_n_0\
    );
\w_FC[16][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \counter_w_reg__0\(1),
      I1 => \counter_w_reg__0\(2),
      I2 => \w_FC[22][3]_i_2_n_0\,
      O => \next_w_FC[16]_24\
    );
\w_FC[17][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \counter_w_reg__0\(0),
      I1 => \counter_w_reg__0\(1),
      I2 => \w_FC[27][3]_i_2_n_0\,
      I3 => \counter_w_reg__0\(4),
      I4 => \counter_w_reg__0\(3),
      O => \next_w_FC[17]_34\
    );
\w_FC[18][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800000000000"
    )
        port map (
      I0 => \w_FC[18][3]_i_2_n_0\,
      I1 => \counter_w_reg__0\(1),
      I2 => \counter_w_reg__0\(4),
      I3 => valid_data_weight_del,
      I4 => \counter_w_reg__0\(5),
      I5 => next_counter_w(0),
      O => \next_w_FC[18]_23\
    );
\w_FC[18][3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counter_w_reg__0\(3),
      I1 => \counter_w_reg__0\(2),
      O => \w_FC[18][3]_i_2_n_0\
    );
\w_FC[19][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => \counter_w_reg__0\(0),
      I1 => \counter_w_reg__0\(1),
      I2 => \w_FC[27][3]_i_2_n_0\,
      I3 => \counter_w_reg__0\(4),
      I4 => \counter_w_reg__0\(3),
      O => \next_w_FC[19]_17\
    );
\w_FC[1][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => \counter_w_reg__0\(3),
      I2 => \counter_w_reg__0\(0),
      I3 => \counter_w_reg__0\(1),
      I4 => \w_FC[15][3]_i_2_n_0\,
      O => \next_w_FC[1]_53\
    );
\w_FC[20][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => \counter_w_reg__0\(3),
      I1 => \counter_w_reg__0\(4),
      I2 => \counter_w_reg__0\(2),
      I3 => \counter_w_reg__0\(0),
      I4 => \w_FC[21][3]_i_2_n_0\,
      O => \next_w_FC[20]_39\
    );
\w_FC[21][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => \w_FC[21][3]_i_2_n_0\,
      I1 => \counter_w_reg__0\(0),
      I2 => \counter_w_reg__0\(2),
      I3 => \counter_w_reg__0\(4),
      I4 => \counter_w_reg__0\(3),
      O => \next_w_FC[21]_40\
    );
\w_FC[21][3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFBF"
    )
        port map (
      I0 => \counter_w_reg__0\(1),
      I1 => curr_state_buf,
      I2 => valid_data_weight_del,
      I3 => \counter_w_reg__0\(5),
      O => \w_FC[21][3]_i_2_n_0\
    );
\w_FC[22][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \counter_w_reg__0\(1),
      I1 => \counter_w_reg__0\(2),
      I2 => \w_FC[22][3]_i_2_n_0\,
      O => \next_w_FC[22]_25\
    );
\w_FC[22][3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFDFFFFFF"
    )
        port map (
      I0 => curr_state_buf,
      I1 => \counter_w_reg__0\(0),
      I2 => \counter_w_reg__0\(5),
      I3 => valid_data_weight_del,
      I4 => \counter_w_reg__0\(4),
      I5 => \counter_w_reg__0\(3),
      O => \w_FC[22][3]_i_2_n_0\
    );
\w_FC[23][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => \w_FC[23][3]_i_2_n_0\,
      I1 => curr_state_buf,
      I2 => \counter_w_reg__0\(3),
      I3 => \counter_w_reg__0\(0),
      I4 => \counter_w_reg__0\(2),
      O => \next_w_FC[23]_59\
    );
\w_FC[23][3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \counter_w_reg__0\(1),
      I1 => \counter_w_reg__0\(4),
      I2 => valid_data_weight_del,
      I3 => \counter_w_reg__0\(5),
      O => \w_FC[23][3]_i_2_n_0\
    );
\w_FC[24][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => \counter_w_reg__0\(0),
      I2 => \w_FC[29][3]_i_2_n_0\,
      O => \next_w_FC[24]_38\
    );
\w_FC[25][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \counter_w_reg__0\(0),
      I1 => \counter_w_reg__0\(1),
      I2 => \w_FC[27][3]_i_2_n_0\,
      I3 => \counter_w_reg__0\(3),
      I4 => \counter_w_reg__0\(4),
      O => \w_FC[25][3]_i_1_n_0\
    );
\w_FC[26][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => \w_FC[27][3]_i_2_n_0\,
      I1 => \counter_w_reg__0\(1),
      I2 => \counter_w_reg__0\(0),
      I3 => \counter_w_reg__0\(4),
      I4 => \counter_w_reg__0\(3),
      O => \next_w_FC[26]_35\
    );
\w_FC[27][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \counter_w_reg__0\(0),
      I1 => \counter_w_reg__0\(1),
      I2 => \w_FC[27][3]_i_2_n_0\,
      I3 => \counter_w_reg__0\(3),
      I4 => \counter_w_reg__0\(4),
      O => \w_FC[27][3]_i_1_n_0\
    );
\w_FC[27][3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => curr_state_buf,
      I2 => valid_data_weight_del,
      I3 => \counter_w_reg__0\(5),
      O => \w_FC[27][3]_i_2_n_0\
    );
\w_FC[28][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \counter_w_reg__0\(0),
      I1 => \counter_w_reg__0\(2),
      I2 => \w_FC[29][3]_i_2_n_0\,
      O => \next_w_FC[28]_37\
    );
\w_FC[29][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => \counter_w_reg__0\(0),
      I2 => \w_FC[29][3]_i_2_n_0\,
      O => \next_w_FC[29]_36\
    );
\w_FC[29][3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFFFFFFFFFFFF"
    )
        port map (
      I0 => \counter_w_reg__0\(5),
      I1 => valid_data_weight_del,
      I2 => curr_state_buf,
      I3 => \counter_w_reg__0\(1),
      I4 => \counter_w_reg__0\(3),
      I5 => \counter_w_reg__0\(4),
      O => \w_FC[29][3]_i_2_n_0\
    );
\w_FC[2][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => \counter_w_reg__0\(3),
      I2 => \counter_w_reg__0\(1),
      I3 => \counter_w_reg__0\(0),
      I4 => \w_FC[15][3]_i_2_n_0\,
      O => \next_w_FC[2]_57\
    );
\w_FC[30][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800000000000"
    )
        port map (
      I0 => \w_FC[30][3]_i_2_n_0\,
      I1 => \counter_w_reg__0\(1),
      I2 => \counter_w_reg__0\(4),
      I3 => valid_data_weight_del,
      I4 => \counter_w_reg__0\(5),
      I5 => next_counter_w(0),
      O => \next_w_FC[30]_11\
    );
\w_FC[30][3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \counter_w_reg__0\(3),
      I1 => \counter_w_reg__0\(2),
      O => \w_FC[30][3]_i_2_n_0\
    );
\w_FC[31][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => \counter_w_reg__0\(4),
      I1 => \w_FC[31][3]_i_2_n_0\,
      I2 => curr_state_buf,
      I3 => valid_data_weight_del,
      I4 => \counter_w_reg__0\(5),
      O => \next_w_FC[31]_14\
    );
\w_FC[31][3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \counter_w_reg__0\(1),
      I1 => \counter_w_reg__0\(0),
      I2 => \counter_w_reg__0\(2),
      I3 => \counter_w_reg__0\(3),
      O => \w_FC[31][3]_i_2_n_0\
    );
\w_FC[32][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \counter_w_reg__0\(1),
      I1 => \counter_w_reg__0\(2),
      I2 => \counter_w_reg__0\(3),
      I3 => \counter_w_reg__0\(0),
      I4 => \w_FC[47][3]_i_2_n_0\,
      O => \next_w_FC[32]_49\
    );
\w_FC[33][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => \w_FC[47][3]_i_2_n_0\,
      I1 => \counter_w_reg__0\(0),
      I2 => \counter_w_reg__0\(1),
      I3 => \counter_w_reg__0\(2),
      I4 => \counter_w_reg__0\(3),
      O => \next_w_FC[33]_47\
    );
\w_FC[34][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => \w_FC[47][3]_i_2_n_0\,
      I1 => \counter_w_reg__0\(1),
      I2 => \counter_w_reg__0\(0),
      I3 => \counter_w_reg__0\(2),
      I4 => \counter_w_reg__0\(3),
      O => \next_w_FC[34]_45\
    );
\w_FC[35][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000004000000"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => \counter_w_reg__0\(5),
      I2 => \counter_w_reg__0\(3),
      I3 => \counter_w_reg__0\(1),
      I4 => \counter_w_reg__0\(0),
      I5 => \w_FC[44][3]_i_2_n_0\,
      O => \w_FC[35][3]_i_1_n_0\
    );
\w_FC[36][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000020000"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => \counter_w_reg__0\(0),
      I2 => \counter_w_reg__0\(1),
      I3 => \w_FC[44][3]_i_2_n_0\,
      I4 => \counter_w_reg__0\(5),
      I5 => \counter_w_reg__0\(3),
      O => \next_w_FC[36]_41\
    );
\w_FC[37][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000100000000000"
    )
        port map (
      I0 => \w_FC[44][3]_i_2_n_0\,
      I1 => \counter_w_reg__0\(1),
      I2 => \counter_w_reg__0\(0),
      I3 => \counter_w_reg__0\(2),
      I4 => \counter_w_reg__0\(3),
      I5 => \counter_w_reg__0\(5),
      O => \next_w_FC[37]_44\
    );
\w_FC[38][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => \counter_w_reg__0\(1),
      I1 => \counter_w_reg__0\(2),
      I2 => \counter_w_reg__0\(3),
      I3 => \counter_w_reg__0\(0),
      I4 => \w_FC[47][3]_i_2_n_0\,
      O => \next_w_FC[38]_50\
    );
\w_FC[39][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000008000000"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => \counter_w_reg__0\(5),
      I2 => \counter_w_reg__0\(3),
      I3 => \counter_w_reg__0\(1),
      I4 => \counter_w_reg__0\(0),
      I5 => \w_FC[44][3]_i_2_n_0\,
      O => \next_w_FC[39]_21\
    );
\w_FC[3][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001000"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => \counter_w_reg__0\(3),
      I2 => \counter_w_reg__0\(0),
      I3 => \counter_w_reg__0\(1),
      I4 => \w_FC[15][3]_i_2_n_0\,
      O => \next_w_FC[3]_20\
    );
\w_FC[40][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000001000"
    )
        port map (
      I0 => \w_FC[44][3]_i_2_n_0\,
      I1 => \counter_w_reg__0\(1),
      I2 => \counter_w_reg__0\(3),
      I3 => \counter_w_reg__0\(5),
      I4 => \counter_w_reg__0\(0),
      I5 => \counter_w_reg__0\(2),
      O => \next_w_FC[40]_43\
    );
\w_FC[41][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => \counter_w_reg__0\(1),
      I1 => \counter_w_reg__0\(0),
      I2 => \counter_w_reg__0\(3),
      I3 => \counter_w_reg__0\(2),
      I4 => \w_FC[47][3]_i_2_n_0\,
      O => \next_w_FC[41]_48\
    );
\w_FC[42][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => \w_FC[47][3]_i_2_n_0\,
      I1 => \counter_w_reg__0\(1),
      I2 => \counter_w_reg__0\(0),
      I3 => \counter_w_reg__0\(2),
      I4 => \counter_w_reg__0\(3),
      O => \next_w_FC[42]_46\
    );
\w_FC[43][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => \counter_w_reg__0\(1),
      I1 => \counter_w_reg__0\(0),
      I2 => \counter_w_reg__0\(3),
      I3 => \counter_w_reg__0\(2),
      I4 => \w_FC[47][3]_i_2_n_0\,
      O => \next_w_FC[43]_22\
    );
\w_FC[44][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000080"
    )
        port map (
      I0 => \counter_w_reg__0\(5),
      I1 => \counter_w_reg__0\(3),
      I2 => \counter_w_reg__0\(2),
      I3 => \counter_w_reg__0\(0),
      I4 => \counter_w_reg__0\(1),
      I5 => \w_FC[44][3]_i_2_n_0\,
      O => \next_w_FC[44]_42\
    );
\w_FC[44][3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => \counter_w_reg__0\(4),
      I1 => valid_data_weight_del,
      I2 => curr_state_buf,
      O => \w_FC[44][3]_i_2_n_0\
    );
\w_FC[45][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => \counter_w_reg__0\(3),
      I2 => \w_FC[47][3]_i_2_n_0\,
      I3 => \counter_w_reg__0\(0),
      I4 => \counter_w_reg__0\(1),
      O => \next_w_FC[45]_12\
    );
\w_FC[46][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => \counter_w_reg__0\(3),
      I2 => \w_FC[47][3]_i_2_n_0\,
      I3 => \counter_w_reg__0\(1),
      I4 => \counter_w_reg__0\(0),
      O => \next_w_FC[46]_13\
    );
\w_FC[47][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => \counter_w_reg__0\(3),
      I1 => \counter_w_reg__0\(2),
      I2 => \counter_w_reg__0\(0),
      I3 => \counter_w_reg__0\(1),
      I4 => \w_FC[47][3]_i_2_n_0\,
      O => \next_w_FC[47]_16\
    );
\w_FC[47][3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F7FF"
    )
        port map (
      I0 => curr_state_buf,
      I1 => valid_data_weight_del,
      I2 => \counter_w_reg__0\(4),
      I3 => \counter_w_reg__0\(5),
      O => \w_FC[47][3]_i_2_n_0\
    );
\w_FC[4][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => \counter_w_reg__0\(1),
      I1 => \counter_w_reg__0\(2),
      I2 => \counter_w_reg__0\(0),
      I3 => \counter_w_reg__0\(3),
      I4 => \w_FC[15][3]_i_2_n_0\,
      O => \w_FC[4][3]_i_1_n_0\
    );
\w_FC[5][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => \counter_w_reg__0\(3),
      I1 => \counter_w_reg__0\(2),
      I2 => \counter_w_reg__0\(0),
      I3 => \counter_w_reg__0\(1),
      I4 => \w_FC[15][3]_i_2_n_0\,
      O => \next_w_FC[5]_52\
    );
\w_FC[6][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => \counter_w_reg__0\(1),
      I1 => \counter_w_reg__0\(2),
      I2 => \counter_w_reg__0\(0),
      I3 => \counter_w_reg__0\(3),
      I4 => \w_FC[15][3]_i_2_n_0\,
      O => \next_w_FC[6]_54\
    );
\w_FC[7][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => \counter_w_reg__0\(3),
      I1 => \counter_w_reg__0\(2),
      I2 => \counter_w_reg__0\(0),
      I3 => \counter_w_reg__0\(1),
      I4 => \w_FC[15][3]_i_2_n_0\,
      O => \next_w_FC[7]_19\
    );
\w_FC[8][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => \counter_w_reg__0\(3),
      I2 => \w_FC[15][3]_i_2_n_0\,
      I3 => \counter_w_reg__0\(0),
      I4 => \counter_w_reg__0\(1),
      O => \next_w_FC[8]_56\
    );
\w_FC[9][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => \counter_w_reg__0\(2),
      I1 => \counter_w_reg__0\(3),
      I2 => \counter_w_reg__0\(0),
      I3 => \counter_w_reg__0\(1),
      I4 => \w_FC[15][3]_i_2_n_0\,
      O => \next_w_FC[9]_51\
    );
\w_FC_reg[0][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[0]_55\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg_n_0_[0][0]\
    );
\w_FC_reg[0][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[0]_55\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg_n_0_[0][1]\
    );
\w_FC_reg[0][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[0]_55\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg_n_0_[0][2]\
    );
\w_FC_reg[0][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[0]_55\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg_n_0_[0][3]\
    );
\w_FC_reg[10][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[10]_58\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[10]\(0)
    );
\w_FC_reg[10][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[10]_58\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[10]\(1)
    );
\w_FC_reg[10][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[10]_58\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[10]\(2)
    );
\w_FC_reg[10][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[10]_58\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[10]\(3)
    );
\w_FC_reg[11][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[11]_18\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[11]\(0)
    );
\w_FC_reg[11][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[11]_18\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[11]\(1)
    );
\w_FC_reg[11][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[11]_18\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[11]\(2)
    );
\w_FC_reg[11][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[11]_18\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[11]\(3)
    );
\w_FC_reg[12][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[12]_8\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[12]\(0)
    );
\w_FC_reg[12][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[12]_8\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[12]\(1)
    );
\w_FC_reg[12][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[12]_8\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[12]\(2)
    );
\w_FC_reg[12][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[12]_8\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[12]\(3)
    );
\w_FC_reg[13][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[13]_9\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[13]\(0)
    );
\w_FC_reg[13][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[13]_9\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[13]\(1)
    );
\w_FC_reg[13][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[13]_9\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[13]\(2)
    );
\w_FC_reg[13][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[13]_9\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[13]\(3)
    );
\w_FC_reg[14][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[14]_10\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[14]\(0)
    );
\w_FC_reg[14][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[14]_10\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[14]\(1)
    );
\w_FC_reg[14][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[14]_10\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[14]\(2)
    );
\w_FC_reg[14][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[14]_10\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[14]\(3)
    );
\w_FC_reg[15][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[15]_15\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[15]\(0)
    );
\w_FC_reg[15][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[15]_15\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[15]\(1)
    );
\w_FC_reg[15][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[15]_15\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[15]\(2)
    );
\w_FC_reg[15][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[15]_15\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[15]\(3)
    );
\w_FC_reg[16][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[16]_24\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[16]\(0)
    );
\w_FC_reg[16][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[16]_24\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[16]\(1)
    );
\w_FC_reg[16][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[16]_24\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[16]\(2)
    );
\w_FC_reg[16][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[16]_24\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[16]\(3)
    );
\w_FC_reg[17][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[17]_34\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[17]\(0)
    );
\w_FC_reg[17][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[17]_34\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[17]\(1)
    );
\w_FC_reg[17][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[17]_34\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[17]\(2)
    );
\w_FC_reg[17][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[17]_34\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[17]\(3)
    );
\w_FC_reg[18][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[18]_23\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[18]\(0)
    );
\w_FC_reg[18][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[18]_23\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[18]\(1)
    );
\w_FC_reg[18][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[18]_23\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[18]\(2)
    );
\w_FC_reg[18][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[18]_23\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[18]\(3)
    );
\w_FC_reg[19][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[19]_17\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[19]\(0)
    );
\w_FC_reg[19][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[19]_17\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[19]\(1)
    );
\w_FC_reg[19][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[19]_17\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[19]\(2)
    );
\w_FC_reg[19][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[19]_17\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[19]\(3)
    );
\w_FC_reg[1][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[1]_53\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg_n_0_[1][0]\
    );
\w_FC_reg[1][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[1]_53\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg_n_0_[1][1]\
    );
\w_FC_reg[1][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[1]_53\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg_n_0_[1][2]\
    );
\w_FC_reg[1][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[1]_53\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg_n_0_[1][3]\
    );
\w_FC_reg[20][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[20]_39\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[20]\(0)
    );
\w_FC_reg[20][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[20]_39\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[20]\(1)
    );
\w_FC_reg[20][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[20]_39\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[20]\(2)
    );
\w_FC_reg[20][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[20]_39\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[20]\(3)
    );
\w_FC_reg[21][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[21]_40\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[21]\(0)
    );
\w_FC_reg[21][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[21]_40\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[21]\(1)
    );
\w_FC_reg[21][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[21]_40\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[21]\(2)
    );
\w_FC_reg[21][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[21]_40\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[21]\(3)
    );
\w_FC_reg[22][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[22]_25\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[22]\(0)
    );
\w_FC_reg[22][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[22]_25\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[22]\(1)
    );
\w_FC_reg[22][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[22]_25\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[22]\(2)
    );
\w_FC_reg[22][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[22]_25\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[22]\(3)
    );
\w_FC_reg[23][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[23]_59\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[23]\(0)
    );
\w_FC_reg[23][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[23]_59\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[23]\(1)
    );
\w_FC_reg[23][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[23]_59\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[23]\(2)
    );
\w_FC_reg[23][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[23]_59\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[23]\(3)
    );
\w_FC_reg[24][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[24]_38\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[24]\(0)
    );
\w_FC_reg[24][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[24]_38\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[24]\(1)
    );
\w_FC_reg[24][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[24]_38\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[24]\(2)
    );
\w_FC_reg[24][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[24]_38\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[24]\(3)
    );
\w_FC_reg[25][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w_FC[25][3]_i_1_n_0\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[25]\(0)
    );
\w_FC_reg[25][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w_FC[25][3]_i_1_n_0\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[25]\(1)
    );
\w_FC_reg[25][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w_FC[25][3]_i_1_n_0\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[25]\(2)
    );
\w_FC_reg[25][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w_FC[25][3]_i_1_n_0\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[25]\(3)
    );
\w_FC_reg[26][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[26]_35\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[26]\(0)
    );
\w_FC_reg[26][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[26]_35\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[26]\(1)
    );
\w_FC_reg[26][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[26]_35\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[26]\(2)
    );
\w_FC_reg[26][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[26]_35\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[26]\(3)
    );
\w_FC_reg[27][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w_FC[27][3]_i_1_n_0\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[27]\(0)
    );
\w_FC_reg[27][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w_FC[27][3]_i_1_n_0\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[27]\(1)
    );
\w_FC_reg[27][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w_FC[27][3]_i_1_n_0\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[27]\(2)
    );
\w_FC_reg[27][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w_FC[27][3]_i_1_n_0\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[27]\(3)
    );
\w_FC_reg[28][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[28]_37\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[28]\(0)
    );
\w_FC_reg[28][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[28]_37\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[28]\(1)
    );
\w_FC_reg[28][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[28]_37\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[28]\(2)
    );
\w_FC_reg[28][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[28]_37\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[28]\(3)
    );
\w_FC_reg[29][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[29]_36\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[29]\(0)
    );
\w_FC_reg[29][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[29]_36\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[29]\(1)
    );
\w_FC_reg[29][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[29]_36\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[29]\(2)
    );
\w_FC_reg[29][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[29]_36\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[29]\(3)
    );
\w_FC_reg[2][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[2]_57\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg_n_0_[2][0]\
    );
\w_FC_reg[2][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[2]_57\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg_n_0_[2][1]\
    );
\w_FC_reg[2][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[2]_57\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg_n_0_[2][2]\
    );
\w_FC_reg[2][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[2]_57\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg_n_0_[2][3]\
    );
\w_FC_reg[30][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[30]_11\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[30]\(0)
    );
\w_FC_reg[30][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[30]_11\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[30]\(1)
    );
\w_FC_reg[30][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[30]_11\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[30]\(2)
    );
\w_FC_reg[30][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[30]_11\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[30]\(3)
    );
\w_FC_reg[31][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[31]_14\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[31]\(0)
    );
\w_FC_reg[31][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[31]_14\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[31]\(1)
    );
\w_FC_reg[31][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[31]_14\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[31]\(2)
    );
\w_FC_reg[31][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[31]_14\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[31]\(3)
    );
\w_FC_reg[32][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[32]_49\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[32]\(0)
    );
\w_FC_reg[32][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[32]_49\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[32]\(1)
    );
\w_FC_reg[32][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[32]_49\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[32]\(2)
    );
\w_FC_reg[32][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[32]_49\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[32]\(3)
    );
\w_FC_reg[33][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[33]_47\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[33]\(0)
    );
\w_FC_reg[33][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[33]_47\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[33]\(1)
    );
\w_FC_reg[33][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[33]_47\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[33]\(2)
    );
\w_FC_reg[33][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[33]_47\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[33]\(3)
    );
\w_FC_reg[34][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[34]_45\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[34]\(0)
    );
\w_FC_reg[34][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[34]_45\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[34]\(1)
    );
\w_FC_reg[34][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[34]_45\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[34]\(2)
    );
\w_FC_reg[34][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[34]_45\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[34]\(3)
    );
\w_FC_reg[35][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w_FC[35][3]_i_1_n_0\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[35]\(0)
    );
\w_FC_reg[35][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w_FC[35][3]_i_1_n_0\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[35]\(1)
    );
\w_FC_reg[35][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w_FC[35][3]_i_1_n_0\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[35]\(2)
    );
\w_FC_reg[35][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w_FC[35][3]_i_1_n_0\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[35]\(3)
    );
\w_FC_reg[36][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[36]_41\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[36]\(0)
    );
\w_FC_reg[36][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[36]_41\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[36]\(1)
    );
\w_FC_reg[36][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[36]_41\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[36]\(2)
    );
\w_FC_reg[36][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[36]_41\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[36]\(3)
    );
\w_FC_reg[37][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[37]_44\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[37]\(0)
    );
\w_FC_reg[37][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[37]_44\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[37]\(1)
    );
\w_FC_reg[37][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[37]_44\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[37]\(2)
    );
\w_FC_reg[37][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[37]_44\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[37]\(3)
    );
\w_FC_reg[38][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[38]_50\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[38]\(0)
    );
\w_FC_reg[38][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[38]_50\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[38]\(1)
    );
\w_FC_reg[38][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[38]_50\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[38]\(2)
    );
\w_FC_reg[38][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[38]_50\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[38]\(3)
    );
\w_FC_reg[39][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[39]_21\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[39]\(0)
    );
\w_FC_reg[39][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[39]_21\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[39]\(1)
    );
\w_FC_reg[39][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[39]_21\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[39]\(2)
    );
\w_FC_reg[39][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[39]_21\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[39]\(3)
    );
\w_FC_reg[3][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[3]_20\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[3]\(0)
    );
\w_FC_reg[3][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[3]_20\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[3]\(1)
    );
\w_FC_reg[3][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[3]_20\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[3]\(2)
    );
\w_FC_reg[3][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[3]_20\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[3]\(3)
    );
\w_FC_reg[40][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[40]_43\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[40]\(0)
    );
\w_FC_reg[40][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[40]_43\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[40]\(1)
    );
\w_FC_reg[40][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[40]_43\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[40]\(2)
    );
\w_FC_reg[40][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[40]_43\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[40]\(3)
    );
\w_FC_reg[41][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[41]_48\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[41]\(0)
    );
\w_FC_reg[41][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[41]_48\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[41]\(1)
    );
\w_FC_reg[41][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[41]_48\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[41]\(2)
    );
\w_FC_reg[41][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[41]_48\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[41]\(3)
    );
\w_FC_reg[42][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[42]_46\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[42]\(0)
    );
\w_FC_reg[42][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[42]_46\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[42]\(1)
    );
\w_FC_reg[42][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[42]_46\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[42]\(2)
    );
\w_FC_reg[42][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[42]_46\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[42]\(3)
    );
\w_FC_reg[43][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[43]_22\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[43]\(0)
    );
\w_FC_reg[43][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[43]_22\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[43]\(1)
    );
\w_FC_reg[43][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[43]_22\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[43]\(2)
    );
\w_FC_reg[43][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[43]_22\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[43]\(3)
    );
\w_FC_reg[44][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[44]_42\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[44]\(0)
    );
\w_FC_reg[44][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[44]_42\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[44]\(1)
    );
\w_FC_reg[44][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[44]_42\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[44]\(2)
    );
\w_FC_reg[44][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[44]_42\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[44]\(3)
    );
\w_FC_reg[45][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[45]_12\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[45]\(0)
    );
\w_FC_reg[45][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[45]_12\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[45]\(1)
    );
\w_FC_reg[45][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[45]_12\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[45]\(2)
    );
\w_FC_reg[45][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[45]_12\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[45]\(3)
    );
\w_FC_reg[46][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[46]_13\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[46]\(0)
    );
\w_FC_reg[46][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[46]_13\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[46]\(1)
    );
\w_FC_reg[46][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[46]_13\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[46]\(2)
    );
\w_FC_reg[46][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[46]_13\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[46]\(3)
    );
\w_FC_reg[47][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[47]_16\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[47]\(0)
    );
\w_FC_reg[47][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[47]_16\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[47]\(1)
    );
\w_FC_reg[47][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[47]_16\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[47]\(2)
    );
\w_FC_reg[47][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[47]_16\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[47]\(3)
    );
\w_FC_reg[4][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w_FC[4][3]_i_1_n_0\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[4]\(0)
    );
\w_FC_reg[4][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w_FC[4][3]_i_1_n_0\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[4]\(1)
    );
\w_FC_reg[4][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w_FC[4][3]_i_1_n_0\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[4]\(2)
    );
\w_FC_reg[4][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w_FC[4][3]_i_1_n_0\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[4]\(3)
    );
\w_FC_reg[5][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[5]_52\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[5]\(0)
    );
\w_FC_reg[5][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[5]_52\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[5]\(1)
    );
\w_FC_reg[5][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[5]_52\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[5]\(2)
    );
\w_FC_reg[5][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[5]_52\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[5]\(3)
    );
\w_FC_reg[6][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[6]_54\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[6]\(0)
    );
\w_FC_reg[6][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[6]_54\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[6]\(1)
    );
\w_FC_reg[6][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[6]_54\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[6]\(2)
    );
\w_FC_reg[6][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[6]_54\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[6]\(3)
    );
\w_FC_reg[7][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[7]_19\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[7]\(0)
    );
\w_FC_reg[7][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[7]_19\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[7]\(1)
    );
\w_FC_reg[7][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[7]_19\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[7]\(2)
    );
\w_FC_reg[7][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[7]_19\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[7]\(3)
    );
\w_FC_reg[8][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[8]_56\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[8]\(0)
    );
\w_FC_reg[8][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[8]_56\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[8]\(1)
    );
\w_FC_reg[8][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[8]_56\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[8]\(2)
    );
\w_FC_reg[8][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[8]_56\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[8]\(3)
    );
\w_FC_reg[9][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[9]_51\,
      CLR => AR(0),
      D => FC_weight_del(0),
      Q => \w_FC_reg[9]\(0)
    );
\w_FC_reg[9][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[9]_51\,
      CLR => AR(0),
      D => FC_weight_del(1),
      Q => \w_FC_reg[9]\(1)
    );
\w_FC_reg[9][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[9]_51\,
      CLR => AR(0),
      D => FC_weight_del(2),
      Q => \w_FC_reg[9]\(2)
    );
\w_FC_reg[9][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[9]_51\,
      CLR => AR(0),
      D => FC_weight_del(3),
      Q => \w_FC_reg[9]\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FC1_MU is
  port (
    valid_res_FC1 : out STD_LOGIC;
    \p_sum_1_reg[3]_0\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 2 downto 0 );
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    DI : in STD_LOGIC_VECTOR ( 1 downto 0 );
    start_out : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end FC1_MU;

architecture STRUCTURE of FC1_MU is
  signal \FC_input_del[1]_i_2_n_0\ : STD_LOGIC;
  signal \FC_input_del[1]_i_3_n_0\ : STD_LOGIC;
  signal \FC_input_del[1]_i_4_n_0\ : STD_LOGIC;
  signal \FC_input_del[1]_i_5_n_0\ : STD_LOGIC;
  signal \FC_input_del[1]_i_6_n_0\ : STD_LOGIC;
  signal \FC_input_del[1]_i_7_n_0\ : STD_LOGIC;
  signal \FC_input_del[1]_i_8_n_0\ : STD_LOGIC;
  signal \FC_input_del[2]_i_2_n_0\ : STD_LOGIC;
  signal \FC_input_del[2]_i_3_n_0\ : STD_LOGIC;
  signal count_bias : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \count_bias[0]_i_1_n_0\ : STD_LOGIC;
  signal \count_bias[1]_i_1_n_0\ : STD_LOGIC;
  signal \counter_temp[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \counter_temp[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_temp_reg__0\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal curr_state_accu : STD_LOGIC;
  signal curr_state_accu0 : STD_LOGIC;
  signal curr_state_accu_i_2_n_0 : STD_LOGIC;
  signal \in\ : STD_LOGIC_VECTOR ( 8 downto 2 );
  signal next_counter_temp : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \p_sum_1[0]_i_6_n_0\ : STD_LOGIC;
  signal \p_sum_1[0]_i_7_n_0\ : STD_LOGIC;
  signal \p_sum_1[0]_i_8_n_0\ : STD_LOGIC;
  signal \p_sum_1[0]_i_9_n_0\ : STD_LOGIC;
  signal \p_sum_1[12]_i_2_n_0\ : STD_LOGIC;
  signal \p_sum_1[4]_i_2_n_0\ : STD_LOGIC;
  signal \p_sum_1[4]_i_6_n_0\ : STD_LOGIC;
  signal \p_sum_1[4]_i_7_n_0\ : STD_LOGIC;
  signal \p_sum_1[4]_i_8_n_0\ : STD_LOGIC;
  signal \p_sum_1[4]_i_9_n_0\ : STD_LOGIC;
  signal \p_sum_1[8]_i_3_n_0\ : STD_LOGIC;
  signal \p_sum_1[8]_i_4_n_0\ : STD_LOGIC;
  signal \p_sum_1[8]_i_5_n_0\ : STD_LOGIC;
  signal \p_sum_1[8]_i_6_n_0\ : STD_LOGIC;
  signal \p_sum_1[8]_i_7_n_0\ : STD_LOGIC;
  signal \p_sum_1[8]_i_8_n_0\ : STD_LOGIC;
  signal \p_sum_1[8]_i_9_n_0\ : STD_LOGIC;
  signal p_sum_1_reg : STD_LOGIC_VECTOR ( 12 downto 2 );
  signal \p_sum_1_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \p_sum_1_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \p_sum_1_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \p_sum_1_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \p_sum_1_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \p_sum_1_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \p_sum_1_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \p_sum_1_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \p_sum_1_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \^p_sum_1_reg[3]_0\ : STD_LOGIC;
  signal \p_sum_1_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \p_sum_1_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \p_sum_1_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \p_sum_1_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \p_sum_1_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \p_sum_1_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \p_sum_1_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \p_sum_1_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \p_sum_1_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \p_sum_1_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \p_sum_1_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \p_sum_1_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \p_sum_1_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \p_sum_1_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \p_sum_1_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \p_sum_1_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \p_sum_1_reg_n_0_[0]\ : STD_LOGIC;
  signal \p_sum_1_reg_n_0_[1]\ : STD_LOGIC;
  signal \status_res_del_i_1__0_n_0\ : STD_LOGIC;
  signal \^valid_res_fc1\ : STD_LOGIC;
  signal \NLW_p_sum_1_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_p_sum_1_reg[12]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FC_input_del[0]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \FC_input_del[1]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \FC_input_del[1]_i_6\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \FC_input_del[1]_i_8\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \count_bias[0]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \counter_temp[1]_i_1__0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \counter_temp[2]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \counter_temp[3]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \counter_temp[5]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of curr_state_accu_i_1 : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of curr_state_accu_i_2 : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \status_res_del_i_1__0\ : label is "soft_lutpair24";
begin
  \p_sum_1_reg[3]_0\ <= \^p_sum_1_reg[3]_0\;
  valid_res_FC1 <= \^valid_res_fc1\;
\FC_input_del[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BEAA"
    )
        port map (
      I0 => \FC_input_del[1]_i_2_n_0\,
      I1 => p_sum_1_reg(2),
      I2 => p_sum_1_reg(3),
      I3 => \FC_input_del[1]_i_3_n_0\,
      O => D(0)
    );
\FC_input_del[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BEEEAAAA"
    )
        port map (
      I0 => \FC_input_del[1]_i_2_n_0\,
      I1 => p_sum_1_reg(4),
      I2 => p_sum_1_reg(3),
      I3 => p_sum_1_reg(2),
      I4 => \FC_input_del[1]_i_3_n_0\,
      O => D(1)
    );
\FC_input_del[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1011"
    )
        port map (
      I0 => \FC_input_del[1]_i_4_n_0\,
      I1 => p_sum_1_reg(12),
      I2 => \FC_input_del[1]_i_5_n_0\,
      I3 => \FC_input_del[1]_i_6_n_0\,
      O => \FC_input_del[1]_i_2_n_0\
    );
\FC_input_del[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABBAABBAABBAAAAA"
    )
        port map (
      I0 => \FC_input_del[2]_i_2_n_0\,
      I1 => \FC_input_del[1]_i_7_n_0\,
      I2 => p_sum_1_reg(5),
      I3 => \FC_input_del[1]_i_8_n_0\,
      I4 => p_sum_1_reg(8),
      I5 => \FC_input_del[2]_i_3_n_0\,
      O => \FC_input_del[1]_i_3_n_0\
    );
\FC_input_del[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => p_sum_1_reg(9),
      I1 => p_sum_1_reg(11),
      I2 => p_sum_1_reg(10),
      I3 => \FC_input_del[2]_i_3_n_0\,
      I4 => p_sum_1_reg(8),
      O => \FC_input_del[1]_i_4_n_0\
    );
\FC_input_del[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => p_sum_1_reg(11),
      I1 => p_sum_1_reg(10),
      I2 => p_sum_1_reg(7),
      I3 => p_sum_1_reg(9),
      I4 => p_sum_1_reg(6),
      I5 => p_sum_1_reg(8),
      O => \FC_input_del[1]_i_5_n_0\
    );
\FC_input_del[1]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1555"
    )
        port map (
      I0 => p_sum_1_reg(5),
      I1 => p_sum_1_reg(4),
      I2 => p_sum_1_reg(2),
      I3 => p_sum_1_reg(3),
      O => \FC_input_del[1]_i_6_n_0\
    );
\FC_input_del[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF7FFFFFFF"
    )
        port map (
      I0 => p_sum_1_reg(9),
      I1 => p_sum_1_reg(11),
      I2 => p_sum_1_reg(10),
      I3 => p_sum_1_reg(6),
      I4 => p_sum_1_reg(7),
      I5 => \^valid_res_fc1\,
      O => \FC_input_del[1]_i_7_n_0\
    );
\FC_input_del[1]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => p_sum_1_reg(3),
      I1 => p_sum_1_reg(2),
      I2 => p_sum_1_reg(4),
      O => \FC_input_del[1]_i_8_n_0\
    );
\FC_input_del[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^valid_res_fc1\,
      I1 => \FC_input_del[2]_i_2_n_0\,
      O => D(2)
    );
\FC_input_del[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9555555555555555"
    )
        port map (
      I0 => p_sum_1_reg(12),
      I1 => p_sum_1_reg(8),
      I2 => \FC_input_del[2]_i_3_n_0\,
      I3 => p_sum_1_reg(10),
      I4 => p_sum_1_reg(11),
      I5 => p_sum_1_reg(9),
      O => \FC_input_del[2]_i_2_n_0\
    );
\FC_input_del[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => p_sum_1_reg(5),
      I1 => p_sum_1_reg(3),
      I2 => p_sum_1_reg(2),
      I3 => p_sum_1_reg(4),
      I4 => p_sum_1_reg(7),
      I5 => p_sum_1_reg(6),
      O => \FC_input_del[2]_i_3_n_0\
    );
\count_bias[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8F007000"
    )
        port map (
      I0 => \counter_temp_reg__0\(4),
      I1 => \counter_temp_reg__0\(5),
      I2 => curr_state_accu_i_2_n_0,
      I3 => curr_state_accu,
      I4 => count_bias(0),
      O => \count_bias[0]_i_1_n_0\
    );
\count_bias[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D5FF00002A000000"
    )
        port map (
      I0 => count_bias(0),
      I1 => \counter_temp_reg__0\(4),
      I2 => \counter_temp_reg__0\(5),
      I3 => curr_state_accu_i_2_n_0,
      I4 => curr_state_accu,
      I5 => count_bias(1),
      O => \count_bias[1]_i_1_n_0\
    );
\count_bias_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_bias[0]_i_1_n_0\,
      Q => count_bias(0)
    );
\count_bias_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_bias[1]_i_1_n_0\,
      Q => count_bias(1)
    );
\counter_temp[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state_accu,
      I1 => \counter_temp_reg__0\(0),
      O => next_counter_temp(0)
    );
\counter_temp[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \counter_temp_reg__0\(0),
      I1 => \counter_temp_reg__0\(1),
      I2 => curr_state_accu,
      O => \counter_temp[1]_i_1__0_n_0\
    );
\counter_temp[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => curr_state_accu,
      I1 => \counter_temp_reg__0\(1),
      I2 => \counter_temp_reg__0\(0),
      I3 => \counter_temp_reg__0\(2),
      O => next_counter_temp(2)
    );
\counter_temp[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => curr_state_accu,
      I1 => \counter_temp_reg__0\(0),
      I2 => \counter_temp_reg__0\(1),
      I3 => \counter_temp_reg__0\(2),
      I4 => \counter_temp_reg__0\(3),
      O => next_counter_temp(3)
    );
\counter_temp[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF800000000000"
    )
        port map (
      I0 => \counter_temp_reg__0\(2),
      I1 => \counter_temp_reg__0\(1),
      I2 => \counter_temp_reg__0\(0),
      I3 => \counter_temp_reg__0\(3),
      I4 => \counter_temp_reg__0\(4),
      I5 => curr_state_accu,
      O => \counter_temp[4]_i_1_n_0\
    );
\counter_temp[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => curr_state_accu,
      I1 => \counter_temp_reg__0\(4),
      I2 => curr_state_accu_i_2_n_0,
      I3 => \counter_temp_reg__0\(5),
      O => next_counter_temp(5)
    );
\counter_temp_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_counter_temp(0),
      Q => \counter_temp_reg__0\(0)
    );
\counter_temp_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \counter_temp[1]_i_1__0_n_0\,
      Q => \counter_temp_reg__0\(1)
    );
\counter_temp_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_counter_temp(2),
      Q => \counter_temp_reg__0\(2)
    );
\counter_temp_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_counter_temp(3),
      Q => \counter_temp_reg__0\(3)
    );
\counter_temp_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \counter_temp[4]_i_1_n_0\,
      Q => \counter_temp_reg__0\(4)
    );
\counter_temp_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_counter_temp(5),
      Q => \counter_temp_reg__0\(5)
    );
curr_state_accu_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFFDF00"
    )
        port map (
      I0 => curr_state_accu_i_2_n_0,
      I1 => \counter_temp_reg__0\(4),
      I2 => \counter_temp_reg__0\(5),
      I3 => curr_state_accu,
      I4 => start_out,
      O => curr_state_accu0
    );
curr_state_accu_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \counter_temp_reg__0\(2),
      I1 => \counter_temp_reg__0\(1),
      I2 => \counter_temp_reg__0\(0),
      I3 => \counter_temp_reg__0\(3),
      O => curr_state_accu_i_2_n_0
    );
curr_state_accu_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => curr_state_accu0,
      Q => curr_state_accu
    );
\p_sum_1[0]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000007"
    )
        port map (
      I0 => \counter_temp_reg__0\(5),
      I1 => \counter_temp_reg__0\(4),
      I2 => \counter_temp_reg__0\(2),
      I3 => \counter_temp_reg__0\(3),
      I4 => \counter_temp_reg__0\(1),
      I5 => \counter_temp_reg__0\(0),
      O => \^p_sum_1_reg[3]_0\
    );
\p_sum_1[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F20"
    )
        port map (
      I0 => count_bias(1),
      I1 => count_bias(0),
      I2 => \^p_sum_1_reg[3]_0\,
      I3 => Q(3),
      O => \in\(3)
    );
\p_sum_1[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => count_bias(1),
      I1 => \^p_sum_1_reg[3]_0\,
      I2 => Q(2),
      O => \in\(2)
    );
\p_sum_1[0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BB0F44F0"
    )
        port map (
      I0 => count_bias(0),
      I1 => count_bias(1),
      I2 => p_sum_1_reg(3),
      I3 => \^p_sum_1_reg[3]_0\,
      I4 => Q(3),
      O => \p_sum_1[0]_i_6_n_0\
    );
\p_sum_1[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A35C"
    )
        port map (
      I0 => count_bias(1),
      I1 => p_sum_1_reg(2),
      I2 => \^p_sum_1_reg[3]_0\,
      I3 => Q(2),
      O => \p_sum_1[0]_i_7_n_0\
    );
\p_sum_1[0]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
        port map (
      I0 => \p_sum_1_reg_n_0_[1]\,
      I1 => \^p_sum_1_reg[3]_0\,
      I2 => Q(1),
      O => \p_sum_1[0]_i_8_n_0\
    );
\p_sum_1[0]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
        port map (
      I0 => \p_sum_1_reg_n_0_[0]\,
      I1 => \^p_sum_1_reg[3]_0\,
      I2 => Q(0),
      O => \p_sum_1[0]_i_9_n_0\
    );
\p_sum_1[12]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C6C6C636"
    )
        port map (
      I0 => p_sum_1_reg(12),
      I1 => Q(7),
      I2 => \^p_sum_1_reg[3]_0\,
      I3 => count_bias(0),
      I4 => count_bias(1),
      O => \p_sum_1[12]_i_2_n_0\
    );
\p_sum_1[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1F10"
    )
        port map (
      I0 => count_bias(1),
      I1 => count_bias(0),
      I2 => \^p_sum_1_reg[3]_0\,
      I3 => Q(7),
      O => \p_sum_1[4]_i_2_n_0\
    );
\p_sum_1[4]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1F10"
    )
        port map (
      I0 => count_bias(1),
      I1 => count_bias(0),
      I2 => \^p_sum_1_reg[3]_0\,
      I3 => Q(6),
      O => \in\(6)
    );
\p_sum_1[4]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1F10"
    )
        port map (
      I0 => count_bias(1),
      I1 => count_bias(0),
      I2 => \^p_sum_1_reg[3]_0\,
      I3 => Q(5),
      O => \in\(5)
    );
\p_sum_1[4]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F70"
    )
        port map (
      I0 => count_bias(1),
      I1 => count_bias(0),
      I2 => \^p_sum_1_reg[3]_0\,
      I3 => Q(4),
      O => \in\(4)
    );
\p_sum_1[4]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EE0F11F0"
    )
        port map (
      I0 => count_bias(0),
      I1 => count_bias(1),
      I2 => p_sum_1_reg(7),
      I3 => \^p_sum_1_reg[3]_0\,
      I4 => Q(7),
      O => \p_sum_1[4]_i_6_n_0\
    );
\p_sum_1[4]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EE0F11F0"
    )
        port map (
      I0 => count_bias(0),
      I1 => count_bias(1),
      I2 => p_sum_1_reg(6),
      I3 => \^p_sum_1_reg[3]_0\,
      I4 => Q(6),
      O => \p_sum_1[4]_i_7_n_0\
    );
\p_sum_1[4]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EE0F11F0"
    )
        port map (
      I0 => count_bias(0),
      I1 => count_bias(1),
      I2 => p_sum_1_reg(5),
      I3 => \^p_sum_1_reg[3]_0\,
      I4 => Q(5),
      O => \p_sum_1[4]_i_8_n_0\
    );
\p_sum_1[4]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"880F77F0"
    )
        port map (
      I0 => count_bias(0),
      I1 => count_bias(1),
      I2 => p_sum_1_reg(4),
      I3 => \^p_sum_1_reg[3]_0\,
      I4 => Q(4),
      O => \p_sum_1[4]_i_9_n_0\
    );
\p_sum_1[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1F10"
    )
        port map (
      I0 => count_bias(1),
      I1 => count_bias(0),
      I2 => \^p_sum_1_reg[3]_0\,
      I3 => Q(7),
      O => \in\(8)
    );
\p_sum_1[8]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1F10"
    )
        port map (
      I0 => count_bias(1),
      I1 => count_bias(0),
      I2 => \^p_sum_1_reg[3]_0\,
      I3 => Q(7),
      O => \p_sum_1[8]_i_3_n_0\
    );
\p_sum_1[8]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1F10"
    )
        port map (
      I0 => count_bias(1),
      I1 => count_bias(0),
      I2 => \^p_sum_1_reg[3]_0\,
      I3 => Q(7),
      O => \p_sum_1[8]_i_4_n_0\
    );
\p_sum_1[8]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1F10"
    )
        port map (
      I0 => count_bias(1),
      I1 => count_bias(0),
      I2 => \^p_sum_1_reg[3]_0\,
      I3 => Q(7),
      O => \p_sum_1[8]_i_5_n_0\
    );
\p_sum_1[8]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EE0F11F0"
    )
        port map (
      I0 => count_bias(0),
      I1 => count_bias(1),
      I2 => p_sum_1_reg(11),
      I3 => \^p_sum_1_reg[3]_0\,
      I4 => Q(7),
      O => \p_sum_1[8]_i_6_n_0\
    );
\p_sum_1[8]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EE0F11F0"
    )
        port map (
      I0 => count_bias(0),
      I1 => count_bias(1),
      I2 => p_sum_1_reg(10),
      I3 => \^p_sum_1_reg[3]_0\,
      I4 => Q(7),
      O => \p_sum_1[8]_i_7_n_0\
    );
\p_sum_1[8]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EE0F11F0"
    )
        port map (
      I0 => count_bias(0),
      I1 => count_bias(1),
      I2 => p_sum_1_reg(9),
      I3 => \^p_sum_1_reg[3]_0\,
      I4 => Q(7),
      O => \p_sum_1[8]_i_8_n_0\
    );
\p_sum_1[8]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EE0F11F0"
    )
        port map (
      I0 => count_bias(0),
      I1 => count_bias(1),
      I2 => p_sum_1_reg(8),
      I3 => \^p_sum_1_reg[3]_0\,
      I4 => Q(7),
      O => \p_sum_1[8]_i_9_n_0\
    );
\p_sum_1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1_reg[0]_i_1_n_7\,
      Q => \p_sum_1_reg_n_0_[0]\
    );
\p_sum_1_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \p_sum_1_reg[0]_i_1_n_0\,
      CO(2) => \p_sum_1_reg[0]_i_1_n_1\,
      CO(1) => \p_sum_1_reg[0]_i_1_n_2\,
      CO(0) => \p_sum_1_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => \in\(3 downto 2),
      DI(1 downto 0) => DI(1 downto 0),
      O(3) => \p_sum_1_reg[0]_i_1_n_4\,
      O(2) => \p_sum_1_reg[0]_i_1_n_5\,
      O(1) => \p_sum_1_reg[0]_i_1_n_6\,
      O(0) => \p_sum_1_reg[0]_i_1_n_7\,
      S(3) => \p_sum_1[0]_i_6_n_0\,
      S(2) => \p_sum_1[0]_i_7_n_0\,
      S(1) => \p_sum_1[0]_i_8_n_0\,
      S(0) => \p_sum_1[0]_i_9_n_0\
    );
\p_sum_1_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1_reg[8]_i_1_n_5\,
      Q => p_sum_1_reg(10)
    );
\p_sum_1_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1_reg[8]_i_1_n_4\,
      Q => p_sum_1_reg(11)
    );
\p_sum_1_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1_reg[12]_i_1_n_7\,
      Q => p_sum_1_reg(12)
    );
\p_sum_1_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \p_sum_1_reg[8]_i_1_n_0\,
      CO(3 downto 0) => \NLW_p_sum_1_reg[12]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_p_sum_1_reg[12]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \p_sum_1_reg[12]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => \p_sum_1[12]_i_2_n_0\
    );
\p_sum_1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1_reg[0]_i_1_n_6\,
      Q => \p_sum_1_reg_n_0_[1]\
    );
\p_sum_1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1_reg[0]_i_1_n_5\,
      Q => p_sum_1_reg(2)
    );
\p_sum_1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1_reg[0]_i_1_n_4\,
      Q => p_sum_1_reg(3)
    );
\p_sum_1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1_reg[4]_i_1_n_7\,
      Q => p_sum_1_reg(4)
    );
\p_sum_1_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \p_sum_1_reg[0]_i_1_n_0\,
      CO(3) => \p_sum_1_reg[4]_i_1_n_0\,
      CO(2) => \p_sum_1_reg[4]_i_1_n_1\,
      CO(1) => \p_sum_1_reg[4]_i_1_n_2\,
      CO(0) => \p_sum_1_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \p_sum_1[4]_i_2_n_0\,
      DI(2 downto 0) => \in\(6 downto 4),
      O(3) => \p_sum_1_reg[4]_i_1_n_4\,
      O(2) => \p_sum_1_reg[4]_i_1_n_5\,
      O(1) => \p_sum_1_reg[4]_i_1_n_6\,
      O(0) => \p_sum_1_reg[4]_i_1_n_7\,
      S(3) => \p_sum_1[4]_i_6_n_0\,
      S(2) => \p_sum_1[4]_i_7_n_0\,
      S(1) => \p_sum_1[4]_i_8_n_0\,
      S(0) => \p_sum_1[4]_i_9_n_0\
    );
\p_sum_1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1_reg[4]_i_1_n_6\,
      Q => p_sum_1_reg(5)
    );
\p_sum_1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1_reg[4]_i_1_n_5\,
      Q => p_sum_1_reg(6)
    );
\p_sum_1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1_reg[4]_i_1_n_4\,
      Q => p_sum_1_reg(7)
    );
\p_sum_1_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1_reg[8]_i_1_n_7\,
      Q => p_sum_1_reg(8)
    );
\p_sum_1_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \p_sum_1_reg[4]_i_1_n_0\,
      CO(3) => \p_sum_1_reg[8]_i_1_n_0\,
      CO(2) => \p_sum_1_reg[8]_i_1_n_1\,
      CO(1) => \p_sum_1_reg[8]_i_1_n_2\,
      CO(0) => \p_sum_1_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \in\(8),
      DI(2) => \p_sum_1[8]_i_3_n_0\,
      DI(1) => \p_sum_1[8]_i_4_n_0\,
      DI(0) => \p_sum_1[8]_i_5_n_0\,
      O(3) => \p_sum_1_reg[8]_i_1_n_4\,
      O(2) => \p_sum_1_reg[8]_i_1_n_5\,
      O(1) => \p_sum_1_reg[8]_i_1_n_6\,
      O(0) => \p_sum_1_reg[8]_i_1_n_7\,
      S(3) => \p_sum_1[8]_i_6_n_0\,
      S(2) => \p_sum_1[8]_i_7_n_0\,
      S(1) => \p_sum_1[8]_i_8_n_0\,
      S(0) => \p_sum_1[8]_i_9_n_0\
    );
\p_sum_1_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1_reg[8]_i_1_n_6\,
      Q => p_sum_1_reg(9)
    );
\status_res_del_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7000"
    )
        port map (
      I0 => \counter_temp_reg__0\(4),
      I1 => \counter_temp_reg__0\(5),
      I2 => curr_state_accu_i_2_n_0,
      I3 => curr_state_accu,
      O => \status_res_del_i_1__0_n_0\
    );
status_res_del_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \status_res_del_i_1__0_n_0\,
      Q => \^valid_res_fc1\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FC2_Controller is
  port (
    start_FC2 : out STD_LOGIC;
    DI : out STD_LOGIC_VECTOR ( 1 downto 0 );
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 5 downto 0 );
    \p_sum_1_reg[6]\ : out STD_LOGIC;
    \p_sum_1_reg[5]\ : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 1 downto 0 );
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    valid_res_FC1 : in STD_LOGIC;
    valid_FC2_in_IBUF : in STD_LOGIC;
    O : in STD_LOGIC_VECTOR ( 0 to 0 );
    \counter_temp_reg[1]\ : in STD_LOGIC;
    \p_sum_1_reg[7]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    status_res_del_reg : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \kernel_FC2_in[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end FC2_Controller;

architecture STRUCTURE of FC2_Controller is
  signal \^di\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \FC_input_del_reg_n_0_[0]\ : STD_LOGIC;
  signal \FC_input_del_reg_n_0_[1]\ : STD_LOGIC;
  signal \FC_input_del_reg_n_0_[2]\ : STD_LOGIC;
  signal \FC_weight_del_reg_n_0_[0]\ : STD_LOGIC;
  signal \FC_weight_del_reg_n_0_[1]\ : STD_LOGIC;
  signal \FC_weight_del_reg_n_0_[2]\ : STD_LOGIC;
  signal \FC_weight_del_reg_n_0_[3]\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \counter_in[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter_in[1]_i_1_n_0\ : STD_LOGIC;
  signal \counter_in_access[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \counter_in_access_reg_n_0_[0]\ : STD_LOGIC;
  signal \counter_in_access_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter_in_reg_n_0_[0]\ : STD_LOGIC;
  signal \counter_in_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter_w[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter_w[1]_i_1_n_0\ : STD_LOGIC;
  signal \counter_w_access[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \counter_w_access_reg_n_0_[0]\ : STD_LOGIC;
  signal \counter_w_access_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter_w_reg_n_0_[0]\ : STD_LOGIC;
  signal \counter_w_reg_n_0_[1]\ : STD_LOGIC;
  signal curr_state_access : STD_LOGIC;
  signal curr_state_buf : STD_LOGIC;
  signal \in_FC[0][0]_i_1_n_0\ : STD_LOGIC;
  signal \in_FC[0][1]_i_1_n_0\ : STD_LOGIC;
  signal \in_FC[0][2]_i_1_n_0\ : STD_LOGIC;
  signal \in_FC[1][0]_i_1_n_0\ : STD_LOGIC;
  signal \in_FC[1][1]_i_1_n_0\ : STD_LOGIC;
  signal \in_FC[1][2]_i_1_n_0\ : STD_LOGIC;
  signal \in_FC[2][0]_i_1_n_0\ : STD_LOGIC;
  signal \in_FC[2][1]_i_1_n_0\ : STD_LOGIC;
  signal \in_FC[2][2]_i_1_n_0\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[0][0]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[0][1]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[0][2]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[1][0]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[1][1]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[1][2]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[2][0]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[2][1]\ : STD_LOGIC;
  signal \in_FC_reg_n_0_[2][2]\ : STD_LOGIC;
  signal \mul_FC[1]_i_2__0_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_3__0_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_4__0_n_0\ : STD_LOGIC;
  signal \mul_FC[1]_i_5__0_n_0\ : STD_LOGIC;
  signal \mul_FC[2]_i_2_n_0\ : STD_LOGIC;
  signal \mul_FC[2]_i_3_n_0\ : STD_LOGIC;
  signal \mul_FC[2]_i_4_n_0\ : STD_LOGIC;
  signal \mul_FC[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \mul_FC[4]_i_2_n_0\ : STD_LOGIC;
  signal \mul_FC[4]_i_3_n_0\ : STD_LOGIC;
  signal \mul_FC[4]_i_4_n_0\ : STD_LOGIC;
  signal \mul_FC[4]_i_5_n_0\ : STD_LOGIC;
  signal \mul_FC[4]_i_6_n_0\ : STD_LOGIC;
  signal \mul_FC[6]_i_2_n_0\ : STD_LOGIC;
  signal \mul_FC[6]_i_3_n_0\ : STD_LOGIC;
  signal \mul_FC[6]_i_4_n_0\ : STD_LOGIC;
  signal \mul_FC[6]_i_5_n_0\ : STD_LOGIC;
  signal \mul_FC[6]_i_6_n_0\ : STD_LOGIC;
  signal \mul_FC[6]_i_7_n_0\ : STD_LOGIC;
  signal next_counter_in_access : STD_LOGIC_VECTOR ( 0 to 0 );
  signal next_counter_w_access : STD_LOGIC_VECTOR ( 0 to 0 );
  signal next_mul_FC : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal next_state_access : STD_LOGIC;
  signal next_state_buf : STD_LOGIC;
  signal \next_w_FC[0]_2\ : STD_LOGIC;
  signal \next_w_FC[1]_0\ : STD_LOGIC;
  signal \next_w_FC[2]_1\ : STD_LOGIC;
  signal start : STD_LOGIC;
  signal valid_data_in_del : STD_LOGIC;
  signal valid_data_weight_del : STD_LOGIC;
  signal \w_FC_reg_n_0_[0][0]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[0][1]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[0][2]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[0][3]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[1][0]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[1][1]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[1][2]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[1][3]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[2][0]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[2][1]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[2][2]\ : STD_LOGIC;
  signal \w_FC_reg_n_0_[2][3]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \counter_in[0]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \counter_in[1]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \counter_in_access[0]_i_1__0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \counter_in_access[1]_i_1__0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \counter_w[0]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \counter_w[1]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \counter_w_access[0]_i_1__0\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \counter_w_access[1]_i_1__0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \curr_state_buf_i_1__0\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \mul_FC[0]_i_1__0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \mul_FC[1]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \mul_FC[2]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \mul_FC[2]_i_3\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \mul_FC[2]_i_4\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \mul_FC[3]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \mul_FC[4]_i_3\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \mul_FC[4]_i_4\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \mul_FC[4]_i_6\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \mul_FC[5]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \mul_FC[6]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \mul_FC[6]_i_3\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \p_sum_1[5]_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \p_sum_1[9]_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \start_out_i_1__0\ : label is "soft_lutpair31";
begin
  DI(1 downto 0) <= \^di\(1 downto 0);
  Q(5 downto 0) <= \^q\(5 downto 0);
\FC_input_del_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => status_res_del_reg(0),
      Q => \FC_input_del_reg_n_0_[0]\
    );
\FC_input_del_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => status_res_del_reg(1),
      Q => \FC_input_del_reg_n_0_[1]\
    );
\FC_input_del_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => status_res_del_reg(2),
      Q => \FC_input_del_reg_n_0_[2]\
    );
\FC_weight_del_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \kernel_FC2_in[3]\(0),
      Q => \FC_weight_del_reg_n_0_[0]\
    );
\FC_weight_del_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \kernel_FC2_in[3]\(1),
      Q => \FC_weight_del_reg_n_0_[1]\
    );
\FC_weight_del_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \kernel_FC2_in[3]\(2),
      Q => \FC_weight_del_reg_n_0_[2]\
    );
\FC_weight_del_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \kernel_FC2_in[3]\(3),
      Q => \FC_weight_del_reg_n_0_[3]\
    );
\counter_in[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => valid_data_in_del,
      I1 => curr_state_buf,
      I2 => \counter_in_reg_n_0_[0]\,
      O => \counter_in[0]_i_1_n_0\
    );
\counter_in[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7080"
    )
        port map (
      I0 => \counter_in_reg_n_0_[0]\,
      I1 => valid_data_in_del,
      I2 => curr_state_buf,
      I3 => \counter_in_reg_n_0_[1]\,
      O => \counter_in[1]_i_1_n_0\
    );
\counter_in_access[0]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state_access,
      I1 => \counter_in_access_reg_n_0_[0]\,
      O => next_counter_in_access(0)
    );
\counter_in_access[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \counter_in_access_reg_n_0_[1]\,
      I1 => \counter_in_access_reg_n_0_[0]\,
      I2 => curr_state_access,
      O => \counter_in_access[1]_i_1__0_n_0\
    );
\counter_in_access_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_counter_in_access(0),
      Q => \counter_in_access_reg_n_0_[0]\
    );
\counter_in_access_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \counter_in_access[1]_i_1__0_n_0\,
      Q => \counter_in_access_reg_n_0_[1]\
    );
\counter_in_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \counter_in[0]_i_1_n_0\,
      Q => \counter_in_reg_n_0_[0]\
    );
\counter_in_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \counter_in[1]_i_1_n_0\,
      Q => \counter_in_reg_n_0_[1]\
    );
\counter_w[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => valid_data_weight_del,
      I1 => curr_state_buf,
      I2 => \counter_w_reg_n_0_[0]\,
      O => \counter_w[0]_i_1_n_0\
    );
\counter_w[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7080"
    )
        port map (
      I0 => \counter_w_reg_n_0_[0]\,
      I1 => valid_data_weight_del,
      I2 => curr_state_buf,
      I3 => \counter_w_reg_n_0_[1]\,
      O => \counter_w[1]_i_1_n_0\
    );
\counter_w_access[0]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state_access,
      I1 => \counter_w_access_reg_n_0_[0]\,
      O => next_counter_w_access(0)
    );
\counter_w_access[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \counter_w_access_reg_n_0_[1]\,
      I1 => \counter_w_access_reg_n_0_[0]\,
      I2 => curr_state_access,
      O => \counter_w_access[1]_i_1__0_n_0\
    );
\counter_w_access_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_counter_w_access(0),
      Q => \counter_w_access_reg_n_0_[0]\
    );
\counter_w_access_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \counter_w_access[1]_i_1__0_n_0\,
      Q => \counter_w_access_reg_n_0_[1]\
    );
\counter_w_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \counter_w[0]_i_1_n_0\,
      Q => \counter_w_reg_n_0_[0]\
    );
\counter_w_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \counter_w[1]_i_1_n_0\,
      Q => \counter_w_reg_n_0_[1]\
    );
\curr_state_access_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFB0B0B0B0B0B0B0"
    )
        port map (
      I0 => \counter_w_access_reg_n_0_[0]\,
      I1 => \counter_w_access_reg_n_0_[1]\,
      I2 => curr_state_access,
      I3 => curr_state_buf,
      I4 => \counter_in_reg_n_0_[1]\,
      I5 => \counter_in_reg_n_0_[0]\,
      O => next_state_access
    );
curr_state_access_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_state_access,
      Q => curr_state_access
    );
\curr_state_buf_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F7F7F70"
    )
        port map (
      I0 => \counter_in_reg_n_0_[0]\,
      I1 => \counter_in_reg_n_0_[1]\,
      I2 => curr_state_buf,
      I3 => valid_res_FC1,
      I4 => valid_FC2_in_IBUF,
      O => next_state_buf
    );
curr_state_buf_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_state_buf,
      Q => curr_state_buf
    );
\in_FC[0][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00002000"
    )
        port map (
      I0 => \FC_input_del_reg_n_0_[0]\,
      I1 => \counter_in_reg_n_0_[0]\,
      I2 => curr_state_buf,
      I3 => valid_data_in_del,
      I4 => \counter_in_reg_n_0_[1]\,
      I5 => \in_FC_reg_n_0_[0][0]\,
      O => \in_FC[0][0]_i_1_n_0\
    );
\in_FC[0][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00002000"
    )
        port map (
      I0 => \FC_input_del_reg_n_0_[1]\,
      I1 => \counter_in_reg_n_0_[0]\,
      I2 => curr_state_buf,
      I3 => valid_data_in_del,
      I4 => \counter_in_reg_n_0_[1]\,
      I5 => \in_FC_reg_n_0_[0][1]\,
      O => \in_FC[0][1]_i_1_n_0\
    );
\in_FC[0][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00002000"
    )
        port map (
      I0 => \FC_input_del_reg_n_0_[2]\,
      I1 => \counter_in_reg_n_0_[0]\,
      I2 => curr_state_buf,
      I3 => valid_data_in_del,
      I4 => \counter_in_reg_n_0_[1]\,
      I5 => \in_FC_reg_n_0_[0][2]\,
      O => \in_FC[0][2]_i_1_n_0\
    );
\in_FC[1][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFFF00008000"
    )
        port map (
      I0 => \FC_input_del_reg_n_0_[0]\,
      I1 => \counter_in_reg_n_0_[0]\,
      I2 => curr_state_buf,
      I3 => valid_data_in_del,
      I4 => \counter_in_reg_n_0_[1]\,
      I5 => \in_FC_reg_n_0_[1][0]\,
      O => \in_FC[1][0]_i_1_n_0\
    );
\in_FC[1][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFFF00008000"
    )
        port map (
      I0 => \FC_input_del_reg_n_0_[1]\,
      I1 => \counter_in_reg_n_0_[0]\,
      I2 => curr_state_buf,
      I3 => valid_data_in_del,
      I4 => \counter_in_reg_n_0_[1]\,
      I5 => \in_FC_reg_n_0_[1][1]\,
      O => \in_FC[1][1]_i_1_n_0\
    );
\in_FC[1][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFFF00008000"
    )
        port map (
      I0 => \FC_input_del_reg_n_0_[2]\,
      I1 => \counter_in_reg_n_0_[0]\,
      I2 => curr_state_buf,
      I3 => valid_data_in_del,
      I4 => \counter_in_reg_n_0_[1]\,
      I5 => \in_FC_reg_n_0_[1][2]\,
      O => \in_FC[1][2]_i_1_n_0\
    );
\in_FC[2][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFFFFF20000000"
    )
        port map (
      I0 => \FC_input_del_reg_n_0_[0]\,
      I1 => \counter_in_reg_n_0_[0]\,
      I2 => curr_state_buf,
      I3 => valid_data_in_del,
      I4 => \counter_in_reg_n_0_[1]\,
      I5 => \in_FC_reg_n_0_[2][0]\,
      O => \in_FC[2][0]_i_1_n_0\
    );
\in_FC[2][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFFFFF20000000"
    )
        port map (
      I0 => \FC_input_del_reg_n_0_[1]\,
      I1 => \counter_in_reg_n_0_[0]\,
      I2 => curr_state_buf,
      I3 => valid_data_in_del,
      I4 => \counter_in_reg_n_0_[1]\,
      I5 => \in_FC_reg_n_0_[2][1]\,
      O => \in_FC[2][1]_i_1_n_0\
    );
\in_FC[2][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFFFFF20000000"
    )
        port map (
      I0 => \FC_input_del_reg_n_0_[2]\,
      I1 => \counter_in_reg_n_0_[0]\,
      I2 => curr_state_buf,
      I3 => valid_data_in_del,
      I4 => \counter_in_reg_n_0_[1]\,
      I5 => \in_FC_reg_n_0_[2][2]\,
      O => \in_FC[2][2]_i_1_n_0\
    );
\in_FC_reg[0][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \in_FC[0][0]_i_1_n_0\,
      Q => \in_FC_reg_n_0_[0][0]\
    );
\in_FC_reg[0][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \in_FC[0][1]_i_1_n_0\,
      Q => \in_FC_reg_n_0_[0][1]\
    );
\in_FC_reg[0][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \in_FC[0][2]_i_1_n_0\,
      Q => \in_FC_reg_n_0_[0][2]\
    );
\in_FC_reg[1][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \in_FC[1][0]_i_1_n_0\,
      Q => \in_FC_reg_n_0_[1][0]\
    );
\in_FC_reg[1][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \in_FC[1][1]_i_1_n_0\,
      Q => \in_FC_reg_n_0_[1][1]\
    );
\in_FC_reg[1][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \in_FC[1][2]_i_1_n_0\,
      Q => \in_FC_reg_n_0_[1][2]\
    );
\in_FC_reg[2][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \in_FC[2][0]_i_1_n_0\,
      Q => \in_FC_reg_n_0_[2][0]\
    );
\in_FC_reg[2][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \in_FC[2][1]_i_1_n_0\,
      Q => \in_FC_reg_n_0_[2][1]\
    );
\in_FC_reg[2][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \in_FC[2][2]_i_1_n_0\,
      Q => \in_FC_reg_n_0_[2][2]\
    );
\mul_FC[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \mul_FC[1]_i_3__0_n_0\,
      I1 => \mul_FC[1]_i_5__0_n_0\,
      I2 => curr_state_access,
      O => next_mul_FC(0)
    );
\mul_FC[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2A808080"
    )
        port map (
      I0 => curr_state_access,
      I1 => \mul_FC[1]_i_2__0_n_0\,
      I2 => \mul_FC[1]_i_3__0_n_0\,
      I3 => \mul_FC[1]_i_4__0_n_0\,
      I4 => \mul_FC[1]_i_5__0_n_0\,
      O => next_mul_FC(1)
    );
\mul_FC[1]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \w_FC_reg_n_0_[1][1]\,
      I1 => \counter_w_access_reg_n_0_[0]\,
      I2 => \w_FC_reg_n_0_[2][1]\,
      I3 => \counter_w_access_reg_n_0_[1]\,
      I4 => \w_FC_reg_n_0_[0][1]\,
      O => \mul_FC[1]_i_2__0_n_0\
    );
\mul_FC[1]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \in_FC_reg_n_0_[1][0]\,
      I1 => \counter_in_access_reg_n_0_[0]\,
      I2 => \in_FC_reg_n_0_[2][0]\,
      I3 => \counter_in_access_reg_n_0_[1]\,
      I4 => \in_FC_reg_n_0_[0][0]\,
      O => \mul_FC[1]_i_3__0_n_0\
    );
\mul_FC[1]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \in_FC_reg_n_0_[1][1]\,
      I1 => \counter_in_access_reg_n_0_[0]\,
      I2 => \in_FC_reg_n_0_[2][1]\,
      I3 => \counter_in_access_reg_n_0_[1]\,
      I4 => \in_FC_reg_n_0_[0][1]\,
      O => \mul_FC[1]_i_4__0_n_0\
    );
\mul_FC[1]_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \w_FC_reg_n_0_[1][0]\,
      I1 => \counter_w_access_reg_n_0_[0]\,
      I2 => \w_FC_reg_n_0_[2][0]\,
      I3 => \counter_w_access_reg_n_0_[1]\,
      I4 => \w_FC_reg_n_0_[0][0]\,
      O => \mul_FC[1]_i_5__0_n_0\
    );
\mul_FC[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2882"
    )
        port map (
      I0 => curr_state_access,
      I1 => \mul_FC[2]_i_2_n_0\,
      I2 => \mul_FC[2]_i_3_n_0\,
      I3 => \mul_FC[2]_i_4_n_0\,
      O => next_mul_FC(2)
    );
\mul_FC[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0AA8080000A808"
    )
        port map (
      I0 => \mul_FC[1]_i_3__0_n_0\,
      I1 => \w_FC_reg_n_0_[0][2]\,
      I2 => \counter_w_access_reg_n_0_[1]\,
      I3 => \w_FC_reg_n_0_[2][2]\,
      I4 => \counter_w_access_reg_n_0_[0]\,
      I5 => \w_FC_reg_n_0_[1][2]\,
      O => \mul_FC[2]_i_2_n_0\
    );
\mul_FC[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7888"
    )
        port map (
      I0 => \mul_FC[1]_i_4__0_n_0\,
      I1 => \mul_FC[1]_i_2__0_n_0\,
      I2 => \mul_FC[1]_i_5__0_n_0\,
      I3 => \mul_FC[6]_i_4_n_0\,
      O => \mul_FC[2]_i_3_n_0\
    );
\mul_FC[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \mul_FC[1]_i_5__0_n_0\,
      I1 => \mul_FC[1]_i_4__0_n_0\,
      I2 => \mul_FC[1]_i_3__0_n_0\,
      I3 => \mul_FC[1]_i_2__0_n_0\,
      O => \mul_FC[2]_i_4_n_0\
    );
\mul_FC[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2882"
    )
        port map (
      I0 => curr_state_access,
      I1 => \mul_FC[4]_i_4_n_0\,
      I2 => \mul_FC[4]_i_3_n_0\,
      I3 => \mul_FC[4]_i_2_n_0\,
      O => next_mul_FC(3)
    );
\mul_FC[4]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2BD4D42B00000000"
    )
        port map (
      I0 => \mul_FC[4]_i_2_n_0\,
      I1 => \mul_FC[4]_i_3_n_0\,
      I2 => \mul_FC[4]_i_4_n_0\,
      I3 => \mul_FC[4]_i_5_n_0\,
      I4 => \mul_FC[4]_i_6_n_0\,
      I5 => curr_state_access,
      O => \mul_FC[4]_i_1__0_n_0\
    );
\mul_FC[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1F5FFFFF3FFF7FFF"
    )
        port map (
      I0 => \mul_FC[1]_i_5__0_n_0\,
      I1 => \mul_FC[1]_i_4__0_n_0\,
      I2 => \mul_FC[1]_i_3__0_n_0\,
      I3 => \mul_FC[1]_i_2__0_n_0\,
      I4 => \mul_FC[6]_i_7_n_0\,
      I5 => \mul_FC[6]_i_4_n_0\,
      O => \mul_FC[4]_i_2_n_0\
    );
\mul_FC[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \mul_FC[1]_i_3__0_n_0\,
      I1 => \mul_FC[6]_i_5_n_0\,
      I2 => \mul_FC[6]_i_6_n_0\,
      O => \mul_FC[4]_i_3_n_0\
    );
\mul_FC[4]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8FFF"
    )
        port map (
      I0 => \mul_FC[1]_i_4__0_n_0\,
      I1 => \mul_FC[1]_i_2__0_n_0\,
      I2 => \mul_FC[1]_i_5__0_n_0\,
      I3 => \mul_FC[6]_i_4_n_0\,
      O => \mul_FC[4]_i_4_n_0\
    );
\mul_FC[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => \mul_FC[1]_i_3__0_n_0\,
      I1 => \mul_FC[6]_i_5_n_0\,
      I2 => \mul_FC[6]_i_6_n_0\,
      O => \mul_FC[4]_i_5_n_0\
    );
\mul_FC[4]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1DC06AC0"
    )
        port map (
      I0 => \mul_FC[1]_i_2__0_n_0\,
      I1 => \mul_FC[1]_i_4__0_n_0\,
      I2 => \mul_FC[6]_i_5_n_0\,
      I3 => \mul_FC[6]_i_4_n_0\,
      I4 => \mul_FC[6]_i_7_n_0\,
      O => \mul_FC[4]_i_6_n_0\
    );
\mul_FC[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"28888222"
    )
        port map (
      I0 => curr_state_access,
      I1 => \mul_FC[6]_i_3_n_0\,
      I2 => \mul_FC[6]_i_5_n_0\,
      I3 => \mul_FC[6]_i_4_n_0\,
      I4 => \mul_FC[6]_i_2_n_0\,
      O => next_mul_FC(5)
    );
\mul_FC[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00D0D0D0"
    )
        port map (
      I0 => \mul_FC[6]_i_2_n_0\,
      I1 => \mul_FC[6]_i_3_n_0\,
      I2 => curr_state_access,
      I3 => \mul_FC[6]_i_4_n_0\,
      I4 => \mul_FC[6]_i_5_n_0\,
      O => next_mul_FC(6)
    );
\mul_FC[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000007FFF077F"
    )
        port map (
      I0 => \mul_FC[1]_i_3__0_n_0\,
      I1 => \mul_FC[6]_i_5_n_0\,
      I2 => \mul_FC[6]_i_6_n_0\,
      I3 => \mul_FC[4]_i_2_n_0\,
      I4 => \mul_FC[4]_i_4_n_0\,
      I5 => \mul_FC[4]_i_6_n_0\,
      O => \mul_FC[6]_i_2_n_0\
    );
\mul_FC[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8800000"
    )
        port map (
      I0 => \mul_FC[6]_i_5_n_0\,
      I1 => \mul_FC[1]_i_4__0_n_0\,
      I2 => \mul_FC[6]_i_7_n_0\,
      I3 => \mul_FC[1]_i_2__0_n_0\,
      I4 => \mul_FC[6]_i_4_n_0\,
      O => \mul_FC[6]_i_3_n_0\
    );
\mul_FC[6]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \in_FC_reg_n_0_[1][2]\,
      I1 => \counter_in_access_reg_n_0_[0]\,
      I2 => \in_FC_reg_n_0_[2][2]\,
      I3 => \counter_in_access_reg_n_0_[1]\,
      I4 => \in_FC_reg_n_0_[0][2]\,
      O => \mul_FC[6]_i_4_n_0\
    );
\mul_FC[6]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \w_FC_reg_n_0_[1][3]\,
      I1 => \counter_w_access_reg_n_0_[0]\,
      I2 => \w_FC_reg_n_0_[2][3]\,
      I3 => \counter_w_access_reg_n_0_[1]\,
      I4 => \w_FC_reg_n_0_[0][3]\,
      O => \mul_FC[6]_i_5_n_0\
    );
\mul_FC[6]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8777"
    )
        port map (
      I0 => \mul_FC[6]_i_4_n_0\,
      I1 => \mul_FC[1]_i_2__0_n_0\,
      I2 => \mul_FC[6]_i_7_n_0\,
      I3 => \mul_FC[1]_i_4__0_n_0\,
      O => \mul_FC[6]_i_6_n_0\
    );
\mul_FC[6]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \w_FC_reg_n_0_[1][2]\,
      I1 => \counter_w_access_reg_n_0_[0]\,
      I2 => \w_FC_reg_n_0_[2][2]\,
      I3 => \counter_w_access_reg_n_0_[1]\,
      I4 => \w_FC_reg_n_0_[0][2]\,
      O => \mul_FC[6]_i_7_n_0\
    );
\mul_FC_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_mul_FC(0),
      Q => \^q\(0)
    );
\mul_FC_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_mul_FC(1),
      Q => \^q\(1)
    );
\mul_FC_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_mul_FC(2),
      Q => \^q\(2)
    );
\mul_FC_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_mul_FC(3),
      Q => \^q\(3)
    );
\mul_FC_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \mul_FC[4]_i_1__0_n_0\,
      Q => \^q\(4)
    );
\mul_FC_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_mul_FC(5),
      Q => \^q\(5)
    );
\mul_FC_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_mul_FC(6),
      Q => \^di\(0)
    );
\next_p_sum_10_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^di\(0),
      O => \^di\(1)
    );
\next_p_sum_10_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^di\(0),
      I1 => \p_sum_1_reg[7]\(1),
      O => S(1)
    );
\next_p_sum_10_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^di\(0),
      I1 => \p_sum_1_reg[7]\(0),
      O => S(0)
    );
\p_sum_1[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"222EEEEEEEE22222"
    )
        port map (
      I0 => O(0),
      I1 => \counter_temp_reg[1]\,
      I2 => \^q\(1),
      I3 => \^q\(2),
      I4 => \^q\(3),
      I5 => \^q\(4),
      O => D(0)
    );
\p_sum_1[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A800"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(1),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \p_sum_1_reg[5]\
    );
\p_sum_1[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88800000"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => \^q\(1),
      I4 => \^q\(4),
      O => \p_sum_1_reg[6]\
    );
\start_out_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => curr_state_buf,
      I1 => \counter_in_reg_n_0_[1]\,
      I2 => \counter_in_reg_n_0_[0]\,
      O => start
    );
start_out_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => start,
      Q => start_FC2
    );
valid_data_in_del_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => valid_res_FC1,
      Q => valid_data_in_del
    );
valid_data_weight_del_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => valid_FC2_in_IBUF,
      Q => valid_data_weight_del
    );
\w_FC[0][3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => \counter_w_reg_n_0_[0]\,
      I1 => curr_state_buf,
      I2 => valid_data_weight_del,
      I3 => \counter_w_reg_n_0_[1]\,
      O => \next_w_FC[0]_2\
    );
\w_FC[1][3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => valid_data_weight_del,
      I1 => \counter_w_reg_n_0_[1]\,
      I2 => curr_state_buf,
      I3 => \counter_w_reg_n_0_[0]\,
      O => \next_w_FC[1]_0\
    );
\w_FC[2][3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => valid_data_weight_del,
      I1 => curr_state_buf,
      I2 => \counter_w_reg_n_0_[0]\,
      I3 => \counter_w_reg_n_0_[1]\,
      O => \next_w_FC[2]_1\
    );
\w_FC_reg[0][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[0]_2\,
      CLR => AR(0),
      D => \FC_weight_del_reg_n_0_[0]\,
      Q => \w_FC_reg_n_0_[0][0]\
    );
\w_FC_reg[0][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[0]_2\,
      CLR => AR(0),
      D => \FC_weight_del_reg_n_0_[1]\,
      Q => \w_FC_reg_n_0_[0][1]\
    );
\w_FC_reg[0][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[0]_2\,
      CLR => AR(0),
      D => \FC_weight_del_reg_n_0_[2]\,
      Q => \w_FC_reg_n_0_[0][2]\
    );
\w_FC_reg[0][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[0]_2\,
      CLR => AR(0),
      D => \FC_weight_del_reg_n_0_[3]\,
      Q => \w_FC_reg_n_0_[0][3]\
    );
\w_FC_reg[1][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[1]_0\,
      CLR => AR(0),
      D => \FC_weight_del_reg_n_0_[0]\,
      Q => \w_FC_reg_n_0_[1][0]\
    );
\w_FC_reg[1][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[1]_0\,
      CLR => AR(0),
      D => \FC_weight_del_reg_n_0_[1]\,
      Q => \w_FC_reg_n_0_[1][1]\
    );
\w_FC_reg[1][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[1]_0\,
      CLR => AR(0),
      D => \FC_weight_del_reg_n_0_[2]\,
      Q => \w_FC_reg_n_0_[1][2]\
    );
\w_FC_reg[1][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[1]_0\,
      CLR => AR(0),
      D => \FC_weight_del_reg_n_0_[3]\,
      Q => \w_FC_reg_n_0_[1][3]\
    );
\w_FC_reg[2][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[2]_1\,
      CLR => AR(0),
      D => \FC_weight_del_reg_n_0_[0]\,
      Q => \w_FC_reg_n_0_[2][0]\
    );
\w_FC_reg[2][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[2]_1\,
      CLR => AR(0),
      D => \FC_weight_del_reg_n_0_[1]\,
      Q => \w_FC_reg_n_0_[2][1]\
    );
\w_FC_reg[2][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[2]_1\,
      CLR => AR(0),
      D => \FC_weight_del_reg_n_0_[2]\,
      Q => \w_FC_reg_n_0_[2][2]\
    );
\w_FC_reg[2][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \next_w_FC[2]_1\,
      CLR => AR(0),
      D => \FC_weight_del_reg_n_0_[3]\,
      Q => \w_FC_reg_n_0_[2][3]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FC2_MU is
  port (
    valid_output_OBUF : out STD_LOGIC;
    O : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \p_sum_1_reg[4]_0\ : out STD_LOGIC;
    output_OBUF : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    DI : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \mul_FC_reg[5]\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \mul_FC_reg[4]\ : in STD_LOGIC;
    \mul_FC_reg[5]_0\ : in STD_LOGIC;
    start_FC2 : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end FC2_MU;

architecture STRUCTURE of FC2_MU is
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \counter_temp[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \counter_temp_reg_n_0_[0]\ : STD_LOGIC;
  signal \counter_temp_reg_n_0_[1]\ : STD_LOGIC;
  signal curr_state_accu : STD_LOGIC;
  signal \curr_state_accu_i_1__0_n_0\ : STD_LOGIC;
  signal next_counter_temp : STD_LOGIC_VECTOR ( 1 to 1 );
  signal next_p_sum_10 : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \next_p_sum_10_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \next_p_sum_10_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \next_p_sum_10_carry__0_n_0\ : STD_LOGIC;
  signal \next_p_sum_10_carry__0_n_1\ : STD_LOGIC;
  signal \next_p_sum_10_carry__0_n_2\ : STD_LOGIC;
  signal \next_p_sum_10_carry__0_n_3\ : STD_LOGIC;
  signal \next_p_sum_10_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \next_p_sum_10_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \next_p_sum_10_carry__1_n_3\ : STD_LOGIC;
  signal next_p_sum_10_carry_i_1_n_0 : STD_LOGIC;
  signal next_p_sum_10_carry_i_2_n_0 : STD_LOGIC;
  signal next_p_sum_10_carry_i_3_n_0 : STD_LOGIC;
  signal next_p_sum_10_carry_i_4_n_0 : STD_LOGIC;
  signal next_p_sum_10_carry_n_0 : STD_LOGIC;
  signal next_p_sum_10_carry_n_1 : STD_LOGIC;
  signal next_p_sum_10_carry_n_2 : STD_LOGIC;
  signal next_p_sum_10_carry_n_3 : STD_LOGIC;
  signal \p_sum_1[0]_i_1_n_0\ : STD_LOGIC;
  signal \p_sum_1[1]_i_1_n_0\ : STD_LOGIC;
  signal \p_sum_1[2]_i_1_n_0\ : STD_LOGIC;
  signal \p_sum_1[3]_i_1_n_0\ : STD_LOGIC;
  signal \p_sum_1[5]_i_1_n_0\ : STD_LOGIC;
  signal \p_sum_1[6]_i_1_n_0\ : STD_LOGIC;
  signal \p_sum_1[7]_i_1_n_0\ : STD_LOGIC;
  signal \p_sum_1[8]_i_1_n_0\ : STD_LOGIC;
  signal \p_sum_1[9]_i_1_n_0\ : STD_LOGIC;
  signal \p_sum_1_reg_n_0_[0]\ : STD_LOGIC;
  signal \p_sum_1_reg_n_0_[1]\ : STD_LOGIC;
  signal \p_sum_1_reg_n_0_[2]\ : STD_LOGIC;
  signal \p_sum_1_reg_n_0_[3]\ : STD_LOGIC;
  signal \p_sum_1_reg_n_0_[4]\ : STD_LOGIC;
  signal \p_sum_1_reg_n_0_[5]\ : STD_LOGIC;
  signal \p_sum_1_reg_n_0_[8]\ : STD_LOGIC;
  signal res_FC2 : STD_LOGIC_VECTOR ( 9 to 9 );
  signal status_res : STD_LOGIC;
  signal \^valid_output_obuf\ : STD_LOGIC;
  signal \NLW_next_p_sum_10_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_next_p_sum_10_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \counter_temp[0]_i_1__0\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \counter_temp[1]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \curr_state_accu_i_1__0\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \p_sum_1[4]_i_2__0\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \p_sum_1[8]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of status_res_del_i_1 : label is "soft_lutpair40";
begin
  Q(1 downto 0) <= \^q\(1 downto 0);
  valid_output_OBUF <= \^valid_output_obuf\;
\counter_temp[0]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state_accu,
      I1 => \counter_temp_reg_n_0_[0]\,
      O => \counter_temp[0]_i_1__0_n_0\
    );
\counter_temp[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => curr_state_accu,
      I1 => \counter_temp_reg_n_0_[1]\,
      I2 => \counter_temp_reg_n_0_[0]\,
      O => next_counter_temp(1)
    );
\counter_temp_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \counter_temp[0]_i_1__0_n_0\,
      Q => \counter_temp_reg_n_0_[0]\
    );
\counter_temp_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_counter_temp(1),
      Q => \counter_temp_reg_n_0_[1]\
    );
\curr_state_accu_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E2EE"
    )
        port map (
      I0 => start_FC2,
      I1 => curr_state_accu,
      I2 => \counter_temp_reg_n_0_[0]\,
      I3 => \counter_temp_reg_n_0_[1]\,
      O => \curr_state_accu_i_1__0_n_0\
    );
curr_state_accu_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \curr_state_accu_i_1__0_n_0\,
      Q => curr_state_accu
    );
next_p_sum_10_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => next_p_sum_10_carry_n_0,
      CO(2) => next_p_sum_10_carry_n_1,
      CO(1) => next_p_sum_10_carry_n_2,
      CO(0) => next_p_sum_10_carry_n_3,
      CYINIT => '0',
      DI(3) => \p_sum_1_reg_n_0_[3]\,
      DI(2) => \p_sum_1_reg_n_0_[2]\,
      DI(1) => \p_sum_1_reg_n_0_[1]\,
      DI(0) => \p_sum_1_reg_n_0_[0]\,
      O(3 downto 0) => next_p_sum_10(3 downto 0),
      S(3) => next_p_sum_10_carry_i_1_n_0,
      S(2) => next_p_sum_10_carry_i_2_n_0,
      S(1) => next_p_sum_10_carry_i_3_n_0,
      S(0) => next_p_sum_10_carry_i_4_n_0
    );
\next_p_sum_10_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => next_p_sum_10_carry_n_0,
      CO(3) => \next_p_sum_10_carry__0_n_0\,
      CO(2) => \next_p_sum_10_carry__0_n_1\,
      CO(1) => \next_p_sum_10_carry__0_n_2\,
      CO(0) => \next_p_sum_10_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => DI(1 downto 0),
      DI(1) => \p_sum_1_reg_n_0_[5]\,
      DI(0) => \p_sum_1_reg_n_0_[4]\,
      O(3 downto 1) => next_p_sum_10(7 downto 5),
      O(0) => O(0),
      S(3 downto 2) => S(1 downto 0),
      S(1) => \next_p_sum_10_carry__0_i_4_n_0\,
      S(0) => \next_p_sum_10_carry__0_i_5_n_0\
    );
\next_p_sum_10_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \p_sum_1_reg_n_0_[5]\,
      I1 => \mul_FC_reg[5]\(5),
      O => \next_p_sum_10_carry__0_i_4_n_0\
    );
\next_p_sum_10_carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \p_sum_1_reg_n_0_[4]\,
      I1 => \mul_FC_reg[5]\(4),
      O => \next_p_sum_10_carry__0_i_5_n_0\
    );
\next_p_sum_10_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_p_sum_10_carry__0_n_0\,
      CO(3 downto 1) => \NLW_next_p_sum_10_carry__1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \next_p_sum_10_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \^q\(1),
      O(3 downto 2) => \NLW_next_p_sum_10_carry__1_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => next_p_sum_10(9 downto 8),
      S(3 downto 2) => B"00",
      S(1) => \next_p_sum_10_carry__1_i_1_n_0\,
      S(0) => \next_p_sum_10_carry__1_i_2_n_0\
    );
\next_p_sum_10_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \p_sum_1_reg_n_0_[8]\,
      I1 => res_FC2(9),
      O => \next_p_sum_10_carry__1_i_1_n_0\
    );
\next_p_sum_10_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(1),
      I1 => \p_sum_1_reg_n_0_[8]\,
      O => \next_p_sum_10_carry__1_i_2_n_0\
    );
next_p_sum_10_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \p_sum_1_reg_n_0_[3]\,
      I1 => \mul_FC_reg[5]\(3),
      O => next_p_sum_10_carry_i_1_n_0
    );
next_p_sum_10_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \p_sum_1_reg_n_0_[2]\,
      I1 => \mul_FC_reg[5]\(2),
      O => next_p_sum_10_carry_i_2_n_0
    );
next_p_sum_10_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \p_sum_1_reg_n_0_[1]\,
      I1 => \mul_FC_reg[5]\(1),
      O => next_p_sum_10_carry_i_3_n_0
    );
next_p_sum_10_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \p_sum_1_reg_n_0_[0]\,
      I1 => \mul_FC_reg[5]\(0),
      O => next_p_sum_10_carry_i_4_n_0
    );
\output[0]_INST_0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^valid_output_obuf\,
      I1 => res_FC2(9),
      O => output_OBUF(0)
    );
\p_sum_1[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => next_p_sum_10(0),
      I1 => \counter_temp_reg_n_0_[1]\,
      I2 => \counter_temp_reg_n_0_[0]\,
      I3 => \mul_FC_reg[5]\(0),
      O => \p_sum_1[0]_i_1_n_0\
    );
\p_sum_1[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8AB"
    )
        port map (
      I0 => next_p_sum_10(1),
      I1 => \counter_temp_reg_n_0_[1]\,
      I2 => \counter_temp_reg_n_0_[0]\,
      I3 => \mul_FC_reg[5]\(1),
      O => \p_sum_1[1]_i_1_n_0\
    );
\p_sum_1[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABA8A8AB"
    )
        port map (
      I0 => next_p_sum_10(2),
      I1 => \counter_temp_reg_n_0_[1]\,
      I2 => \counter_temp_reg_n_0_[0]\,
      I3 => \mul_FC_reg[5]\(1),
      I4 => \mul_FC_reg[5]\(2),
      O => \p_sum_1[2]_i_1_n_0\
    );
\p_sum_1[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A8A8A8ABABABABA8"
    )
        port map (
      I0 => next_p_sum_10(3),
      I1 => \counter_temp_reg_n_0_[1]\,
      I2 => \counter_temp_reg_n_0_[0]\,
      I3 => \mul_FC_reg[5]\(2),
      I4 => \mul_FC_reg[5]\(1),
      I5 => \mul_FC_reg[5]\(3),
      O => \p_sum_1[3]_i_1_n_0\
    );
\p_sum_1[4]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counter_temp_reg_n_0_[1]\,
      I1 => \counter_temp_reg_n_0_[0]\,
      O => \p_sum_1_reg[4]_0\
    );
\p_sum_1[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A8ABABA8"
    )
        port map (
      I0 => next_p_sum_10(5),
      I1 => \counter_temp_reg_n_0_[1]\,
      I2 => \counter_temp_reg_n_0_[0]\,
      I3 => \mul_FC_reg[4]\,
      I4 => \mul_FC_reg[5]\(5),
      O => \p_sum_1[5]_i_1_n_0\
    );
\p_sum_1[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A8ABABA8"
    )
        port map (
      I0 => next_p_sum_10(6),
      I1 => \counter_temp_reg_n_0_[1]\,
      I2 => \counter_temp_reg_n_0_[0]\,
      I3 => \mul_FC_reg[5]_0\,
      I4 => DI(0),
      O => \p_sum_1[6]_i_1_n_0\
    );
\p_sum_1[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF20002"
    )
        port map (
      I0 => DI(0),
      I1 => \mul_FC_reg[5]_0\,
      I2 => \counter_temp_reg_n_0_[0]\,
      I3 => \counter_temp_reg_n_0_[1]\,
      I4 => next_p_sum_10(7),
      O => \p_sum_1[7]_i_1_n_0\
    );
\p_sum_1[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF20002"
    )
        port map (
      I0 => DI(0),
      I1 => \mul_FC_reg[5]_0\,
      I2 => \counter_temp_reg_n_0_[0]\,
      I3 => \counter_temp_reg_n_0_[1]\,
      I4 => next_p_sum_10(8),
      O => \p_sum_1[8]_i_1_n_0\
    );
\p_sum_1[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF20002"
    )
        port map (
      I0 => DI(0),
      I1 => \mul_FC_reg[5]_0\,
      I2 => \counter_temp_reg_n_0_[0]\,
      I3 => \counter_temp_reg_n_0_[1]\,
      I4 => next_p_sum_10(9),
      O => \p_sum_1[9]_i_1_n_0\
    );
\p_sum_1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1[0]_i_1_n_0\,
      Q => \p_sum_1_reg_n_0_[0]\
    );
\p_sum_1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1[1]_i_1_n_0\,
      Q => \p_sum_1_reg_n_0_[1]\
    );
\p_sum_1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1[2]_i_1_n_0\,
      Q => \p_sum_1_reg_n_0_[2]\
    );
\p_sum_1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1[3]_i_1_n_0\,
      Q => \p_sum_1_reg_n_0_[3]\
    );
\p_sum_1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => D(0),
      Q => \p_sum_1_reg_n_0_[4]\
    );
\p_sum_1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1[5]_i_1_n_0\,
      Q => \p_sum_1_reg_n_0_[5]\
    );
\p_sum_1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1[6]_i_1_n_0\,
      Q => \^q\(0)
    );
\p_sum_1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1[7]_i_1_n_0\,
      Q => \^q\(1)
    );
\p_sum_1_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1[8]_i_1_n_0\,
      Q => \p_sum_1_reg_n_0_[8]\
    );
\p_sum_1_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_state_accu,
      CLR => AR(0),
      D => \p_sum_1[9]_i_1_n_0\,
      Q => res_FC2(9)
    );
status_res_del_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => curr_state_accu,
      I1 => \counter_temp_reg_n_0_[0]\,
      I2 => \counter_temp_reg_n_0_[1]\,
      O => status_res
    );
status_res_del_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => status_res,
      Q => \^valid_output_obuf\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity FC_TOP is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    kernel_FC1_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    valid_FC1_in : in STD_LOGIC;
    kernel_FC2_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    valid_FC2_in : in STD_LOGIC;
    pooling : in STD_LOGIC_VECTOR ( 3 downto 0 );
    valid_pooling : in STD_LOGIC;
    output : out STD_LOGIC_VECTOR ( 0 to 0 );
    valid_output : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of FC_TOP : entity is true;
end FC_TOP;

architecture STRUCTURE of FC_TOP is
  signal FC1_MU_inst_n_1 : STD_LOGIC;
  signal FC2_Controller_inst_n_1 : STD_LOGIC;
  signal FC2_Controller_inst_n_10 : STD_LOGIC;
  signal FC2_Controller_inst_n_11 : STD_LOGIC;
  signal FC2_Controller_inst_n_12 : STD_LOGIC;
  signal FC2_Controller_inst_n_13 : STD_LOGIC;
  signal FC2_Controller_inst_n_2 : STD_LOGIC;
  signal FC2_Controller_inst_n_3 : STD_LOGIC;
  signal FC2_Controller_inst_n_4 : STD_LOGIC;
  signal FC2_Controller_inst_n_5 : STD_LOGIC;
  signal FC2_Controller_inst_n_6 : STD_LOGIC;
  signal FC2_Controller_inst_n_7 : STD_LOGIC;
  signal FC2_Controller_inst_n_8 : STD_LOGIC;
  signal FC2_Controller_inst_n_9 : STD_LOGIC;
  signal FC2_MU_inst_n_2 : STD_LOGIC;
  signal FC2_MU_inst_n_3 : STD_LOGIC;
  signal FC2_MU_inst_n_4 : STD_LOGIC;
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal \in\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal kernel_FC1_in_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal kernel_FC2_in_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal mul_FC : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal next_p_sum_10 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal ofmap_FC1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal output_OBUF : STD_LOGIC_VECTOR ( 0 to 0 );
  signal pooling_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rst_IBUF : STD_LOGIC;
  signal start_FC2 : STD_LOGIC;
  signal start_out : STD_LOGIC;
  signal valid_FC1_in_IBUF : STD_LOGIC;
  signal valid_FC2_in_IBUF : STD_LOGIC;
  signal valid_output_OBUF : STD_LOGIC;
  signal valid_pooling_IBUF : STD_LOGIC;
  signal valid_res_FC1 : STD_LOGIC;
begin
FC1_Controller_inst: entity work.FC1_Controller
     port map (
      AR(0) => rst_IBUF,
      CLK => clk_IBUF_BUFG,
      D(3 downto 0) => kernel_FC1_in_IBUF(3 downto 0),
      DI(1 downto 0) => \in\(1 downto 0),
      Q(7 downto 0) => mul_FC(7 downto 0),
      \counter_temp_reg[5]\ => FC1_MU_inst_n_1,
      \pooling[3]\(3 downto 0) => pooling_IBUF(3 downto 0),
      start_out => start_out,
      valid_FC1_in_IBUF => valid_FC1_in_IBUF,
      valid_pooling_IBUF => valid_pooling_IBUF
    );
FC1_MU_inst: entity work.FC1_MU
     port map (
      AR(0) => rst_IBUF,
      CLK => clk_IBUF_BUFG,
      D(2 downto 0) => ofmap_FC1(2 downto 0),
      DI(1 downto 0) => \in\(1 downto 0),
      Q(7 downto 0) => mul_FC(7 downto 0),
      \p_sum_1_reg[3]_0\ => FC1_MU_inst_n_1,
      start_out => start_out,
      valid_res_FC1 => valid_res_FC1
    );
FC2_Controller_inst: entity work.FC2_Controller
     port map (
      AR(0) => rst_IBUF,
      CLK => clk_IBUF_BUFG,
      D(0) => FC2_Controller_inst_n_3,
      DI(1) => FC2_Controller_inst_n_1,
      DI(0) => FC2_Controller_inst_n_2,
      O(0) => next_p_sum_10(4),
      Q(5) => FC2_Controller_inst_n_4,
      Q(4) => FC2_Controller_inst_n_5,
      Q(3) => FC2_Controller_inst_n_6,
      Q(2) => FC2_Controller_inst_n_7,
      Q(1) => FC2_Controller_inst_n_8,
      Q(0) => FC2_Controller_inst_n_9,
      S(1) => FC2_Controller_inst_n_12,
      S(0) => FC2_Controller_inst_n_13,
      \counter_temp_reg[1]\ => FC2_MU_inst_n_4,
      \kernel_FC2_in[3]\(3 downto 0) => kernel_FC2_in_IBUF(3 downto 0),
      \p_sum_1_reg[5]\ => FC2_Controller_inst_n_11,
      \p_sum_1_reg[6]\ => FC2_Controller_inst_n_10,
      \p_sum_1_reg[7]\(1) => FC2_MU_inst_n_2,
      \p_sum_1_reg[7]\(0) => FC2_MU_inst_n_3,
      start_FC2 => start_FC2,
      status_res_del_reg(2 downto 0) => ofmap_FC1(2 downto 0),
      valid_FC2_in_IBUF => valid_FC2_in_IBUF,
      valid_res_FC1 => valid_res_FC1
    );
FC2_MU_inst: entity work.FC2_MU
     port map (
      AR(0) => rst_IBUF,
      CLK => clk_IBUF_BUFG,
      D(0) => FC2_Controller_inst_n_3,
      DI(1) => FC2_Controller_inst_n_1,
      DI(0) => FC2_Controller_inst_n_2,
      O(0) => next_p_sum_10(4),
      Q(1) => FC2_MU_inst_n_2,
      Q(0) => FC2_MU_inst_n_3,
      S(1) => FC2_Controller_inst_n_12,
      S(0) => FC2_Controller_inst_n_13,
      \mul_FC_reg[4]\ => FC2_Controller_inst_n_11,
      \mul_FC_reg[5]\(5) => FC2_Controller_inst_n_4,
      \mul_FC_reg[5]\(4) => FC2_Controller_inst_n_5,
      \mul_FC_reg[5]\(3) => FC2_Controller_inst_n_6,
      \mul_FC_reg[5]\(2) => FC2_Controller_inst_n_7,
      \mul_FC_reg[5]\(1) => FC2_Controller_inst_n_8,
      \mul_FC_reg[5]\(0) => FC2_Controller_inst_n_9,
      \mul_FC_reg[5]_0\ => FC2_Controller_inst_n_10,
      output_OBUF(0) => output_OBUF(0),
      \p_sum_1_reg[4]_0\ => FC2_MU_inst_n_4,
      start_FC2 => start_FC2,
      valid_output_OBUF => valid_output_OBUF
    );
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
\kernel_FC1_in_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => kernel_FC1_in(0),
      O => kernel_FC1_in_IBUF(0)
    );
\kernel_FC1_in_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => kernel_FC1_in(1),
      O => kernel_FC1_in_IBUF(1)
    );
\kernel_FC1_in_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => kernel_FC1_in(2),
      O => kernel_FC1_in_IBUF(2)
    );
\kernel_FC1_in_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => kernel_FC1_in(3),
      O => kernel_FC1_in_IBUF(3)
    );
\kernel_FC2_in_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => kernel_FC2_in(0),
      O => kernel_FC2_in_IBUF(0)
    );
\kernel_FC2_in_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => kernel_FC2_in(1),
      O => kernel_FC2_in_IBUF(1)
    );
\kernel_FC2_in_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => kernel_FC2_in(2),
      O => kernel_FC2_in_IBUF(2)
    );
\kernel_FC2_in_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => kernel_FC2_in(3),
      O => kernel_FC2_in_IBUF(3)
    );
\output[0]_INST_0\: unisim.vcomponents.OBUF
     port map (
      I => output_OBUF(0),
      O => output(0)
    );
\pooling_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => pooling(0),
      O => pooling_IBUF(0)
    );
\pooling_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => pooling(1),
      O => pooling_IBUF(1)
    );
\pooling_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => pooling(2),
      O => pooling_IBUF(2)
    );
\pooling_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => pooling(3),
      O => pooling_IBUF(3)
    );
rst_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => rst,
      O => rst_IBUF
    );
valid_FC1_in_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => valid_FC1_in,
      O => valid_FC1_in_IBUF
    );
valid_FC2_in_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => valid_FC2_in,
      O => valid_FC2_in_IBUF
    );
valid_output_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => valid_output_OBUF,
      O => valid_output
    );
valid_pooling_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => valid_pooling,
      O => valid_pooling_IBUF
    );
end STRUCTURE;
