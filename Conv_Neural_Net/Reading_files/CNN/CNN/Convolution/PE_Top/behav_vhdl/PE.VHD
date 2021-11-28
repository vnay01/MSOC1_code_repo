-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
-- Date        : Mon Oct 15 14:48:14 2018
-- Host        : pax-15 running 64-bit major release  (build 9200)
-- Command     : write_vhdl PE
-- Design      : PE_TOP
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity PE is
  port (
    start_acc_1 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    D : out STD_LOGIC_VECTOR ( 63 downto 0 );
    \ifmap_calc_reg[0]_0\ : out STD_LOGIC;
    \ifmap_calc_reg[63]_0\ : out STD_LOGIC_VECTOR ( 63 downto 0 );
    \ifmap_calc_reg[0]_1\ : out STD_LOGIC;
    \ifmap_calc_reg[63]_1\ : out STD_LOGIC_VECTOR ( 63 downto 0 );
    \ifmap_calc_reg[0]_2\ : out STD_LOGIC;
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    start_IBUF : in STD_LOGIC;
    finish_IBUF : in STD_LOGIC;
    \count_reg[3]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    valid_in_f_IBUF : in STD_LOGIC;
    f_in_IBUF : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ifmap_4_IBUF : in STD_LOGIC_VECTOR ( 63 downto 0 );
    \ifmap_calc_reg[63]_2\ : in STD_LOGIC_VECTOR ( 62 downto 0 );
    ifmap_3_IBUF : in STD_LOGIC_VECTOR ( 63 downto 0 );
    \ifmap_calc_reg[63]_3\ : in STD_LOGIC_VECTOR ( 62 downto 0 );
    ifmap_2_IBUF : in STD_LOGIC_VECTOR ( 63 downto 0 );
    \ifmap_calc_reg[63]_4\ : in STD_LOGIC_VECTOR ( 62 downto 0 );
    ifmap_1_IBUF : in STD_LOGIC_VECTOR ( 63 downto 0 );
    \count_PE[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end PE;

architecture STRUCTURE of PE is
  signal Psum_next : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal Psum_next0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \Psum_next0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_1\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_2\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_3\ : STD_LOGIC;
  signal Psum_next0_carry_i_1_n_0 : STD_LOGIC;
  signal Psum_next0_carry_i_2_n_0 : STD_LOGIC;
  signal Psum_next0_carry_i_3_n_0 : STD_LOGIC;
  signal Psum_next0_carry_i_4_n_0 : STD_LOGIC;
  signal Psum_next0_carry_n_0 : STD_LOGIC;
  signal Psum_next0_carry_n_1 : STD_LOGIC;
  signal Psum_next0_carry_n_2 : STD_LOGIC;
  signal Psum_next0_carry_n_3 : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal count : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \count_del_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_del_reg_n_0_[1]\ : STD_LOGIC;
  signal count_f : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \count_f[0]_i_1_n_0\ : STD_LOGIC;
  signal count_ifmap : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \count_ifmap_del_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_ifmap_del_reg_n_0_[1]\ : STD_LOGIC;
  signal count_row_del : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal curr_state : STD_LOGIC;
  signal \ifmap_calc[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[10]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[11]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[12]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[13]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[14]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[15]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[16]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[17]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[18]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[19]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[1]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[20]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[21]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[22]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[23]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[24]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[25]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[26]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[27]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[28]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[29]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[2]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[30]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[31]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[32]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[33]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[34]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[35]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[36]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[37]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[38]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[39]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[3]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[40]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[41]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[42]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[43]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[44]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[45]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[46]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[47]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[48]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[49]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[4]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[50]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[51]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[52]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[53]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[54]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[55]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[56]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[57]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[58]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[59]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[5]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[60]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[61]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[62]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[63]_i_2__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[63]_i_3_n_0\ : STD_LOGIC;
  signal \ifmap_calc[63]_i_4_n_0\ : STD_LOGIC;
  signal \ifmap_calc[6]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[7]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[8]_i_1__2_n_0\ : STD_LOGIC;
  signal \ifmap_calc[9]_i_1__2_n_0\ : STD_LOGIC;
  signal \^ifmap_calc_reg[0]_0\ : STD_LOGIC;
  signal \^ifmap_calc_reg[0]_1\ : STD_LOGIC;
  signal \^ifmap_calc_reg[0]_2\ : STD_LOGIC;
  signal \ifmap_calc_reg_n_0_[0]\ : STD_LOGIC;
  signal ifmap_next : STD_LOGIC;
  signal next_count : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal next_count_f : STD_LOGIC_VECTOR ( 1 to 1 );
  signal next_count_ifmap : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal next_state : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 62 downto 0 );
  signal res_mul : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \res_mul[4]_i_2_n_0\ : STD_LOGIC;
  signal res_mul_next : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal start_acc_next0_out : STD_LOGIC;
  signal \w1[3]_i_1_n_0\ : STD_LOGIC;
  signal w1_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w1_reg_n_0_[0]\ : STD_LOGIC;
  signal \w1_reg_n_0_[1]\ : STD_LOGIC;
  signal \w1_reg_n_0_[2]\ : STD_LOGIC;
  signal \w1_reg_n_0_[3]\ : STD_LOGIC;
  signal w2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w2[3]_i_1_n_0\ : STD_LOGIC;
  signal w2_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal w3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w3[3]_i_1_n_0\ : STD_LOGIC;
  signal w3_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal w4 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w4[3]_i_1_n_0\ : STD_LOGIC;
  signal \w4[3]_i_3_n_0\ : STD_LOGIC;
  signal w4_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_Psum_next0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \Psum_calc[6]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count[0]_i_1__0\ : label is "soft_lutpair132";
  attribute SOFT_HLUTNM of \count[1]_i_1__0\ : label is "soft_lutpair132";
  attribute SOFT_HLUTNM of \count_f[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count_f[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count_ifmap[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count_ifmap[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of curr_state_i_1 : label is "soft_lutpair134";
  attribute SOFT_HLUTNM of \ifmap_calc[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \ifmap_calc[0]_i_1__0\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \ifmap_calc[0]_i_1__1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \ifmap_calc[0]_i_1__2\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \ifmap_calc[10]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \ifmap_calc[10]_i_1__0\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \ifmap_calc[10]_i_1__1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \ifmap_calc[10]_i_1__2\ : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of \ifmap_calc[11]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \ifmap_calc[11]_i_1__0\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \ifmap_calc[11]_i_1__1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \ifmap_calc[11]_i_1__2\ : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of \ifmap_calc[12]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \ifmap_calc[12]_i_1__0\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \ifmap_calc[12]_i_1__1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \ifmap_calc[12]_i_1__2\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \ifmap_calc[13]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \ifmap_calc[13]_i_1__0\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \ifmap_calc[13]_i_1__1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \ifmap_calc[13]_i_1__2\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \ifmap_calc[14]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \ifmap_calc[14]_i_1__0\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \ifmap_calc[14]_i_1__1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \ifmap_calc[14]_i_1__2\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \ifmap_calc[15]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \ifmap_calc[15]_i_1__0\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \ifmap_calc[15]_i_1__1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \ifmap_calc[15]_i_1__2\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \ifmap_calc[16]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \ifmap_calc[16]_i_1__0\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \ifmap_calc[16]_i_1__1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \ifmap_calc[16]_i_1__2\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \ifmap_calc[17]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \ifmap_calc[17]_i_1__0\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \ifmap_calc[17]_i_1__1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \ifmap_calc[17]_i_1__2\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \ifmap_calc[18]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \ifmap_calc[18]_i_1__0\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \ifmap_calc[18]_i_1__1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \ifmap_calc[18]_i_1__2\ : label is "soft_lutpair108";
  attribute SOFT_HLUTNM of \ifmap_calc[19]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \ifmap_calc[19]_i_1__0\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \ifmap_calc[19]_i_1__1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \ifmap_calc[19]_i_1__2\ : label is "soft_lutpair108";
  attribute SOFT_HLUTNM of \ifmap_calc[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \ifmap_calc[1]_i_1__0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \ifmap_calc[1]_i_1__1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \ifmap_calc[1]_i_1__2\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \ifmap_calc[20]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \ifmap_calc[20]_i_1__0\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \ifmap_calc[20]_i_1__1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \ifmap_calc[20]_i_1__2\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \ifmap_calc[21]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \ifmap_calc[21]_i_1__0\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \ifmap_calc[21]_i_1__1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \ifmap_calc[21]_i_1__2\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \ifmap_calc[22]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \ifmap_calc[22]_i_1__0\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \ifmap_calc[22]_i_1__1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \ifmap_calc[22]_i_1__2\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \ifmap_calc[23]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \ifmap_calc[23]_i_1__0\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \ifmap_calc[23]_i_1__1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \ifmap_calc[23]_i_1__2\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \ifmap_calc[24]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \ifmap_calc[24]_i_1__0\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \ifmap_calc[24]_i_1__1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \ifmap_calc[24]_i_1__2\ : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of \ifmap_calc[25]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \ifmap_calc[25]_i_1__0\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \ifmap_calc[25]_i_1__1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \ifmap_calc[25]_i_1__2\ : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of \ifmap_calc[26]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \ifmap_calc[26]_i_1__0\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \ifmap_calc[26]_i_1__1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \ifmap_calc[26]_i_1__2\ : label is "soft_lutpair112";
  attribute SOFT_HLUTNM of \ifmap_calc[27]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \ifmap_calc[27]_i_1__0\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \ifmap_calc[27]_i_1__1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \ifmap_calc[27]_i_1__2\ : label is "soft_lutpair112";
  attribute SOFT_HLUTNM of \ifmap_calc[28]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \ifmap_calc[28]_i_1__0\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \ifmap_calc[28]_i_1__1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \ifmap_calc[28]_i_1__2\ : label is "soft_lutpair113";
  attribute SOFT_HLUTNM of \ifmap_calc[29]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \ifmap_calc[29]_i_1__0\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \ifmap_calc[29]_i_1__1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \ifmap_calc[29]_i_1__2\ : label is "soft_lutpair113";
  attribute SOFT_HLUTNM of \ifmap_calc[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \ifmap_calc[2]_i_1__0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \ifmap_calc[2]_i_1__1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \ifmap_calc[2]_i_1__2\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \ifmap_calc[30]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \ifmap_calc[30]_i_1__0\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \ifmap_calc[30]_i_1__1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \ifmap_calc[30]_i_1__2\ : label is "soft_lutpair114";
  attribute SOFT_HLUTNM of \ifmap_calc[31]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \ifmap_calc[31]_i_1__0\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \ifmap_calc[31]_i_1__1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \ifmap_calc[31]_i_1__2\ : label is "soft_lutpair114";
  attribute SOFT_HLUTNM of \ifmap_calc[32]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \ifmap_calc[32]_i_1__0\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \ifmap_calc[32]_i_1__1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \ifmap_calc[32]_i_1__2\ : label is "soft_lutpair115";
  attribute SOFT_HLUTNM of \ifmap_calc[33]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \ifmap_calc[33]_i_1__0\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \ifmap_calc[33]_i_1__1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \ifmap_calc[33]_i_1__2\ : label is "soft_lutpair115";
  attribute SOFT_HLUTNM of \ifmap_calc[34]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \ifmap_calc[34]_i_1__0\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \ifmap_calc[34]_i_1__1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \ifmap_calc[34]_i_1__2\ : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of \ifmap_calc[35]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \ifmap_calc[35]_i_1__0\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \ifmap_calc[35]_i_1__1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \ifmap_calc[35]_i_1__2\ : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of \ifmap_calc[36]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \ifmap_calc[36]_i_1__0\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \ifmap_calc[36]_i_1__1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \ifmap_calc[36]_i_1__2\ : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of \ifmap_calc[37]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \ifmap_calc[37]_i_1__0\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \ifmap_calc[37]_i_1__1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \ifmap_calc[37]_i_1__2\ : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of \ifmap_calc[38]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \ifmap_calc[38]_i_1__0\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \ifmap_calc[38]_i_1__1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \ifmap_calc[38]_i_1__2\ : label is "soft_lutpair118";
  attribute SOFT_HLUTNM of \ifmap_calc[39]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \ifmap_calc[39]_i_1__0\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \ifmap_calc[39]_i_1__1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \ifmap_calc[39]_i_1__2\ : label is "soft_lutpair118";
  attribute SOFT_HLUTNM of \ifmap_calc[3]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \ifmap_calc[3]_i_1__0\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \ifmap_calc[3]_i_1__1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \ifmap_calc[3]_i_1__2\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \ifmap_calc[40]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \ifmap_calc[40]_i_1__0\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \ifmap_calc[40]_i_1__1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \ifmap_calc[40]_i_1__2\ : label is "soft_lutpair119";
  attribute SOFT_HLUTNM of \ifmap_calc[41]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \ifmap_calc[41]_i_1__0\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \ifmap_calc[41]_i_1__1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \ifmap_calc[41]_i_1__2\ : label is "soft_lutpair119";
  attribute SOFT_HLUTNM of \ifmap_calc[42]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \ifmap_calc[42]_i_1__0\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \ifmap_calc[42]_i_1__1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \ifmap_calc[42]_i_1__2\ : label is "soft_lutpair120";
  attribute SOFT_HLUTNM of \ifmap_calc[43]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \ifmap_calc[43]_i_1__0\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \ifmap_calc[43]_i_1__1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \ifmap_calc[43]_i_1__2\ : label is "soft_lutpair120";
  attribute SOFT_HLUTNM of \ifmap_calc[44]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \ifmap_calc[44]_i_1__0\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \ifmap_calc[44]_i_1__1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \ifmap_calc[44]_i_1__2\ : label is "soft_lutpair121";
  attribute SOFT_HLUTNM of \ifmap_calc[45]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \ifmap_calc[45]_i_1__0\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \ifmap_calc[45]_i_1__1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \ifmap_calc[45]_i_1__2\ : label is "soft_lutpair121";
  attribute SOFT_HLUTNM of \ifmap_calc[46]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \ifmap_calc[46]_i_1__0\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \ifmap_calc[46]_i_1__1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \ifmap_calc[46]_i_1__2\ : label is "soft_lutpair122";
  attribute SOFT_HLUTNM of \ifmap_calc[47]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \ifmap_calc[47]_i_1__0\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \ifmap_calc[47]_i_1__1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \ifmap_calc[47]_i_1__2\ : label is "soft_lutpair122";
  attribute SOFT_HLUTNM of \ifmap_calc[48]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \ifmap_calc[48]_i_1__0\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \ifmap_calc[48]_i_1__1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \ifmap_calc[48]_i_1__2\ : label is "soft_lutpair123";
  attribute SOFT_HLUTNM of \ifmap_calc[49]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \ifmap_calc[49]_i_1__0\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \ifmap_calc[49]_i_1__1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \ifmap_calc[49]_i_1__2\ : label is "soft_lutpair123";
  attribute SOFT_HLUTNM of \ifmap_calc[4]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \ifmap_calc[4]_i_1__0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \ifmap_calc[4]_i_1__1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \ifmap_calc[4]_i_1__2\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \ifmap_calc[50]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \ifmap_calc[50]_i_1__0\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \ifmap_calc[50]_i_1__1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \ifmap_calc[50]_i_1__2\ : label is "soft_lutpair124";
  attribute SOFT_HLUTNM of \ifmap_calc[51]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \ifmap_calc[51]_i_1__0\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \ifmap_calc[51]_i_1__1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \ifmap_calc[51]_i_1__2\ : label is "soft_lutpair124";
  attribute SOFT_HLUTNM of \ifmap_calc[52]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \ifmap_calc[52]_i_1__0\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \ifmap_calc[52]_i_1__1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \ifmap_calc[52]_i_1__2\ : label is "soft_lutpair125";
  attribute SOFT_HLUTNM of \ifmap_calc[53]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \ifmap_calc[53]_i_1__0\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \ifmap_calc[53]_i_1__1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \ifmap_calc[53]_i_1__2\ : label is "soft_lutpair125";
  attribute SOFT_HLUTNM of \ifmap_calc[54]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \ifmap_calc[54]_i_1__0\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \ifmap_calc[54]_i_1__1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \ifmap_calc[54]_i_1__2\ : label is "soft_lutpair126";
  attribute SOFT_HLUTNM of \ifmap_calc[55]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \ifmap_calc[55]_i_1__0\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \ifmap_calc[55]_i_1__1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \ifmap_calc[55]_i_1__2\ : label is "soft_lutpair126";
  attribute SOFT_HLUTNM of \ifmap_calc[56]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \ifmap_calc[56]_i_1__0\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \ifmap_calc[56]_i_1__1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \ifmap_calc[56]_i_1__2\ : label is "soft_lutpair127";
  attribute SOFT_HLUTNM of \ifmap_calc[57]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \ifmap_calc[57]_i_1__0\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \ifmap_calc[57]_i_1__1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \ifmap_calc[57]_i_1__2\ : label is "soft_lutpair127";
  attribute SOFT_HLUTNM of \ifmap_calc[58]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \ifmap_calc[58]_i_1__0\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \ifmap_calc[58]_i_1__1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \ifmap_calc[58]_i_1__2\ : label is "soft_lutpair128";
  attribute SOFT_HLUTNM of \ifmap_calc[59]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \ifmap_calc[59]_i_1__0\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \ifmap_calc[59]_i_1__1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \ifmap_calc[59]_i_1__2\ : label is "soft_lutpair128";
  attribute SOFT_HLUTNM of \ifmap_calc[5]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \ifmap_calc[5]_i_1__0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \ifmap_calc[5]_i_1__1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \ifmap_calc[5]_i_1__2\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \ifmap_calc[60]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \ifmap_calc[60]_i_1__0\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \ifmap_calc[60]_i_1__1\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \ifmap_calc[60]_i_1__2\ : label is "soft_lutpair129";
  attribute SOFT_HLUTNM of \ifmap_calc[61]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \ifmap_calc[61]_i_1__0\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \ifmap_calc[61]_i_1__1\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \ifmap_calc[61]_i_1__2\ : label is "soft_lutpair129";
  attribute SOFT_HLUTNM of \ifmap_calc[62]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \ifmap_calc[62]_i_1__0\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \ifmap_calc[62]_i_1__1\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \ifmap_calc[62]_i_1__2\ : label is "soft_lutpair130";
  attribute SOFT_HLUTNM of \ifmap_calc[63]_i_2\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \ifmap_calc[63]_i_2__0\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \ifmap_calc[63]_i_2__1\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \ifmap_calc[63]_i_2__2\ : label is "soft_lutpair130";
  attribute SOFT_HLUTNM of \ifmap_calc[6]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \ifmap_calc[6]_i_1__0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \ifmap_calc[6]_i_1__1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \ifmap_calc[6]_i_1__2\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \ifmap_calc[7]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \ifmap_calc[7]_i_1__0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \ifmap_calc[7]_i_1__1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \ifmap_calc[7]_i_1__2\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \ifmap_calc[8]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \ifmap_calc[8]_i_1__0\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \ifmap_calc[8]_i_1__1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \ifmap_calc[8]_i_1__2\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \ifmap_calc[9]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \ifmap_calc[9]_i_1__0\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \ifmap_calc[9]_i_1__1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \ifmap_calc[9]_i_1__2\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \res_mul[0]_i_1\ : label is "soft_lutpair133";
  attribute SOFT_HLUTNM of \res_mul[1]_i_1\ : label is "soft_lutpair131";
  attribute SOFT_HLUTNM of \res_mul[2]_i_1\ : label is "soft_lutpair133";
  attribute SOFT_HLUTNM of \res_mul[4]_i_1\ : label is "soft_lutpair131";
  attribute SOFT_HLUTNM of start_acc_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \w4[3]_i_3\ : label is "soft_lutpair134";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
  \ifmap_calc_reg[0]_0\ <= \^ifmap_calc_reg[0]_0\;
  \ifmap_calc_reg[0]_1\ <= \^ifmap_calc_reg[0]_1\;
  \ifmap_calc_reg[0]_2\ <= \^ifmap_calc_reg[0]_2\;
\Psum_calc[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0(0),
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => res_mul(0),
      O => Psum_next(0)
    );
\Psum_calc[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0(1),
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => res_mul(1),
      O => Psum_next(1)
    );
\Psum_calc[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0(2),
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => res_mul(2),
      O => Psum_next(2)
    );
\Psum_calc[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0(3),
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => res_mul(4),
      O => Psum_next(3)
    );
\Psum_calc[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0(4),
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => res_mul(4),
      O => Psum_next(4)
    );
\Psum_calc[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0(5),
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => res_mul(4),
      O => Psum_next(5)
    );
\Psum_calc[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0(6),
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => res_mul(4),
      O => Psum_next(6)
    );
\Psum_calc[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0(7),
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => res_mul(4),
      O => Psum_next(7)
    );
\Psum_calc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => Psum_next(0),
      Q => \^q\(0)
    );
\Psum_calc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => Psum_next(1),
      Q => \^q\(1)
    );
\Psum_calc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => Psum_next(2),
      Q => \^q\(2)
    );
\Psum_calc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => Psum_next(3),
      Q => \^q\(3)
    );
\Psum_calc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => Psum_next(4),
      Q => \^q\(4)
    );
\Psum_calc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => Psum_next(5),
      Q => \^q\(5)
    );
\Psum_calc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => Psum_next(6),
      Q => \^q\(6)
    );
\Psum_calc_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => Psum_next(7),
      Q => \^q\(7)
    );
Psum_next0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => Psum_next0_carry_n_0,
      CO(2) => Psum_next0_carry_n_1,
      CO(1) => Psum_next0_carry_n_2,
      CO(0) => Psum_next0_carry_n_3,
      CYINIT => '0',
      DI(3) => res_mul(4),
      DI(2 downto 0) => res_mul(2 downto 0),
      O(3 downto 0) => Psum_next0(3 downto 0),
      S(3) => Psum_next0_carry_i_1_n_0,
      S(2) => Psum_next0_carry_i_2_n_0,
      S(1) => Psum_next0_carry_i_3_n_0,
      S(0) => Psum_next0_carry_i_4_n_0
    );
\Psum_next0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => Psum_next0_carry_n_0,
      CO(3) => \NLW_Psum_next0_carry__0_CO_UNCONNECTED\(3),
      CO(2) => \Psum_next0_carry__0_n_1\,
      CO(1) => \Psum_next0_carry__0_n_2\,
      CO(0) => \Psum_next0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 1) => \^q\(5 downto 4),
      DI(0) => \Psum_next0_carry__0_i_1_n_0\,
      O(3 downto 0) => Psum_next0(7 downto 4),
      S(3) => \Psum_next0_carry__0_i_2_n_0\,
      S(2) => \Psum_next0_carry__0_i_3_n_0\,
      S(1) => \Psum_next0_carry__0_i_4_n_0\,
      S(0) => \Psum_next0_carry__0_i_5_n_0\
    );
\Psum_next0_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(4),
      O => \Psum_next0_carry__0_i_1_n_0\
    );
\Psum_next0_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(7),
      O => \Psum_next0_carry__0_i_2_n_0\
    );
\Psum_next0_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(6),
      O => \Psum_next0_carry__0_i_3_n_0\
    );
\Psum_next0_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(5),
      O => \Psum_next0_carry__0_i_4_n_0\
    );
\Psum_next0_carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(4),
      I1 => res_mul(4),
      O => \Psum_next0_carry__0_i_5_n_0\
    );
Psum_next0_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => res_mul(4),
      I1 => \^q\(3),
      O => Psum_next0_carry_i_1_n_0
    );
Psum_next0_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => res_mul(2),
      I1 => \^q\(2),
      O => Psum_next0_carry_i_2_n_0
    );
Psum_next0_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => res_mul(1),
      I1 => \^q\(1),
      O => Psum_next0_carry_i_3_n_0
    );
Psum_next0_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => res_mul(0),
      I1 => \^q\(0),
      O => Psum_next0_carry_i_4_n_0
    );
\count[0]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state,
      I1 => count(0),
      O => next_count(0)
    );
\count[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => curr_state,
      I1 => count(1),
      I2 => count(0),
      O => next_count(1)
    );
\count_del_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => count(0),
      Q => \count_del_reg_n_0_[0]\
    );
\count_del_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => count(1),
      Q => \count_del_reg_n_0_[1]\
    );
\count_f[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => count_f(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      O => \count_f[0]_i_1_n_0\
    );
\count_f[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040400"
    )
        port map (
      I0 => \count_reg[3]\(0),
      I1 => valid_in_f_IBUF,
      I2 => \count_reg[3]\(1),
      I3 => count_f(1),
      I4 => count_f(0),
      O => next_count_f(1)
    );
\count_f_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_f[0]_i_1_n_0\,
      Q => count_f(0)
    );
\count_f_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count_f(1),
      Q => count_f(1)
    );
\count_ifmap[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => count_ifmap(0),
      I1 => start_IBUF,
      I2 => curr_state,
      O => next_count_ifmap(0)
    );
\count_ifmap[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6660"
    )
        port map (
      I0 => count_ifmap(1),
      I1 => count_ifmap(0),
      I2 => start_IBUF,
      I3 => curr_state,
      O => next_count_ifmap(1)
    );
\count_ifmap_del_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => count_ifmap(0),
      Q => \count_ifmap_del_reg_n_0_[0]\
    );
\count_ifmap_del_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => count_ifmap(1),
      Q => \count_ifmap_del_reg_n_0_[1]\
    );
\count_ifmap_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count_ifmap(0),
      Q => count_ifmap(0)
    );
\count_ifmap_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count_ifmap(1),
      Q => count_ifmap(1)
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count(0),
      Q => count(0)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count(1),
      Q => count(1)
    );
\count_row_del_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_PE[7]\(0),
      Q => count_row_del(0)
    );
\count_row_del_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_PE[7]\(1),
      Q => count_row_del(1)
    );
\count_row_del_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_PE[7]\(2),
      Q => count_row_del(2)
    );
\count_row_del_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_PE[7]\(3),
      Q => count_row_del(3)
    );
\count_row_del_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_PE[7]\(4),
      Q => count_row_del(4)
    );
\count_row_del_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_PE[7]\(5),
      Q => count_row_del(5)
    );
\count_row_del_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_PE[7]\(6),
      Q => count_row_del(6)
    );
\count_row_del_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_PE[7]\(7),
      Q => count_row_del(7)
    );
curr_state_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => finish_IBUF,
      I1 => start_IBUF,
      I2 => curr_state,
      O => next_state
    );
curr_state_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_state,
      Q => curr_state
    );
\ifmap_calc[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(0),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(0),
      O => D(0)
    );
\ifmap_calc[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(0),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(0),
      O => \ifmap_calc_reg[63]_0\(0)
    );
\ifmap_calc[0]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(0),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(0),
      O => \ifmap_calc_reg[63]_1\(0)
    );
\ifmap_calc[0]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(0),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(0),
      O => \ifmap_calc[0]_i_1__2_n_0\
    );
\ifmap_calc[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(10),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(10),
      O => D(10)
    );
\ifmap_calc[10]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(10),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(10),
      O => \ifmap_calc_reg[63]_0\(10)
    );
\ifmap_calc[10]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(10),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(10),
      O => \ifmap_calc_reg[63]_1\(10)
    );
\ifmap_calc[10]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(10),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(10),
      O => \ifmap_calc[10]_i_1__2_n_0\
    );
\ifmap_calc[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(11),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(11),
      O => D(11)
    );
\ifmap_calc[11]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(11),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(11),
      O => \ifmap_calc_reg[63]_0\(11)
    );
\ifmap_calc[11]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(11),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(11),
      O => \ifmap_calc_reg[63]_1\(11)
    );
\ifmap_calc[11]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(11),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(11),
      O => \ifmap_calc[11]_i_1__2_n_0\
    );
\ifmap_calc[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(12),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(12),
      O => D(12)
    );
\ifmap_calc[12]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(12),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(12),
      O => \ifmap_calc_reg[63]_0\(12)
    );
\ifmap_calc[12]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(12),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(12),
      O => \ifmap_calc_reg[63]_1\(12)
    );
\ifmap_calc[12]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(12),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(12),
      O => \ifmap_calc[12]_i_1__2_n_0\
    );
\ifmap_calc[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(13),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(13),
      O => D(13)
    );
\ifmap_calc[13]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(13),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(13),
      O => \ifmap_calc_reg[63]_0\(13)
    );
\ifmap_calc[13]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(13),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(13),
      O => \ifmap_calc_reg[63]_1\(13)
    );
\ifmap_calc[13]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(13),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(13),
      O => \ifmap_calc[13]_i_1__2_n_0\
    );
\ifmap_calc[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(14),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(14),
      O => D(14)
    );
\ifmap_calc[14]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(14),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(14),
      O => \ifmap_calc_reg[63]_0\(14)
    );
\ifmap_calc[14]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(14),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(14),
      O => \ifmap_calc_reg[63]_1\(14)
    );
\ifmap_calc[14]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(14),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(14),
      O => \ifmap_calc[14]_i_1__2_n_0\
    );
\ifmap_calc[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(15),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(15),
      O => D(15)
    );
\ifmap_calc[15]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(15),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(15),
      O => \ifmap_calc_reg[63]_0\(15)
    );
\ifmap_calc[15]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(15),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(15),
      O => \ifmap_calc_reg[63]_1\(15)
    );
\ifmap_calc[15]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(15),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(15),
      O => \ifmap_calc[15]_i_1__2_n_0\
    );
\ifmap_calc[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(16),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(16),
      O => D(16)
    );
\ifmap_calc[16]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(16),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(16),
      O => \ifmap_calc_reg[63]_0\(16)
    );
\ifmap_calc[16]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(16),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(16),
      O => \ifmap_calc_reg[63]_1\(16)
    );
\ifmap_calc[16]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(16),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(16),
      O => \ifmap_calc[16]_i_1__2_n_0\
    );
\ifmap_calc[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(17),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(17),
      O => D(17)
    );
\ifmap_calc[17]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(17),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(17),
      O => \ifmap_calc_reg[63]_0\(17)
    );
\ifmap_calc[17]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(17),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(17),
      O => \ifmap_calc_reg[63]_1\(17)
    );
\ifmap_calc[17]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(17),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(17),
      O => \ifmap_calc[17]_i_1__2_n_0\
    );
\ifmap_calc[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(18),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(18),
      O => D(18)
    );
\ifmap_calc[18]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(18),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(18),
      O => \ifmap_calc_reg[63]_0\(18)
    );
\ifmap_calc[18]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(18),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(18),
      O => \ifmap_calc_reg[63]_1\(18)
    );
\ifmap_calc[18]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(18),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(18),
      O => \ifmap_calc[18]_i_1__2_n_0\
    );
\ifmap_calc[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(19),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(19),
      O => D(19)
    );
\ifmap_calc[19]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(19),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(19),
      O => \ifmap_calc_reg[63]_0\(19)
    );
\ifmap_calc[19]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(19),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(19),
      O => \ifmap_calc_reg[63]_1\(19)
    );
\ifmap_calc[19]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(19),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(19),
      O => \ifmap_calc[19]_i_1__2_n_0\
    );
\ifmap_calc[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(1),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(1),
      O => D(1)
    );
\ifmap_calc[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(1),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(1),
      O => \ifmap_calc_reg[63]_0\(1)
    );
\ifmap_calc[1]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(1),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(1),
      O => \ifmap_calc_reg[63]_1\(1)
    );
\ifmap_calc[1]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(1),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(1),
      O => \ifmap_calc[1]_i_1__2_n_0\
    );
\ifmap_calc[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(20),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(20),
      O => D(20)
    );
\ifmap_calc[20]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(20),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(20),
      O => \ifmap_calc_reg[63]_0\(20)
    );
\ifmap_calc[20]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(20),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(20),
      O => \ifmap_calc_reg[63]_1\(20)
    );
\ifmap_calc[20]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(20),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(20),
      O => \ifmap_calc[20]_i_1__2_n_0\
    );
\ifmap_calc[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(21),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(21),
      O => D(21)
    );
\ifmap_calc[21]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(21),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(21),
      O => \ifmap_calc_reg[63]_0\(21)
    );
\ifmap_calc[21]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(21),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(21),
      O => \ifmap_calc_reg[63]_1\(21)
    );
\ifmap_calc[21]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(21),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(21),
      O => \ifmap_calc[21]_i_1__2_n_0\
    );
\ifmap_calc[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(22),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(22),
      O => D(22)
    );
\ifmap_calc[22]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(22),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(22),
      O => \ifmap_calc_reg[63]_0\(22)
    );
\ifmap_calc[22]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(22),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(22),
      O => \ifmap_calc_reg[63]_1\(22)
    );
\ifmap_calc[22]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(22),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(22),
      O => \ifmap_calc[22]_i_1__2_n_0\
    );
\ifmap_calc[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(23),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(23),
      O => D(23)
    );
\ifmap_calc[23]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(23),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(23),
      O => \ifmap_calc_reg[63]_0\(23)
    );
\ifmap_calc[23]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(23),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(23),
      O => \ifmap_calc_reg[63]_1\(23)
    );
\ifmap_calc[23]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(23),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(23),
      O => \ifmap_calc[23]_i_1__2_n_0\
    );
\ifmap_calc[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(24),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(24),
      O => D(24)
    );
\ifmap_calc[24]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(24),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(24),
      O => \ifmap_calc_reg[63]_0\(24)
    );
\ifmap_calc[24]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(24),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(24),
      O => \ifmap_calc_reg[63]_1\(24)
    );
\ifmap_calc[24]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(24),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(24),
      O => \ifmap_calc[24]_i_1__2_n_0\
    );
\ifmap_calc[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(25),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(25),
      O => D(25)
    );
\ifmap_calc[25]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(25),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(25),
      O => \ifmap_calc_reg[63]_0\(25)
    );
\ifmap_calc[25]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(25),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(25),
      O => \ifmap_calc_reg[63]_1\(25)
    );
\ifmap_calc[25]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(25),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(25),
      O => \ifmap_calc[25]_i_1__2_n_0\
    );
\ifmap_calc[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(26),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(26),
      O => D(26)
    );
\ifmap_calc[26]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(26),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(26),
      O => \ifmap_calc_reg[63]_0\(26)
    );
\ifmap_calc[26]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(26),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(26),
      O => \ifmap_calc_reg[63]_1\(26)
    );
\ifmap_calc[26]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(26),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(26),
      O => \ifmap_calc[26]_i_1__2_n_0\
    );
\ifmap_calc[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(27),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(27),
      O => D(27)
    );
\ifmap_calc[27]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(27),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(27),
      O => \ifmap_calc_reg[63]_0\(27)
    );
\ifmap_calc[27]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(27),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(27),
      O => \ifmap_calc_reg[63]_1\(27)
    );
\ifmap_calc[27]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(27),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(27),
      O => \ifmap_calc[27]_i_1__2_n_0\
    );
\ifmap_calc[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(28),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(28),
      O => D(28)
    );
\ifmap_calc[28]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(28),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(28),
      O => \ifmap_calc_reg[63]_0\(28)
    );
\ifmap_calc[28]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(28),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(28),
      O => \ifmap_calc_reg[63]_1\(28)
    );
\ifmap_calc[28]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(28),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(28),
      O => \ifmap_calc[28]_i_1__2_n_0\
    );
\ifmap_calc[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(29),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(29),
      O => D(29)
    );
\ifmap_calc[29]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(29),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(29),
      O => \ifmap_calc_reg[63]_0\(29)
    );
\ifmap_calc[29]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(29),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(29),
      O => \ifmap_calc_reg[63]_1\(29)
    );
\ifmap_calc[29]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(29),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(29),
      O => \ifmap_calc[29]_i_1__2_n_0\
    );
\ifmap_calc[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(2),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(2),
      O => D(2)
    );
\ifmap_calc[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(2),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(2),
      O => \ifmap_calc_reg[63]_0\(2)
    );
\ifmap_calc[2]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(2),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(2),
      O => \ifmap_calc_reg[63]_1\(2)
    );
\ifmap_calc[2]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(2),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(2),
      O => \ifmap_calc[2]_i_1__2_n_0\
    );
\ifmap_calc[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(30),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(30),
      O => D(30)
    );
\ifmap_calc[30]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(30),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(30),
      O => \ifmap_calc_reg[63]_0\(30)
    );
\ifmap_calc[30]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(30),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(30),
      O => \ifmap_calc_reg[63]_1\(30)
    );
\ifmap_calc[30]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(30),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(30),
      O => \ifmap_calc[30]_i_1__2_n_0\
    );
\ifmap_calc[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(31),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(31),
      O => D(31)
    );
\ifmap_calc[31]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(31),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(31),
      O => \ifmap_calc_reg[63]_0\(31)
    );
\ifmap_calc[31]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(31),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(31),
      O => \ifmap_calc_reg[63]_1\(31)
    );
\ifmap_calc[31]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(31),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(31),
      O => \ifmap_calc[31]_i_1__2_n_0\
    );
\ifmap_calc[32]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(32),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(32),
      O => D(32)
    );
\ifmap_calc[32]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(32),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(32),
      O => \ifmap_calc_reg[63]_0\(32)
    );
\ifmap_calc[32]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(32),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(32),
      O => \ifmap_calc_reg[63]_1\(32)
    );
\ifmap_calc[32]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(32),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(32),
      O => \ifmap_calc[32]_i_1__2_n_0\
    );
\ifmap_calc[33]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(33),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(33),
      O => D(33)
    );
\ifmap_calc[33]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(33),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(33),
      O => \ifmap_calc_reg[63]_0\(33)
    );
\ifmap_calc[33]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(33),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(33),
      O => \ifmap_calc_reg[63]_1\(33)
    );
\ifmap_calc[33]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(33),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(33),
      O => \ifmap_calc[33]_i_1__2_n_0\
    );
\ifmap_calc[34]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(34),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(34),
      O => D(34)
    );
\ifmap_calc[34]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(34),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(34),
      O => \ifmap_calc_reg[63]_0\(34)
    );
\ifmap_calc[34]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(34),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(34),
      O => \ifmap_calc_reg[63]_1\(34)
    );
\ifmap_calc[34]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(34),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(34),
      O => \ifmap_calc[34]_i_1__2_n_0\
    );
\ifmap_calc[35]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(35),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(35),
      O => D(35)
    );
\ifmap_calc[35]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(35),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(35),
      O => \ifmap_calc_reg[63]_0\(35)
    );
\ifmap_calc[35]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(35),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(35),
      O => \ifmap_calc_reg[63]_1\(35)
    );
\ifmap_calc[35]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(35),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(35),
      O => \ifmap_calc[35]_i_1__2_n_0\
    );
\ifmap_calc[36]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(36),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(36),
      O => D(36)
    );
\ifmap_calc[36]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(36),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(36),
      O => \ifmap_calc_reg[63]_0\(36)
    );
\ifmap_calc[36]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(36),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(36),
      O => \ifmap_calc_reg[63]_1\(36)
    );
\ifmap_calc[36]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(36),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(36),
      O => \ifmap_calc[36]_i_1__2_n_0\
    );
\ifmap_calc[37]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(37),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(37),
      O => D(37)
    );
\ifmap_calc[37]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(37),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(37),
      O => \ifmap_calc_reg[63]_0\(37)
    );
\ifmap_calc[37]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(37),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(37),
      O => \ifmap_calc_reg[63]_1\(37)
    );
\ifmap_calc[37]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(37),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(37),
      O => \ifmap_calc[37]_i_1__2_n_0\
    );
\ifmap_calc[38]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(38),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(38),
      O => D(38)
    );
\ifmap_calc[38]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(38),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(38),
      O => \ifmap_calc_reg[63]_0\(38)
    );
\ifmap_calc[38]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(38),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(38),
      O => \ifmap_calc_reg[63]_1\(38)
    );
\ifmap_calc[38]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(38),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(38),
      O => \ifmap_calc[38]_i_1__2_n_0\
    );
\ifmap_calc[39]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(39),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(39),
      O => D(39)
    );
\ifmap_calc[39]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(39),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(39),
      O => \ifmap_calc_reg[63]_0\(39)
    );
\ifmap_calc[39]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(39),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(39),
      O => \ifmap_calc_reg[63]_1\(39)
    );
\ifmap_calc[39]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(39),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(39),
      O => \ifmap_calc[39]_i_1__2_n_0\
    );
\ifmap_calc[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(3),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(3),
      O => D(3)
    );
\ifmap_calc[3]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(3),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(3),
      O => \ifmap_calc_reg[63]_0\(3)
    );
\ifmap_calc[3]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(3),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(3),
      O => \ifmap_calc_reg[63]_1\(3)
    );
\ifmap_calc[3]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(3),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(3),
      O => \ifmap_calc[3]_i_1__2_n_0\
    );
\ifmap_calc[40]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(40),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(40),
      O => D(40)
    );
\ifmap_calc[40]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(40),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(40),
      O => \ifmap_calc_reg[63]_0\(40)
    );
\ifmap_calc[40]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(40),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(40),
      O => \ifmap_calc_reg[63]_1\(40)
    );
\ifmap_calc[40]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(40),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(40),
      O => \ifmap_calc[40]_i_1__2_n_0\
    );
\ifmap_calc[41]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(41),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(41),
      O => D(41)
    );
\ifmap_calc[41]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(41),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(41),
      O => \ifmap_calc_reg[63]_0\(41)
    );
\ifmap_calc[41]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(41),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(41),
      O => \ifmap_calc_reg[63]_1\(41)
    );
\ifmap_calc[41]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(41),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(41),
      O => \ifmap_calc[41]_i_1__2_n_0\
    );
\ifmap_calc[42]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(42),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(42),
      O => D(42)
    );
\ifmap_calc[42]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(42),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(42),
      O => \ifmap_calc_reg[63]_0\(42)
    );
\ifmap_calc[42]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(42),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(42),
      O => \ifmap_calc_reg[63]_1\(42)
    );
\ifmap_calc[42]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(42),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(42),
      O => \ifmap_calc[42]_i_1__2_n_0\
    );
\ifmap_calc[43]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(43),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(43),
      O => D(43)
    );
\ifmap_calc[43]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(43),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(43),
      O => \ifmap_calc_reg[63]_0\(43)
    );
\ifmap_calc[43]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(43),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(43),
      O => \ifmap_calc_reg[63]_1\(43)
    );
\ifmap_calc[43]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(43),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(43),
      O => \ifmap_calc[43]_i_1__2_n_0\
    );
\ifmap_calc[44]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(44),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(44),
      O => D(44)
    );
\ifmap_calc[44]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(44),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(44),
      O => \ifmap_calc_reg[63]_0\(44)
    );
\ifmap_calc[44]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(44),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(44),
      O => \ifmap_calc_reg[63]_1\(44)
    );
\ifmap_calc[44]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(44),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(44),
      O => \ifmap_calc[44]_i_1__2_n_0\
    );
\ifmap_calc[45]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(45),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(45),
      O => D(45)
    );
\ifmap_calc[45]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(45),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(45),
      O => \ifmap_calc_reg[63]_0\(45)
    );
\ifmap_calc[45]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(45),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(45),
      O => \ifmap_calc_reg[63]_1\(45)
    );
\ifmap_calc[45]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(45),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(45),
      O => \ifmap_calc[45]_i_1__2_n_0\
    );
\ifmap_calc[46]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(46),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(46),
      O => D(46)
    );
\ifmap_calc[46]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(46),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(46),
      O => \ifmap_calc_reg[63]_0\(46)
    );
\ifmap_calc[46]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(46),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(46),
      O => \ifmap_calc_reg[63]_1\(46)
    );
\ifmap_calc[46]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(46),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(46),
      O => \ifmap_calc[46]_i_1__2_n_0\
    );
\ifmap_calc[47]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(47),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(47),
      O => D(47)
    );
\ifmap_calc[47]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(47),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(47),
      O => \ifmap_calc_reg[63]_0\(47)
    );
\ifmap_calc[47]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(47),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(47),
      O => \ifmap_calc_reg[63]_1\(47)
    );
\ifmap_calc[47]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(47),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(47),
      O => \ifmap_calc[47]_i_1__2_n_0\
    );
\ifmap_calc[48]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(48),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(48),
      O => D(48)
    );
\ifmap_calc[48]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(48),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(48),
      O => \ifmap_calc_reg[63]_0\(48)
    );
\ifmap_calc[48]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(48),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(48),
      O => \ifmap_calc_reg[63]_1\(48)
    );
\ifmap_calc[48]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(48),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(48),
      O => \ifmap_calc[48]_i_1__2_n_0\
    );
\ifmap_calc[49]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(49),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(49),
      O => D(49)
    );
\ifmap_calc[49]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(49),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(49),
      O => \ifmap_calc_reg[63]_0\(49)
    );
\ifmap_calc[49]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(49),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(49),
      O => \ifmap_calc_reg[63]_1\(49)
    );
\ifmap_calc[49]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(49),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(49),
      O => \ifmap_calc[49]_i_1__2_n_0\
    );
\ifmap_calc[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(4),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(4),
      O => D(4)
    );
\ifmap_calc[4]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(4),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(4),
      O => \ifmap_calc_reg[63]_0\(4)
    );
\ifmap_calc[4]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(4),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(4),
      O => \ifmap_calc_reg[63]_1\(4)
    );
\ifmap_calc[4]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(4),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(4),
      O => \ifmap_calc[4]_i_1__2_n_0\
    );
\ifmap_calc[50]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(50),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(50),
      O => D(50)
    );
\ifmap_calc[50]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(50),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(50),
      O => \ifmap_calc_reg[63]_0\(50)
    );
\ifmap_calc[50]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(50),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(50),
      O => \ifmap_calc_reg[63]_1\(50)
    );
\ifmap_calc[50]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(50),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(50),
      O => \ifmap_calc[50]_i_1__2_n_0\
    );
\ifmap_calc[51]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(51),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(51),
      O => D(51)
    );
\ifmap_calc[51]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(51),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(51),
      O => \ifmap_calc_reg[63]_0\(51)
    );
\ifmap_calc[51]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(51),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(51),
      O => \ifmap_calc_reg[63]_1\(51)
    );
\ifmap_calc[51]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(51),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(51),
      O => \ifmap_calc[51]_i_1__2_n_0\
    );
\ifmap_calc[52]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(52),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(52),
      O => D(52)
    );
\ifmap_calc[52]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(52),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(52),
      O => \ifmap_calc_reg[63]_0\(52)
    );
\ifmap_calc[52]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(52),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(52),
      O => \ifmap_calc_reg[63]_1\(52)
    );
\ifmap_calc[52]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(52),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(52),
      O => \ifmap_calc[52]_i_1__2_n_0\
    );
\ifmap_calc[53]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(53),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(53),
      O => D(53)
    );
\ifmap_calc[53]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(53),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(53),
      O => \ifmap_calc_reg[63]_0\(53)
    );
\ifmap_calc[53]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(53),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(53),
      O => \ifmap_calc_reg[63]_1\(53)
    );
\ifmap_calc[53]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(53),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(53),
      O => \ifmap_calc[53]_i_1__2_n_0\
    );
\ifmap_calc[54]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(54),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(54),
      O => D(54)
    );
\ifmap_calc[54]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(54),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(54),
      O => \ifmap_calc_reg[63]_0\(54)
    );
\ifmap_calc[54]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(54),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(54),
      O => \ifmap_calc_reg[63]_1\(54)
    );
\ifmap_calc[54]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(54),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(54),
      O => \ifmap_calc[54]_i_1__2_n_0\
    );
\ifmap_calc[55]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(55),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(55),
      O => D(55)
    );
\ifmap_calc[55]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(55),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(55),
      O => \ifmap_calc_reg[63]_0\(55)
    );
\ifmap_calc[55]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(55),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(55),
      O => \ifmap_calc_reg[63]_1\(55)
    );
\ifmap_calc[55]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(55),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(55),
      O => \ifmap_calc[55]_i_1__2_n_0\
    );
\ifmap_calc[56]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(56),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(56),
      O => D(56)
    );
\ifmap_calc[56]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(56),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(56),
      O => \ifmap_calc_reg[63]_0\(56)
    );
\ifmap_calc[56]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(56),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(56),
      O => \ifmap_calc_reg[63]_1\(56)
    );
\ifmap_calc[56]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(56),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(56),
      O => \ifmap_calc[56]_i_1__2_n_0\
    );
\ifmap_calc[57]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(57),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(57),
      O => D(57)
    );
\ifmap_calc[57]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(57),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(57),
      O => \ifmap_calc_reg[63]_0\(57)
    );
\ifmap_calc[57]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(57),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(57),
      O => \ifmap_calc_reg[63]_1\(57)
    );
\ifmap_calc[57]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(57),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(57),
      O => \ifmap_calc[57]_i_1__2_n_0\
    );
\ifmap_calc[58]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(58),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(58),
      O => D(58)
    );
\ifmap_calc[58]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(58),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(58),
      O => \ifmap_calc_reg[63]_0\(58)
    );
\ifmap_calc[58]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(58),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(58),
      O => \ifmap_calc_reg[63]_1\(58)
    );
\ifmap_calc[58]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(58),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(58),
      O => \ifmap_calc[58]_i_1__2_n_0\
    );
\ifmap_calc[59]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(59),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(59),
      O => D(59)
    );
\ifmap_calc[59]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(59),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(59),
      O => \ifmap_calc_reg[63]_0\(59)
    );
\ifmap_calc[59]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(59),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(59),
      O => \ifmap_calc_reg[63]_1\(59)
    );
\ifmap_calc[59]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(59),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(59),
      O => \ifmap_calc[59]_i_1__2_n_0\
    );
\ifmap_calc[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(5),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(5),
      O => D(5)
    );
\ifmap_calc[5]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(5),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(5),
      O => \ifmap_calc_reg[63]_0\(5)
    );
\ifmap_calc[5]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(5),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(5),
      O => \ifmap_calc_reg[63]_1\(5)
    );
\ifmap_calc[5]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(5),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(5),
      O => \ifmap_calc[5]_i_1__2_n_0\
    );
\ifmap_calc[60]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(60),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(60),
      O => D(60)
    );
\ifmap_calc[60]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(60),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(60),
      O => \ifmap_calc_reg[63]_0\(60)
    );
\ifmap_calc[60]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(60),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(60),
      O => \ifmap_calc_reg[63]_1\(60)
    );
\ifmap_calc[60]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(60),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(60),
      O => \ifmap_calc[60]_i_1__2_n_0\
    );
\ifmap_calc[61]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(61),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(61),
      O => D(61)
    );
\ifmap_calc[61]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(61),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(61),
      O => \ifmap_calc_reg[63]_0\(61)
    );
\ifmap_calc[61]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(61),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(61),
      O => \ifmap_calc_reg[63]_1\(61)
    );
\ifmap_calc[61]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(61),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(61),
      O => \ifmap_calc[61]_i_1__2_n_0\
    );
\ifmap_calc[62]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(62),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(62),
      O => D(62)
    );
\ifmap_calc[62]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(62),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(62),
      O => \ifmap_calc_reg[63]_0\(62)
    );
\ifmap_calc[62]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(62),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(62),
      O => \ifmap_calc_reg[63]_1\(62)
    );
\ifmap_calc[62]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(62),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(62),
      O => \ifmap_calc[62]_i_1__2_n_0\
    );
\ifmap_calc[63]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => \ifmap_calc[63]_i_3_n_0\,
      I1 => \count_ifmap_del_reg_n_0_[0]\,
      I2 => \count_ifmap_del_reg_n_0_[1]\,
      O => ifmap_next
    );
\ifmap_calc[63]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => ifmap_4_IBUF(63),
      I1 => \^ifmap_calc_reg[0]_0\,
      O => D(63)
    );
\ifmap_calc[63]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => ifmap_3_IBUF(63),
      I1 => \^ifmap_calc_reg[0]_1\,
      O => \ifmap_calc_reg[63]_0\(63)
    );
\ifmap_calc[63]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => ifmap_2_IBUF(63),
      I1 => \^ifmap_calc_reg[0]_2\,
      O => \ifmap_calc_reg[63]_1\(63)
    );
\ifmap_calc[63]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => ifmap_1_IBUF(63),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      O => \ifmap_calc[63]_i_2__2_n_0\
    );
\ifmap_calc[63]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => count_row_del(0),
      I1 => count_row_del(6),
      I2 => count_row_del(3),
      I3 => count_row_del(5),
      I4 => \ifmap_calc[63]_i_4_n_0\,
      O => \ifmap_calc[63]_i_3_n_0\
    );
\ifmap_calc[63]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => count_row_del(0),
      I1 => count_row_del(6),
      I2 => count_row_del(3),
      I3 => count_row_del(5),
      I4 => \ifmap_calc[63]_i_4_n_0\,
      O => \^ifmap_calc_reg[0]_2\
    );
\ifmap_calc[63]_i_3__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => count_row_del(0),
      I1 => count_row_del(6),
      I2 => count_row_del(3),
      I3 => count_row_del(5),
      I4 => \ifmap_calc[63]_i_4_n_0\,
      O => \^ifmap_calc_reg[0]_1\
    );
\ifmap_calc[63]_i_3__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => count_row_del(0),
      I1 => count_row_del(6),
      I2 => count_row_del(3),
      I3 => count_row_del(5),
      I4 => \ifmap_calc[63]_i_4_n_0\,
      O => \^ifmap_calc_reg[0]_0\
    );
\ifmap_calc[63]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => count_row_del(7),
      I1 => count_row_del(1),
      I2 => count_row_del(4),
      I3 => count_row_del(2),
      O => \ifmap_calc[63]_i_4_n_0\
    );
\ifmap_calc[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(6),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(6),
      O => D(6)
    );
\ifmap_calc[6]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(6),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(6),
      O => \ifmap_calc_reg[63]_0\(6)
    );
\ifmap_calc[6]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(6),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(6),
      O => \ifmap_calc_reg[63]_1\(6)
    );
\ifmap_calc[6]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(6),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(6),
      O => \ifmap_calc[6]_i_1__2_n_0\
    );
\ifmap_calc[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(7),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(7),
      O => D(7)
    );
\ifmap_calc[7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(7),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(7),
      O => \ifmap_calc_reg[63]_0\(7)
    );
\ifmap_calc[7]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(7),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(7),
      O => \ifmap_calc_reg[63]_1\(7)
    );
\ifmap_calc[7]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(7),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(7),
      O => \ifmap_calc[7]_i_1__2_n_0\
    );
\ifmap_calc[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(8),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(8),
      O => D(8)
    );
\ifmap_calc[8]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(8),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(8),
      O => \ifmap_calc_reg[63]_0\(8)
    );
\ifmap_calc[8]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(8),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(8),
      O => \ifmap_calc_reg[63]_1\(8)
    );
\ifmap_calc[8]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(8),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(8),
      O => \ifmap_calc[8]_i_1__2_n_0\
    );
\ifmap_calc[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_4_IBUF(9),
      I1 => \^ifmap_calc_reg[0]_0\,
      I2 => \ifmap_calc_reg[63]_2\(9),
      O => D(9)
    );
\ifmap_calc[9]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_3_IBUF(9),
      I1 => \^ifmap_calc_reg[0]_1\,
      I2 => \ifmap_calc_reg[63]_3\(9),
      O => \ifmap_calc_reg[63]_0\(9)
    );
\ifmap_calc[9]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_2_IBUF(9),
      I1 => \^ifmap_calc_reg[0]_2\,
      I2 => \ifmap_calc_reg[63]_4\(9),
      O => \ifmap_calc_reg[63]_1\(9)
    );
\ifmap_calc[9]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ifmap_1_IBUF(9),
      I1 => \ifmap_calc[63]_i_3_n_0\,
      I2 => p_0_in(9),
      O => \ifmap_calc[9]_i_1__2_n_0\
    );
\ifmap_calc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[0]_i_1__2_n_0\,
      Q => \ifmap_calc_reg_n_0_[0]\
    );
\ifmap_calc_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[10]_i_1__2_n_0\,
      Q => p_0_in(9)
    );
\ifmap_calc_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[11]_i_1__2_n_0\,
      Q => p_0_in(10)
    );
\ifmap_calc_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[12]_i_1__2_n_0\,
      Q => p_0_in(11)
    );
\ifmap_calc_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[13]_i_1__2_n_0\,
      Q => p_0_in(12)
    );
\ifmap_calc_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[14]_i_1__2_n_0\,
      Q => p_0_in(13)
    );
\ifmap_calc_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[15]_i_1__2_n_0\,
      Q => p_0_in(14)
    );
\ifmap_calc_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[16]_i_1__2_n_0\,
      Q => p_0_in(15)
    );
\ifmap_calc_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[17]_i_1__2_n_0\,
      Q => p_0_in(16)
    );
\ifmap_calc_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[18]_i_1__2_n_0\,
      Q => p_0_in(17)
    );
\ifmap_calc_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[19]_i_1__2_n_0\,
      Q => p_0_in(18)
    );
\ifmap_calc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[1]_i_1__2_n_0\,
      Q => p_0_in(0)
    );
\ifmap_calc_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[20]_i_1__2_n_0\,
      Q => p_0_in(19)
    );
\ifmap_calc_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[21]_i_1__2_n_0\,
      Q => p_0_in(20)
    );
\ifmap_calc_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[22]_i_1__2_n_0\,
      Q => p_0_in(21)
    );
\ifmap_calc_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[23]_i_1__2_n_0\,
      Q => p_0_in(22)
    );
\ifmap_calc_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[24]_i_1__2_n_0\,
      Q => p_0_in(23)
    );
\ifmap_calc_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[25]_i_1__2_n_0\,
      Q => p_0_in(24)
    );
\ifmap_calc_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[26]_i_1__2_n_0\,
      Q => p_0_in(25)
    );
\ifmap_calc_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[27]_i_1__2_n_0\,
      Q => p_0_in(26)
    );
\ifmap_calc_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[28]_i_1__2_n_0\,
      Q => p_0_in(27)
    );
\ifmap_calc_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[29]_i_1__2_n_0\,
      Q => p_0_in(28)
    );
\ifmap_calc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[2]_i_1__2_n_0\,
      Q => p_0_in(1)
    );
\ifmap_calc_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[30]_i_1__2_n_0\,
      Q => p_0_in(29)
    );
\ifmap_calc_reg[31]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[31]_i_1__2_n_0\,
      Q => p_0_in(30)
    );
\ifmap_calc_reg[32]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[32]_i_1__2_n_0\,
      Q => p_0_in(31)
    );
\ifmap_calc_reg[33]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[33]_i_1__2_n_0\,
      Q => p_0_in(32)
    );
\ifmap_calc_reg[34]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[34]_i_1__2_n_0\,
      Q => p_0_in(33)
    );
\ifmap_calc_reg[35]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[35]_i_1__2_n_0\,
      Q => p_0_in(34)
    );
\ifmap_calc_reg[36]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[36]_i_1__2_n_0\,
      Q => p_0_in(35)
    );
\ifmap_calc_reg[37]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[37]_i_1__2_n_0\,
      Q => p_0_in(36)
    );
\ifmap_calc_reg[38]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[38]_i_1__2_n_0\,
      Q => p_0_in(37)
    );
\ifmap_calc_reg[39]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[39]_i_1__2_n_0\,
      Q => p_0_in(38)
    );
\ifmap_calc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[3]_i_1__2_n_0\,
      Q => p_0_in(2)
    );
\ifmap_calc_reg[40]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[40]_i_1__2_n_0\,
      Q => p_0_in(39)
    );
\ifmap_calc_reg[41]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[41]_i_1__2_n_0\,
      Q => p_0_in(40)
    );
\ifmap_calc_reg[42]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[42]_i_1__2_n_0\,
      Q => p_0_in(41)
    );
\ifmap_calc_reg[43]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[43]_i_1__2_n_0\,
      Q => p_0_in(42)
    );
\ifmap_calc_reg[44]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[44]_i_1__2_n_0\,
      Q => p_0_in(43)
    );
\ifmap_calc_reg[45]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[45]_i_1__2_n_0\,
      Q => p_0_in(44)
    );
\ifmap_calc_reg[46]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[46]_i_1__2_n_0\,
      Q => p_0_in(45)
    );
\ifmap_calc_reg[47]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[47]_i_1__2_n_0\,
      Q => p_0_in(46)
    );
\ifmap_calc_reg[48]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[48]_i_1__2_n_0\,
      Q => p_0_in(47)
    );
\ifmap_calc_reg[49]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[49]_i_1__2_n_0\,
      Q => p_0_in(48)
    );
\ifmap_calc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[4]_i_1__2_n_0\,
      Q => p_0_in(3)
    );
\ifmap_calc_reg[50]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[50]_i_1__2_n_0\,
      Q => p_0_in(49)
    );
\ifmap_calc_reg[51]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[51]_i_1__2_n_0\,
      Q => p_0_in(50)
    );
\ifmap_calc_reg[52]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[52]_i_1__2_n_0\,
      Q => p_0_in(51)
    );
\ifmap_calc_reg[53]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[53]_i_1__2_n_0\,
      Q => p_0_in(52)
    );
\ifmap_calc_reg[54]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[54]_i_1__2_n_0\,
      Q => p_0_in(53)
    );
\ifmap_calc_reg[55]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[55]_i_1__2_n_0\,
      Q => p_0_in(54)
    );
\ifmap_calc_reg[56]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[56]_i_1__2_n_0\,
      Q => p_0_in(55)
    );
\ifmap_calc_reg[57]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[57]_i_1__2_n_0\,
      Q => p_0_in(56)
    );
\ifmap_calc_reg[58]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[58]_i_1__2_n_0\,
      Q => p_0_in(57)
    );
\ifmap_calc_reg[59]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[59]_i_1__2_n_0\,
      Q => p_0_in(58)
    );
\ifmap_calc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[5]_i_1__2_n_0\,
      Q => p_0_in(4)
    );
\ifmap_calc_reg[60]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[60]_i_1__2_n_0\,
      Q => p_0_in(59)
    );
\ifmap_calc_reg[61]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[61]_i_1__2_n_0\,
      Q => p_0_in(60)
    );
\ifmap_calc_reg[62]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[62]_i_1__2_n_0\,
      Q => p_0_in(61)
    );
\ifmap_calc_reg[63]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[63]_i_2__2_n_0\,
      Q => p_0_in(62)
    );
\ifmap_calc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[6]_i_1__2_n_0\,
      Q => p_0_in(5)
    );
\ifmap_calc_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[7]_i_1__2_n_0\,
      Q => p_0_in(6)
    );
\ifmap_calc_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[8]_i_1__2_n_0\,
      Q => p_0_in(7)
    );
\ifmap_calc_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => \ifmap_calc[9]_i_1__2_n_0\,
      Q => p_0_in(8)
    );
\res_mul[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_mul[4]_i_2_n_0\,
      I1 => \w1_reg_n_0_[0]\,
      I2 => curr_state,
      O => res_mul_next(0)
    );
\res_mul[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_mul[4]_i_2_n_0\,
      I1 => \w1_reg_n_0_[1]\,
      I2 => curr_state,
      O => res_mul_next(1)
    );
\res_mul[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_mul[4]_i_2_n_0\,
      I1 => \w1_reg_n_0_[2]\,
      I2 => curr_state,
      O => res_mul_next(2)
    );
\res_mul[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_mul[4]_i_2_n_0\,
      I1 => \w1_reg_n_0_[3]\,
      I2 => curr_state,
      O => res_mul_next(4)
    );
\res_mul[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(1),
      I2 => \count_ifmap_del_reg_n_0_[1]\,
      I3 => p_0_in(0),
      I4 => \count_ifmap_del_reg_n_0_[0]\,
      I5 => \ifmap_calc_reg_n_0_[0]\,
      O => \res_mul[4]_i_2_n_0\
    );
\res_mul_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => res_mul_next(0),
      Q => res_mul(0)
    );
\res_mul_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => res_mul_next(1),
      Q => res_mul(1)
    );
\res_mul_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => res_mul_next(2),
      Q => res_mul(2)
    );
\res_mul_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => res_mul_next(4),
      Q => res_mul(4)
    );
start_acc_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \count_del_reg_n_0_[0]\,
      I1 => \count_del_reg_n_0_[1]\,
      I2 => curr_state,
      O => start_acc_next0_out
    );
start_acc_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => start_acc_next0_out,
      Q => start_acc_1
    );
\w1[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF002000000020"
    )
        port map (
      I0 => f_in_IBUF(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3_n_0\,
      I5 => w2(0),
      O => w1_next(0)
    );
\w1[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF002000000020"
    )
        port map (
      I0 => f_in_IBUF(1),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3_n_0\,
      I5 => w2(1),
      O => w1_next(1)
    );
\w1[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF002000000020"
    )
        port map (
      I0 => f_in_IBUF(2),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3_n_0\,
      I5 => w2(2),
      O => w1_next(2)
    );
\w1[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAABAAAA"
    )
        port map (
      I0 => \w4[3]_i_3_n_0\,
      I1 => count_f(0),
      I2 => count_f(1),
      I3 => \count_reg[3]\(1),
      I4 => valid_in_f_IBUF,
      I5 => \count_reg[3]\(0),
      O => \w1[3]_i_1_n_0\
    );
\w1[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF002000000020"
    )
        port map (
      I0 => f_in_IBUF(3),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3_n_0\,
      I5 => w2(3),
      O => w1_next(3)
    );
\w1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w1[3]_i_1_n_0\,
      CLR => AR(0),
      D => w1_next(0),
      Q => \w1_reg_n_0_[0]\
    );
\w1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w1[3]_i_1_n_0\,
      CLR => AR(0),
      D => w1_next(1),
      Q => \w1_reg_n_0_[1]\
    );
\w1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w1[3]_i_1_n_0\,
      CLR => AR(0),
      D => w1_next(2),
      Q => \w1_reg_n_0_[2]\
    );
\w1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w1[3]_i_1_n_0\,
      CLR => AR(0),
      D => w1_next(3),
      Q => \w1_reg_n_0_[3]\
    );
\w2[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF002000000020"
    )
        port map (
      I0 => f_in_IBUF(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3_n_0\,
      I5 => w3(0),
      O => w2_next(0)
    );
\w2[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF002000000020"
    )
        port map (
      I0 => f_in_IBUF(1),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3_n_0\,
      I5 => w3(1),
      O => w2_next(1)
    );
\w2[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF002000000020"
    )
        port map (
      I0 => f_in_IBUF(2),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3_n_0\,
      I5 => w3(2),
      O => w2_next(2)
    );
\w2[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAABAAAAA"
    )
        port map (
      I0 => \w4[3]_i_3_n_0\,
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => count_f(0),
      I5 => count_f(1),
      O => \w2[3]_i_1_n_0\
    );
\w2[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF002000000020"
    )
        port map (
      I0 => f_in_IBUF(3),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3_n_0\,
      I5 => w3(3),
      O => w2_next(3)
    );
\w2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w2[3]_i_1_n_0\,
      CLR => AR(0),
      D => w2_next(0),
      Q => w2(0)
    );
\w2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w2[3]_i_1_n_0\,
      CLR => AR(0),
      D => w2_next(1),
      Q => w2(1)
    );
\w2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w2[3]_i_1_n_0\,
      CLR => AR(0),
      D => w2_next(2),
      Q => w2(2)
    );
\w2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w2[3]_i_1_n_0\,
      CLR => AR(0),
      D => w2_next(3),
      Q => w2(3)
    );
\w3[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF002000000020"
    )
        port map (
      I0 => f_in_IBUF(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3_n_0\,
      I5 => w4(0),
      O => w3_next(0)
    );
\w3[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF002000000020"
    )
        port map (
      I0 => f_in_IBUF(1),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3_n_0\,
      I5 => w4(1),
      O => w3_next(1)
    );
\w3[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF002000000020"
    )
        port map (
      I0 => f_in_IBUF(2),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3_n_0\,
      I5 => w4(2),
      O => w3_next(2)
    );
\w3[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAABAAAAAAAAAA"
    )
        port map (
      I0 => \w4[3]_i_3_n_0\,
      I1 => count_f(0),
      I2 => \count_reg[3]\(1),
      I3 => valid_in_f_IBUF,
      I4 => \count_reg[3]\(0),
      I5 => count_f(1),
      O => \w3[3]_i_1_n_0\
    );
\w3[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF002000000020"
    )
        port map (
      I0 => f_in_IBUF(3),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3_n_0\,
      I5 => w4(3),
      O => w3_next(3)
    );
\w3_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w3[3]_i_1_n_0\,
      CLR => AR(0),
      D => w3_next(0),
      Q => w3(0)
    );
\w3_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w3[3]_i_1_n_0\,
      CLR => AR(0),
      D => w3_next(1),
      Q => w3(1)
    );
\w3_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w3[3]_i_1_n_0\,
      CLR => AR(0),
      D => w3_next(2),
      Q => w3(2)
    );
\w3_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w3[3]_i_1_n_0\,
      CLR => AR(0),
      D => w3_next(3),
      Q => w3(3)
    );
\w4[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF002000000020"
    )
        port map (
      I0 => f_in_IBUF(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3_n_0\,
      I5 => \w1_reg_n_0_[0]\,
      O => w4_next(0)
    );
\w4[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF002000000020"
    )
        port map (
      I0 => f_in_IBUF(1),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3_n_0\,
      I5 => \w1_reg_n_0_[1]\,
      O => w4_next(1)
    );
\w4[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF002000000020"
    )
        port map (
      I0 => f_in_IBUF(2),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3_n_0\,
      I5 => \w1_reg_n_0_[2]\,
      O => w4_next(2)
    );
\w4[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABAAAAAAAAAAAAA"
    )
        port map (
      I0 => \w4[3]_i_3_n_0\,
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => count_f(0),
      I5 => count_f(1),
      O => \w4[3]_i_1_n_0\
    );
\w4[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF002000000020"
    )
        port map (
      I0 => f_in_IBUF(3),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3_n_0\,
      I5 => \w1_reg_n_0_[3]\,
      O => w4_next(3)
    );
\w4[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state,
      I1 => finish_IBUF,
      O => \w4[3]_i_3_n_0\
    );
\w4_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w4[3]_i_1_n_0\,
      CLR => AR(0),
      D => w4_next(0),
      Q => w4(0)
    );
\w4_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w4[3]_i_1_n_0\,
      CLR => AR(0),
      D => w4_next(1),
      Q => w4(1)
    );
\w4_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w4[3]_i_1_n_0\,
      CLR => AR(0),
      D => w4_next(2),
      Q => w4(2)
    );
\w4_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w4[3]_i_1_n_0\,
      CLR => AR(0),
      D => w4_next(3),
      Q => w4(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity PE_0 is
  port (
    start_acc_2 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \ifmap_calc_reg[62]_0\ : out STD_LOGIC_VECTOR ( 62 downto 0 );
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    start_IBUF : in STD_LOGIC;
    finish_IBUF : in STD_LOGIC;
    \count_reg[3]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    valid_in_f_IBUF : in STD_LOGIC;
    f_in_IBUF : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \count_row_del_reg[0]\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of PE_0 : entity is "PE";
end PE_0;

architecture STRUCTURE of PE_0 is
  signal \Psum_calc[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \Psum_calc[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \Psum_calc[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \Psum_calc[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \Psum_calc[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \Psum_calc[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \Psum_calc[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \Psum_calc[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_1__0_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_2__0_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_3__0_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_4__0_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_5__0_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_1\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_2\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_3\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_4\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_5\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_6\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_7\ : STD_LOGIC;
  signal \Psum_next0_carry_i_1__0_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry_i_2__0_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry_i_3__0_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry_i_4__0_n_0\ : STD_LOGIC;
  signal Psum_next0_carry_n_0 : STD_LOGIC;
  signal Psum_next0_carry_n_1 : STD_LOGIC;
  signal Psum_next0_carry_n_2 : STD_LOGIC;
  signal Psum_next0_carry_n_3 : STD_LOGIC;
  signal Psum_next0_carry_n_4 : STD_LOGIC;
  signal Psum_next0_carry_n_5 : STD_LOGIC;
  signal Psum_next0_carry_n_6 : STD_LOGIC;
  signal Psum_next0_carry_n_7 : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \count_del_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_del_reg_n_0_[1]\ : STD_LOGIC;
  signal count_f : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \count_f[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_ifmap_del_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_ifmap_del_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_ifmap_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_ifmap_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal curr_state : STD_LOGIC;
  signal \^ifmap_calc_reg[62]_0\ : STD_LOGIC_VECTOR ( 62 downto 0 );
  signal \ifmap_calc_reg_n_0_[0]\ : STD_LOGIC;
  signal ifmap_next : STD_LOGIC;
  signal next_count : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal next_count_f : STD_LOGIC_VECTOR ( 1 to 1 );
  signal next_count_ifmap : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal next_state : STD_LOGIC;
  signal \res_mul[4]_i_2__0_n_0\ : STD_LOGIC;
  signal res_mul_next : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \res_mul_reg_n_0_[0]\ : STD_LOGIC;
  signal \res_mul_reg_n_0_[1]\ : STD_LOGIC;
  signal \res_mul_reg_n_0_[2]\ : STD_LOGIC;
  signal \res_mul_reg_n_0_[4]\ : STD_LOGIC;
  signal start_acc_next0_out : STD_LOGIC;
  signal \w1[3]_i_1__1_n_0\ : STD_LOGIC;
  signal w1_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w1_reg_n_0_[0]\ : STD_LOGIC;
  signal \w1_reg_n_0_[1]\ : STD_LOGIC;
  signal \w1_reg_n_0_[2]\ : STD_LOGIC;
  signal \w1_reg_n_0_[3]\ : STD_LOGIC;
  signal w2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w2[3]_i_1__1_n_0\ : STD_LOGIC;
  signal w2_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal w3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w3[3]_i_1__1_n_0\ : STD_LOGIC;
  signal w3_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal w4 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w4[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \w4[3]_i_3__0_n_0\ : STD_LOGIC;
  signal w4_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_Psum_next0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \Psum_calc[6]_i_1__0\ : label is "soft_lutpair135";
  attribute SOFT_HLUTNM of \count[0]_i_1__1\ : label is "soft_lutpair141";
  attribute SOFT_HLUTNM of \count[1]_i_1__1\ : label is "soft_lutpair141";
  attribute SOFT_HLUTNM of \count_f[0]_i_1__1\ : label is "soft_lutpair136";
  attribute SOFT_HLUTNM of \count_f[1]_i_1__1\ : label is "soft_lutpair136";
  attribute SOFT_HLUTNM of \count_ifmap[0]_i_1__0\ : label is "soft_lutpair137";
  attribute SOFT_HLUTNM of \count_ifmap[1]_i_1__0\ : label is "soft_lutpair137";
  attribute SOFT_HLUTNM of \curr_state_i_1__0\ : label is "soft_lutpair139";
  attribute SOFT_HLUTNM of \res_mul[0]_i_1__0\ : label is "soft_lutpair140";
  attribute SOFT_HLUTNM of \res_mul[1]_i_1__0\ : label is "soft_lutpair140";
  attribute SOFT_HLUTNM of \res_mul[2]_i_1__0\ : label is "soft_lutpair138";
  attribute SOFT_HLUTNM of \res_mul[4]_i_1__0\ : label is "soft_lutpair138";
  attribute SOFT_HLUTNM of \start_acc_i_1__0\ : label is "soft_lutpair135";
  attribute SOFT_HLUTNM of \w4[3]_i_3__0\ : label is "soft_lutpair139";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
  \ifmap_calc_reg[62]_0\(62 downto 0) <= \^ifmap_calc_reg[62]_0\(62 downto 0);
\Psum_calc[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0_carry_n_7,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[0]\,
      O => \Psum_calc[0]_i_1__0_n_0\
    );
\Psum_calc[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0_carry_n_6,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[1]\,
      O => \Psum_calc[1]_i_1__0_n_0\
    );
\Psum_calc[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0_carry_n_5,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[2]\,
      O => \Psum_calc[2]_i_1__0_n_0\
    );
\Psum_calc[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0_carry_n_4,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[4]\,
      O => \Psum_calc[3]_i_1__0_n_0\
    );
\Psum_calc[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => \Psum_next0_carry__0_n_7\,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[4]\,
      O => \Psum_calc[4]_i_1__0_n_0\
    );
\Psum_calc[5]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => \Psum_next0_carry__0_n_6\,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[4]\,
      O => \Psum_calc[5]_i_1__0_n_0\
    );
\Psum_calc[6]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => \Psum_next0_carry__0_n_5\,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[4]\,
      O => \Psum_calc[6]_i_1__0_n_0\
    );
\Psum_calc[7]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => \Psum_next0_carry__0_n_4\,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[4]\,
      O => \Psum_calc[7]_i_1__0_n_0\
    );
\Psum_calc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[0]_i_1__0_n_0\,
      Q => \^q\(0)
    );
\Psum_calc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[1]_i_1__0_n_0\,
      Q => \^q\(1)
    );
\Psum_calc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[2]_i_1__0_n_0\,
      Q => \^q\(2)
    );
\Psum_calc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[3]_i_1__0_n_0\,
      Q => \^q\(3)
    );
\Psum_calc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[4]_i_1__0_n_0\,
      Q => \^q\(4)
    );
\Psum_calc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[5]_i_1__0_n_0\,
      Q => \^q\(5)
    );
\Psum_calc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[6]_i_1__0_n_0\,
      Q => \^q\(6)
    );
\Psum_calc_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[7]_i_1__0_n_0\,
      Q => \^q\(7)
    );
Psum_next0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => Psum_next0_carry_n_0,
      CO(2) => Psum_next0_carry_n_1,
      CO(1) => Psum_next0_carry_n_2,
      CO(0) => Psum_next0_carry_n_3,
      CYINIT => '0',
      DI(3) => \res_mul_reg_n_0_[4]\,
      DI(2) => \res_mul_reg_n_0_[2]\,
      DI(1) => \res_mul_reg_n_0_[1]\,
      DI(0) => \res_mul_reg_n_0_[0]\,
      O(3) => Psum_next0_carry_n_4,
      O(2) => Psum_next0_carry_n_5,
      O(1) => Psum_next0_carry_n_6,
      O(0) => Psum_next0_carry_n_7,
      S(3) => \Psum_next0_carry_i_1__0_n_0\,
      S(2) => \Psum_next0_carry_i_2__0_n_0\,
      S(1) => \Psum_next0_carry_i_3__0_n_0\,
      S(0) => \Psum_next0_carry_i_4__0_n_0\
    );
\Psum_next0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => Psum_next0_carry_n_0,
      CO(3) => \NLW_Psum_next0_carry__0_CO_UNCONNECTED\(3),
      CO(2) => \Psum_next0_carry__0_n_1\,
      CO(1) => \Psum_next0_carry__0_n_2\,
      CO(0) => \Psum_next0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 1) => \^q\(5 downto 4),
      DI(0) => \Psum_next0_carry__0_i_1__0_n_0\,
      O(3) => \Psum_next0_carry__0_n_4\,
      O(2) => \Psum_next0_carry__0_n_5\,
      O(1) => \Psum_next0_carry__0_n_6\,
      O(0) => \Psum_next0_carry__0_n_7\,
      S(3) => \Psum_next0_carry__0_i_2__0_n_0\,
      S(2) => \Psum_next0_carry__0_i_3__0_n_0\,
      S(1) => \Psum_next0_carry__0_i_4__0_n_0\,
      S(0) => \Psum_next0_carry__0_i_5__0_n_0\
    );
\Psum_next0_carry__0_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(4),
      O => \Psum_next0_carry__0_i_1__0_n_0\
    );
\Psum_next0_carry__0_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(7),
      O => \Psum_next0_carry__0_i_2__0_n_0\
    );
\Psum_next0_carry__0_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(6),
      O => \Psum_next0_carry__0_i_3__0_n_0\
    );
\Psum_next0_carry__0_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(5),
      O => \Psum_next0_carry__0_i_4__0_n_0\
    );
\Psum_next0_carry__0_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(4),
      I1 => \res_mul_reg_n_0_[4]\,
      O => \Psum_next0_carry__0_i_5__0_n_0\
    );
\Psum_next0_carry_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \res_mul_reg_n_0_[4]\,
      I1 => \^q\(3),
      O => \Psum_next0_carry_i_1__0_n_0\
    );
\Psum_next0_carry_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \res_mul_reg_n_0_[2]\,
      I1 => \^q\(2),
      O => \Psum_next0_carry_i_2__0_n_0\
    );
\Psum_next0_carry_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \res_mul_reg_n_0_[1]\,
      I1 => \^q\(1),
      O => \Psum_next0_carry_i_3__0_n_0\
    );
\Psum_next0_carry_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \res_mul_reg_n_0_[0]\,
      I1 => \^q\(0),
      O => \Psum_next0_carry_i_4__0_n_0\
    );
\count[0]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state,
      I1 => \count_reg_n_0_[0]\,
      O => next_count(0)
    );
\count[1]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => curr_state,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      O => next_count(1)
    );
\count_del_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_reg_n_0_[0]\,
      Q => \count_del_reg_n_0_[0]\
    );
\count_del_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_reg_n_0_[1]\,
      Q => \count_del_reg_n_0_[1]\
    );
\count_f[0]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => count_f(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      O => \count_f[0]_i_1__1_n_0\
    );
\count_f[1]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080800"
    )
        port map (
      I0 => \count_reg[3]\(0),
      I1 => valid_in_f_IBUF,
      I2 => \count_reg[3]\(1),
      I3 => count_f(1),
      I4 => count_f(0),
      O => next_count_f(1)
    );
\count_f_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_f[0]_i_1__1_n_0\,
      Q => count_f(0)
    );
\count_f_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count_f(1),
      Q => count_f(1)
    );
\count_ifmap[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => \count_ifmap_reg_n_0_[0]\,
      I1 => curr_state,
      I2 => start_IBUF,
      O => next_count_ifmap(0)
    );
\count_ifmap[1]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6660"
    )
        port map (
      I0 => \count_ifmap_reg_n_0_[1]\,
      I1 => \count_ifmap_reg_n_0_[0]\,
      I2 => curr_state,
      I3 => start_IBUF,
      O => next_count_ifmap(1)
    );
\count_ifmap_del_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_ifmap_reg_n_0_[0]\,
      Q => \count_ifmap_del_reg_n_0_[0]\
    );
\count_ifmap_del_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_ifmap_reg_n_0_[1]\,
      Q => \count_ifmap_del_reg_n_0_[1]\
    );
\count_ifmap_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count_ifmap(0),
      Q => \count_ifmap_reg_n_0_[0]\
    );
\count_ifmap_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count_ifmap(1),
      Q => \count_ifmap_reg_n_0_[1]\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count(0),
      Q => \count_reg_n_0_[0]\
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count(1),
      Q => \count_reg_n_0_[1]\
    );
\curr_state_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => finish_IBUF,
      I1 => curr_state,
      I2 => start_IBUF,
      O => next_state
    );
curr_state_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_state,
      Q => curr_state
    );
\ifmap_calc[63]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => \count_row_del_reg[0]\,
      I1 => \count_ifmap_del_reg_n_0_[0]\,
      I2 => \count_ifmap_del_reg_n_0_[1]\,
      O => ifmap_next
    );
\ifmap_calc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(0),
      Q => \ifmap_calc_reg_n_0_[0]\
    );
\ifmap_calc_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(10),
      Q => \^ifmap_calc_reg[62]_0\(9)
    );
\ifmap_calc_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(11),
      Q => \^ifmap_calc_reg[62]_0\(10)
    );
\ifmap_calc_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(12),
      Q => \^ifmap_calc_reg[62]_0\(11)
    );
\ifmap_calc_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(13),
      Q => \^ifmap_calc_reg[62]_0\(12)
    );
\ifmap_calc_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(14),
      Q => \^ifmap_calc_reg[62]_0\(13)
    );
\ifmap_calc_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(15),
      Q => \^ifmap_calc_reg[62]_0\(14)
    );
\ifmap_calc_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(16),
      Q => \^ifmap_calc_reg[62]_0\(15)
    );
\ifmap_calc_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(17),
      Q => \^ifmap_calc_reg[62]_0\(16)
    );
\ifmap_calc_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(18),
      Q => \^ifmap_calc_reg[62]_0\(17)
    );
\ifmap_calc_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(19),
      Q => \^ifmap_calc_reg[62]_0\(18)
    );
\ifmap_calc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(1),
      Q => \^ifmap_calc_reg[62]_0\(0)
    );
\ifmap_calc_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(20),
      Q => \^ifmap_calc_reg[62]_0\(19)
    );
\ifmap_calc_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(21),
      Q => \^ifmap_calc_reg[62]_0\(20)
    );
\ifmap_calc_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(22),
      Q => \^ifmap_calc_reg[62]_0\(21)
    );
\ifmap_calc_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(23),
      Q => \^ifmap_calc_reg[62]_0\(22)
    );
\ifmap_calc_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(24),
      Q => \^ifmap_calc_reg[62]_0\(23)
    );
\ifmap_calc_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(25),
      Q => \^ifmap_calc_reg[62]_0\(24)
    );
\ifmap_calc_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(26),
      Q => \^ifmap_calc_reg[62]_0\(25)
    );
\ifmap_calc_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(27),
      Q => \^ifmap_calc_reg[62]_0\(26)
    );
\ifmap_calc_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(28),
      Q => \^ifmap_calc_reg[62]_0\(27)
    );
\ifmap_calc_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(29),
      Q => \^ifmap_calc_reg[62]_0\(28)
    );
\ifmap_calc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(2),
      Q => \^ifmap_calc_reg[62]_0\(1)
    );
\ifmap_calc_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(30),
      Q => \^ifmap_calc_reg[62]_0\(29)
    );
\ifmap_calc_reg[31]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(31),
      Q => \^ifmap_calc_reg[62]_0\(30)
    );
\ifmap_calc_reg[32]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(32),
      Q => \^ifmap_calc_reg[62]_0\(31)
    );
\ifmap_calc_reg[33]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(33),
      Q => \^ifmap_calc_reg[62]_0\(32)
    );
\ifmap_calc_reg[34]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(34),
      Q => \^ifmap_calc_reg[62]_0\(33)
    );
\ifmap_calc_reg[35]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(35),
      Q => \^ifmap_calc_reg[62]_0\(34)
    );
\ifmap_calc_reg[36]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(36),
      Q => \^ifmap_calc_reg[62]_0\(35)
    );
\ifmap_calc_reg[37]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(37),
      Q => \^ifmap_calc_reg[62]_0\(36)
    );
\ifmap_calc_reg[38]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(38),
      Q => \^ifmap_calc_reg[62]_0\(37)
    );
\ifmap_calc_reg[39]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(39),
      Q => \^ifmap_calc_reg[62]_0\(38)
    );
\ifmap_calc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(3),
      Q => \^ifmap_calc_reg[62]_0\(2)
    );
\ifmap_calc_reg[40]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(40),
      Q => \^ifmap_calc_reg[62]_0\(39)
    );
\ifmap_calc_reg[41]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(41),
      Q => \^ifmap_calc_reg[62]_0\(40)
    );
\ifmap_calc_reg[42]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(42),
      Q => \^ifmap_calc_reg[62]_0\(41)
    );
\ifmap_calc_reg[43]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(43),
      Q => \^ifmap_calc_reg[62]_0\(42)
    );
\ifmap_calc_reg[44]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(44),
      Q => \^ifmap_calc_reg[62]_0\(43)
    );
\ifmap_calc_reg[45]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(45),
      Q => \^ifmap_calc_reg[62]_0\(44)
    );
\ifmap_calc_reg[46]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(46),
      Q => \^ifmap_calc_reg[62]_0\(45)
    );
\ifmap_calc_reg[47]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(47),
      Q => \^ifmap_calc_reg[62]_0\(46)
    );
\ifmap_calc_reg[48]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(48),
      Q => \^ifmap_calc_reg[62]_0\(47)
    );
\ifmap_calc_reg[49]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(49),
      Q => \^ifmap_calc_reg[62]_0\(48)
    );
\ifmap_calc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(4),
      Q => \^ifmap_calc_reg[62]_0\(3)
    );
\ifmap_calc_reg[50]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(50),
      Q => \^ifmap_calc_reg[62]_0\(49)
    );
\ifmap_calc_reg[51]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(51),
      Q => \^ifmap_calc_reg[62]_0\(50)
    );
\ifmap_calc_reg[52]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(52),
      Q => \^ifmap_calc_reg[62]_0\(51)
    );
\ifmap_calc_reg[53]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(53),
      Q => \^ifmap_calc_reg[62]_0\(52)
    );
\ifmap_calc_reg[54]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(54),
      Q => \^ifmap_calc_reg[62]_0\(53)
    );
\ifmap_calc_reg[55]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(55),
      Q => \^ifmap_calc_reg[62]_0\(54)
    );
\ifmap_calc_reg[56]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(56),
      Q => \^ifmap_calc_reg[62]_0\(55)
    );
\ifmap_calc_reg[57]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(57),
      Q => \^ifmap_calc_reg[62]_0\(56)
    );
\ifmap_calc_reg[58]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(58),
      Q => \^ifmap_calc_reg[62]_0\(57)
    );
\ifmap_calc_reg[59]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(59),
      Q => \^ifmap_calc_reg[62]_0\(58)
    );
\ifmap_calc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(5),
      Q => \^ifmap_calc_reg[62]_0\(4)
    );
\ifmap_calc_reg[60]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(60),
      Q => \^ifmap_calc_reg[62]_0\(59)
    );
\ifmap_calc_reg[61]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(61),
      Q => \^ifmap_calc_reg[62]_0\(60)
    );
\ifmap_calc_reg[62]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(62),
      Q => \^ifmap_calc_reg[62]_0\(61)
    );
\ifmap_calc_reg[63]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(63),
      Q => \^ifmap_calc_reg[62]_0\(62)
    );
\ifmap_calc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(6),
      Q => \^ifmap_calc_reg[62]_0\(5)
    );
\ifmap_calc_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(7),
      Q => \^ifmap_calc_reg[62]_0\(6)
    );
\ifmap_calc_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(8),
      Q => \^ifmap_calc_reg[62]_0\(7)
    );
\ifmap_calc_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(9),
      Q => \^ifmap_calc_reg[62]_0\(8)
    );
\res_mul[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_mul[4]_i_2__0_n_0\,
      I1 => \w1_reg_n_0_[0]\,
      I2 => curr_state,
      O => res_mul_next(0)
    );
\res_mul[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_mul[4]_i_2__0_n_0\,
      I1 => \w1_reg_n_0_[1]\,
      I2 => curr_state,
      O => res_mul_next(1)
    );
\res_mul[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_mul[4]_i_2__0_n_0\,
      I1 => \w1_reg_n_0_[2]\,
      I2 => curr_state,
      O => res_mul_next(2)
    );
\res_mul[4]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_mul[4]_i_2__0_n_0\,
      I1 => \w1_reg_n_0_[3]\,
      I2 => curr_state,
      O => res_mul_next(4)
    );
\res_mul[4]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^ifmap_calc_reg[62]_0\(2),
      I1 => \^ifmap_calc_reg[62]_0\(1),
      I2 => \count_ifmap_del_reg_n_0_[1]\,
      I3 => \^ifmap_calc_reg[62]_0\(0),
      I4 => \count_ifmap_del_reg_n_0_[0]\,
      I5 => \ifmap_calc_reg_n_0_[0]\,
      O => \res_mul[4]_i_2__0_n_0\
    );
\res_mul_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => res_mul_next(0),
      Q => \res_mul_reg_n_0_[0]\
    );
\res_mul_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => res_mul_next(1),
      Q => \res_mul_reg_n_0_[1]\
    );
\res_mul_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => res_mul_next(2),
      Q => \res_mul_reg_n_0_[2]\
    );
\res_mul_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => res_mul_next(4),
      Q => \res_mul_reg_n_0_[4]\
    );
\start_acc_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \count_del_reg_n_0_[0]\,
      I1 => \count_del_reg_n_0_[1]\,
      I2 => curr_state,
      O => start_acc_next0_out
    );
start_acc_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => start_acc_next0_out,
      Q => start_acc_2
    );
\w1[0]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000002000"
    )
        port map (
      I0 => f_in_IBUF(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__0_n_0\,
      I5 => w2(0),
      O => w1_next(0)
    );
\w1[1]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000002000"
    )
        port map (
      I0 => f_in_IBUF(1),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__0_n_0\,
      I5 => w2(1),
      O => w1_next(1)
    );
\w1[2]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000002000"
    )
        port map (
      I0 => f_in_IBUF(2),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__0_n_0\,
      I5 => w2(2),
      O => w1_next(2)
    );
\w1[3]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAAAAAAAAA"
    )
        port map (
      I0 => \w4[3]_i_3__0_n_0\,
      I1 => count_f(0),
      I2 => count_f(1),
      I3 => \count_reg[3]\(1),
      I4 => valid_in_f_IBUF,
      I5 => \count_reg[3]\(0),
      O => \w1[3]_i_1__1_n_0\
    );
\w1[3]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000002000"
    )
        port map (
      I0 => f_in_IBUF(3),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__0_n_0\,
      I5 => w2(3),
      O => w1_next(3)
    );
\w1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w1[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => w1_next(0),
      Q => \w1_reg_n_0_[0]\
    );
\w1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w1[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => w1_next(1),
      Q => \w1_reg_n_0_[1]\
    );
\w1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w1[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => w1_next(2),
      Q => \w1_reg_n_0_[2]\
    );
\w1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w1[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => w1_next(3),
      Q => \w1_reg_n_0_[3]\
    );
\w2[0]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000002000"
    )
        port map (
      I0 => f_in_IBUF(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__0_n_0\,
      I5 => w3(0),
      O => w2_next(0)
    );
\w2[1]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000002000"
    )
        port map (
      I0 => f_in_IBUF(1),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__0_n_0\,
      I5 => w3(1),
      O => w2_next(1)
    );
\w2[2]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000002000"
    )
        port map (
      I0 => f_in_IBUF(2),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__0_n_0\,
      I5 => w3(2),
      O => w2_next(2)
    );
\w2[3]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAABAAAAAAA"
    )
        port map (
      I0 => \w4[3]_i_3__0_n_0\,
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => count_f(0),
      I5 => count_f(1),
      O => \w2[3]_i_1__1_n_0\
    );
\w2[3]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000002000"
    )
        port map (
      I0 => f_in_IBUF(3),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__0_n_0\,
      I5 => w3(3),
      O => w2_next(3)
    );
\w2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w2[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => w2_next(0),
      Q => w2(0)
    );
\w2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w2[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => w2_next(1),
      Q => w2(1)
    );
\w2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w2[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => w2_next(2),
      Q => w2(2)
    );
\w2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w2[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => w2_next(3),
      Q => w2(3)
    );
\w3[0]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000002000"
    )
        port map (
      I0 => f_in_IBUF(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__0_n_0\,
      I5 => w4(0),
      O => w3_next(0)
    );
\w3[1]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000002000"
    )
        port map (
      I0 => f_in_IBUF(1),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__0_n_0\,
      I5 => w4(1),
      O => w3_next(1)
    );
\w3[2]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000002000"
    )
        port map (
      I0 => f_in_IBUF(2),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__0_n_0\,
      I5 => w4(2),
      O => w3_next(2)
    );
\w3[3]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \w4[3]_i_3__0_n_0\,
      I1 => count_f(0),
      I2 => \count_reg[3]\(1),
      I3 => valid_in_f_IBUF,
      I4 => \count_reg[3]\(0),
      I5 => count_f(1),
      O => \w3[3]_i_1__1_n_0\
    );
\w3[3]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000002000"
    )
        port map (
      I0 => f_in_IBUF(3),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__0_n_0\,
      I5 => w4(3),
      O => w3_next(3)
    );
\w3_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w3[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => w3_next(0),
      Q => w3(0)
    );
\w3_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w3[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => w3_next(1),
      Q => w3(1)
    );
\w3_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w3[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => w3_next(2),
      Q => w3(2)
    );
\w3_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w3[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => w3_next(3),
      Q => w3(3)
    );
\w4[0]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000002000"
    )
        port map (
      I0 => f_in_IBUF(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__0_n_0\,
      I5 => \w1_reg_n_0_[0]\,
      O => w4_next(0)
    );
\w4[1]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000002000"
    )
        port map (
      I0 => f_in_IBUF(1),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__0_n_0\,
      I5 => \w1_reg_n_0_[1]\,
      O => w4_next(1)
    );
\w4[2]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000002000"
    )
        port map (
      I0 => f_in_IBUF(2),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__0_n_0\,
      I5 => \w1_reg_n_0_[2]\,
      O => w4_next(2)
    );
\w4[3]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \w4[3]_i_3__0_n_0\,
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => count_f(0),
      I5 => count_f(1),
      O => \w4[3]_i_1__1_n_0\
    );
\w4[3]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF200000002000"
    )
        port map (
      I0 => f_in_IBUF(3),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__0_n_0\,
      I5 => \w1_reg_n_0_[3]\,
      O => w4_next(3)
    );
\w4[3]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state,
      I1 => finish_IBUF,
      O => \w4[3]_i_3__0_n_0\
    );
\w4_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w4[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => w4_next(0),
      Q => w4(0)
    );
\w4_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w4[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => w4_next(1),
      Q => w4(1)
    );
\w4_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w4[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => w4_next(2),
      Q => w4(2)
    );
\w4_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w4[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => w4_next(3),
      Q => w4(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity PE_1 is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    start_acc_OBUF : out STD_LOGIC;
    \ifmap_calc_reg[62]_0\ : out STD_LOGIC_VECTOR ( 62 downto 0 );
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    start_acc_2 : in STD_LOGIC;
    start_acc_1 : in STD_LOGIC;
    start_acc_4 : in STD_LOGIC;
    start_IBUF : in STD_LOGIC;
    finish_IBUF : in STD_LOGIC;
    \count_reg[3]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    valid_in_f_IBUF : in STD_LOGIC;
    f_in_IBUF : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \count_row_del_reg[0]\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of PE_1 : entity is "PE";
end PE_1;

architecture STRUCTURE of PE_1 is
  signal \Psum_calc[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \Psum_calc[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \Psum_calc[2]_i_1__1_n_0\ : STD_LOGIC;
  signal \Psum_calc[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \Psum_calc[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \Psum_calc[5]_i_1__1_n_0\ : STD_LOGIC;
  signal \Psum_calc[6]_i_1__1_n_0\ : STD_LOGIC;
  signal \Psum_calc[7]_i_1__1_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_1__1_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_2__1_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_3__1_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_4__1_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_5__1_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_1\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_2\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_3\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_4\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_5\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_6\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_7\ : STD_LOGIC;
  signal \Psum_next0_carry_i_1__1_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry_i_2__1_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry_i_3__1_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry_i_4__1_n_0\ : STD_LOGIC;
  signal Psum_next0_carry_n_0 : STD_LOGIC;
  signal Psum_next0_carry_n_1 : STD_LOGIC;
  signal Psum_next0_carry_n_2 : STD_LOGIC;
  signal Psum_next0_carry_n_3 : STD_LOGIC;
  signal Psum_next0_carry_n_4 : STD_LOGIC;
  signal Psum_next0_carry_n_5 : STD_LOGIC;
  signal Psum_next0_carry_n_6 : STD_LOGIC;
  signal Psum_next0_carry_n_7 : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \count_del_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_del_reg_n_0_[1]\ : STD_LOGIC;
  signal count_f : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \count_f[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_ifmap_del_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_ifmap_del_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_ifmap_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_ifmap_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal curr_state : STD_LOGIC;
  signal \^ifmap_calc_reg[62]_0\ : STD_LOGIC_VECTOR ( 62 downto 0 );
  signal \ifmap_calc_reg_n_0_[0]\ : STD_LOGIC;
  signal ifmap_next : STD_LOGIC;
  signal next_count : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal next_count_f : STD_LOGIC_VECTOR ( 1 to 1 );
  signal next_count_ifmap : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal next_state : STD_LOGIC;
  signal \res_mul[4]_i_2__1_n_0\ : STD_LOGIC;
  signal res_mul_next : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \res_mul_reg_n_0_[0]\ : STD_LOGIC;
  signal \res_mul_reg_n_0_[1]\ : STD_LOGIC;
  signal \res_mul_reg_n_0_[2]\ : STD_LOGIC;
  signal \res_mul_reg_n_0_[4]\ : STD_LOGIC;
  signal start_acc_3 : STD_LOGIC;
  signal start_acc_next0_out : STD_LOGIC;
  signal \w1[3]_i_1__0_n_0\ : STD_LOGIC;
  signal w1_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w1_reg_n_0_[0]\ : STD_LOGIC;
  signal \w1_reg_n_0_[1]\ : STD_LOGIC;
  signal \w1_reg_n_0_[2]\ : STD_LOGIC;
  signal \w1_reg_n_0_[3]\ : STD_LOGIC;
  signal w2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w2[3]_i_1__0_n_0\ : STD_LOGIC;
  signal w2_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal w3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w3[3]_i_1__0_n_0\ : STD_LOGIC;
  signal w3_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal w4 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w4[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \w4[3]_i_3__1_n_0\ : STD_LOGIC;
  signal w4_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_Psum_next0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \Psum_calc[6]_i_1__1\ : label is "soft_lutpair142";
  attribute SOFT_HLUTNM of \count[0]_i_1__2\ : label is "soft_lutpair148";
  attribute SOFT_HLUTNM of \count[1]_i_1__2\ : label is "soft_lutpair148";
  attribute SOFT_HLUTNM of \count_f[0]_i_1__0\ : label is "soft_lutpair143";
  attribute SOFT_HLUTNM of \count_f[1]_i_1__0\ : label is "soft_lutpair143";
  attribute SOFT_HLUTNM of \count_ifmap[0]_i_1__1\ : label is "soft_lutpair144";
  attribute SOFT_HLUTNM of \count_ifmap[1]_i_1__1\ : label is "soft_lutpair144";
  attribute SOFT_HLUTNM of \curr_state_i_1__1\ : label is "soft_lutpair147";
  attribute SOFT_HLUTNM of \res_mul[0]_i_1__1\ : label is "soft_lutpair145";
  attribute SOFT_HLUTNM of \res_mul[1]_i_1__1\ : label is "soft_lutpair146";
  attribute SOFT_HLUTNM of \res_mul[2]_i_1__1\ : label is "soft_lutpair146";
  attribute SOFT_HLUTNM of \res_mul[4]_i_1__1\ : label is "soft_lutpair145";
  attribute SOFT_HLUTNM of \start_acc_i_1__1\ : label is "soft_lutpair142";
  attribute SOFT_HLUTNM of \w4[3]_i_3__1\ : label is "soft_lutpair147";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
  \ifmap_calc_reg[62]_0\(62 downto 0) <= \^ifmap_calc_reg[62]_0\(62 downto 0);
\Psum_calc[0]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0_carry_n_7,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[0]\,
      O => \Psum_calc[0]_i_1__1_n_0\
    );
\Psum_calc[1]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0_carry_n_6,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[1]\,
      O => \Psum_calc[1]_i_1__1_n_0\
    );
\Psum_calc[2]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0_carry_n_5,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[2]\,
      O => \Psum_calc[2]_i_1__1_n_0\
    );
\Psum_calc[3]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0_carry_n_4,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[4]\,
      O => \Psum_calc[3]_i_1__1_n_0\
    );
\Psum_calc[4]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => \Psum_next0_carry__0_n_7\,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[4]\,
      O => \Psum_calc[4]_i_1__1_n_0\
    );
\Psum_calc[5]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => \Psum_next0_carry__0_n_6\,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[4]\,
      O => \Psum_calc[5]_i_1__1_n_0\
    );
\Psum_calc[6]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => \Psum_next0_carry__0_n_5\,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[4]\,
      O => \Psum_calc[6]_i_1__1_n_0\
    );
\Psum_calc[7]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => \Psum_next0_carry__0_n_4\,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[4]\,
      O => \Psum_calc[7]_i_1__1_n_0\
    );
\Psum_calc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[0]_i_1__1_n_0\,
      Q => \^q\(0)
    );
\Psum_calc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[1]_i_1__1_n_0\,
      Q => \^q\(1)
    );
\Psum_calc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[2]_i_1__1_n_0\,
      Q => \^q\(2)
    );
\Psum_calc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[3]_i_1__1_n_0\,
      Q => \^q\(3)
    );
\Psum_calc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[4]_i_1__1_n_0\,
      Q => \^q\(4)
    );
\Psum_calc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[5]_i_1__1_n_0\,
      Q => \^q\(5)
    );
\Psum_calc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[6]_i_1__1_n_0\,
      Q => \^q\(6)
    );
\Psum_calc_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[7]_i_1__1_n_0\,
      Q => \^q\(7)
    );
Psum_next0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => Psum_next0_carry_n_0,
      CO(2) => Psum_next0_carry_n_1,
      CO(1) => Psum_next0_carry_n_2,
      CO(0) => Psum_next0_carry_n_3,
      CYINIT => '0',
      DI(3) => \res_mul_reg_n_0_[4]\,
      DI(2) => \res_mul_reg_n_0_[2]\,
      DI(1) => \res_mul_reg_n_0_[1]\,
      DI(0) => \res_mul_reg_n_0_[0]\,
      O(3) => Psum_next0_carry_n_4,
      O(2) => Psum_next0_carry_n_5,
      O(1) => Psum_next0_carry_n_6,
      O(0) => Psum_next0_carry_n_7,
      S(3) => \Psum_next0_carry_i_1__1_n_0\,
      S(2) => \Psum_next0_carry_i_2__1_n_0\,
      S(1) => \Psum_next0_carry_i_3__1_n_0\,
      S(0) => \Psum_next0_carry_i_4__1_n_0\
    );
\Psum_next0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => Psum_next0_carry_n_0,
      CO(3) => \NLW_Psum_next0_carry__0_CO_UNCONNECTED\(3),
      CO(2) => \Psum_next0_carry__0_n_1\,
      CO(1) => \Psum_next0_carry__0_n_2\,
      CO(0) => \Psum_next0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 1) => \^q\(5 downto 4),
      DI(0) => \Psum_next0_carry__0_i_1__1_n_0\,
      O(3) => \Psum_next0_carry__0_n_4\,
      O(2) => \Psum_next0_carry__0_n_5\,
      O(1) => \Psum_next0_carry__0_n_6\,
      O(0) => \Psum_next0_carry__0_n_7\,
      S(3) => \Psum_next0_carry__0_i_2__1_n_0\,
      S(2) => \Psum_next0_carry__0_i_3__1_n_0\,
      S(1) => \Psum_next0_carry__0_i_4__1_n_0\,
      S(0) => \Psum_next0_carry__0_i_5__1_n_0\
    );
\Psum_next0_carry__0_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(4),
      O => \Psum_next0_carry__0_i_1__1_n_0\
    );
\Psum_next0_carry__0_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(7),
      O => \Psum_next0_carry__0_i_2__1_n_0\
    );
\Psum_next0_carry__0_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(6),
      O => \Psum_next0_carry__0_i_3__1_n_0\
    );
\Psum_next0_carry__0_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(5),
      O => \Psum_next0_carry__0_i_4__1_n_0\
    );
\Psum_next0_carry__0_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(4),
      I1 => \res_mul_reg_n_0_[4]\,
      O => \Psum_next0_carry__0_i_5__1_n_0\
    );
\Psum_next0_carry_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \res_mul_reg_n_0_[4]\,
      I1 => \^q\(3),
      O => \Psum_next0_carry_i_1__1_n_0\
    );
\Psum_next0_carry_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \res_mul_reg_n_0_[2]\,
      I1 => \^q\(2),
      O => \Psum_next0_carry_i_2__1_n_0\
    );
\Psum_next0_carry_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \res_mul_reg_n_0_[1]\,
      I1 => \^q\(1),
      O => \Psum_next0_carry_i_3__1_n_0\
    );
\Psum_next0_carry_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \res_mul_reg_n_0_[0]\,
      I1 => \^q\(0),
      O => \Psum_next0_carry_i_4__1_n_0\
    );
\count[0]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state,
      I1 => \count_reg_n_0_[0]\,
      O => next_count(0)
    );
\count[1]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => curr_state,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      O => next_count(1)
    );
\count_del_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_reg_n_0_[0]\,
      Q => \count_del_reg_n_0_[0]\
    );
\count_del_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_reg_n_0_[1]\,
      Q => \count_del_reg_n_0_[1]\
    );
\count_f[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => count_f(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      O => \count_f[0]_i_1__0_n_0\
    );
\count_f[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00404000"
    )
        port map (
      I0 => \count_reg[3]\(0),
      I1 => valid_in_f_IBUF,
      I2 => \count_reg[3]\(1),
      I3 => count_f(1),
      I4 => count_f(0),
      O => next_count_f(1)
    );
\count_f_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_f[0]_i_1__0_n_0\,
      Q => count_f(0)
    );
\count_f_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count_f(1),
      Q => count_f(1)
    );
\count_ifmap[0]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => \count_ifmap_reg_n_0_[0]\,
      I1 => curr_state,
      I2 => start_IBUF,
      O => next_count_ifmap(0)
    );
\count_ifmap[1]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6660"
    )
        port map (
      I0 => \count_ifmap_reg_n_0_[1]\,
      I1 => \count_ifmap_reg_n_0_[0]\,
      I2 => curr_state,
      I3 => start_IBUF,
      O => next_count_ifmap(1)
    );
\count_ifmap_del_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_ifmap_reg_n_0_[0]\,
      Q => \count_ifmap_del_reg_n_0_[0]\
    );
\count_ifmap_del_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_ifmap_reg_n_0_[1]\,
      Q => \count_ifmap_del_reg_n_0_[1]\
    );
\count_ifmap_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count_ifmap(0),
      Q => \count_ifmap_reg_n_0_[0]\
    );
\count_ifmap_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count_ifmap(1),
      Q => \count_ifmap_reg_n_0_[1]\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count(0),
      Q => \count_reg_n_0_[0]\
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count(1),
      Q => \count_reg_n_0_[1]\
    );
\curr_state_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => finish_IBUF,
      I1 => curr_state,
      I2 => start_IBUF,
      O => next_state
    );
curr_state_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_state,
      Q => curr_state
    );
\ifmap_calc[63]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => \count_row_del_reg[0]\,
      I1 => \count_ifmap_del_reg_n_0_[0]\,
      I2 => \count_ifmap_del_reg_n_0_[1]\,
      O => ifmap_next
    );
\ifmap_calc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(0),
      Q => \ifmap_calc_reg_n_0_[0]\
    );
\ifmap_calc_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(10),
      Q => \^ifmap_calc_reg[62]_0\(9)
    );
\ifmap_calc_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(11),
      Q => \^ifmap_calc_reg[62]_0\(10)
    );
\ifmap_calc_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(12),
      Q => \^ifmap_calc_reg[62]_0\(11)
    );
\ifmap_calc_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(13),
      Q => \^ifmap_calc_reg[62]_0\(12)
    );
\ifmap_calc_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(14),
      Q => \^ifmap_calc_reg[62]_0\(13)
    );
\ifmap_calc_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(15),
      Q => \^ifmap_calc_reg[62]_0\(14)
    );
\ifmap_calc_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(16),
      Q => \^ifmap_calc_reg[62]_0\(15)
    );
\ifmap_calc_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(17),
      Q => \^ifmap_calc_reg[62]_0\(16)
    );
\ifmap_calc_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(18),
      Q => \^ifmap_calc_reg[62]_0\(17)
    );
\ifmap_calc_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(19),
      Q => \^ifmap_calc_reg[62]_0\(18)
    );
\ifmap_calc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(1),
      Q => \^ifmap_calc_reg[62]_0\(0)
    );
\ifmap_calc_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(20),
      Q => \^ifmap_calc_reg[62]_0\(19)
    );
\ifmap_calc_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(21),
      Q => \^ifmap_calc_reg[62]_0\(20)
    );
\ifmap_calc_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(22),
      Q => \^ifmap_calc_reg[62]_0\(21)
    );
\ifmap_calc_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(23),
      Q => \^ifmap_calc_reg[62]_0\(22)
    );
\ifmap_calc_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(24),
      Q => \^ifmap_calc_reg[62]_0\(23)
    );
\ifmap_calc_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(25),
      Q => \^ifmap_calc_reg[62]_0\(24)
    );
\ifmap_calc_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(26),
      Q => \^ifmap_calc_reg[62]_0\(25)
    );
\ifmap_calc_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(27),
      Q => \^ifmap_calc_reg[62]_0\(26)
    );
\ifmap_calc_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(28),
      Q => \^ifmap_calc_reg[62]_0\(27)
    );
\ifmap_calc_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(29),
      Q => \^ifmap_calc_reg[62]_0\(28)
    );
\ifmap_calc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(2),
      Q => \^ifmap_calc_reg[62]_0\(1)
    );
\ifmap_calc_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(30),
      Q => \^ifmap_calc_reg[62]_0\(29)
    );
\ifmap_calc_reg[31]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(31),
      Q => \^ifmap_calc_reg[62]_0\(30)
    );
\ifmap_calc_reg[32]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(32),
      Q => \^ifmap_calc_reg[62]_0\(31)
    );
\ifmap_calc_reg[33]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(33),
      Q => \^ifmap_calc_reg[62]_0\(32)
    );
\ifmap_calc_reg[34]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(34),
      Q => \^ifmap_calc_reg[62]_0\(33)
    );
\ifmap_calc_reg[35]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(35),
      Q => \^ifmap_calc_reg[62]_0\(34)
    );
\ifmap_calc_reg[36]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(36),
      Q => \^ifmap_calc_reg[62]_0\(35)
    );
\ifmap_calc_reg[37]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(37),
      Q => \^ifmap_calc_reg[62]_0\(36)
    );
\ifmap_calc_reg[38]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(38),
      Q => \^ifmap_calc_reg[62]_0\(37)
    );
\ifmap_calc_reg[39]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(39),
      Q => \^ifmap_calc_reg[62]_0\(38)
    );
\ifmap_calc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(3),
      Q => \^ifmap_calc_reg[62]_0\(2)
    );
\ifmap_calc_reg[40]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(40),
      Q => \^ifmap_calc_reg[62]_0\(39)
    );
\ifmap_calc_reg[41]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(41),
      Q => \^ifmap_calc_reg[62]_0\(40)
    );
\ifmap_calc_reg[42]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(42),
      Q => \^ifmap_calc_reg[62]_0\(41)
    );
\ifmap_calc_reg[43]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(43),
      Q => \^ifmap_calc_reg[62]_0\(42)
    );
\ifmap_calc_reg[44]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(44),
      Q => \^ifmap_calc_reg[62]_0\(43)
    );
\ifmap_calc_reg[45]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(45),
      Q => \^ifmap_calc_reg[62]_0\(44)
    );
\ifmap_calc_reg[46]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(46),
      Q => \^ifmap_calc_reg[62]_0\(45)
    );
\ifmap_calc_reg[47]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(47),
      Q => \^ifmap_calc_reg[62]_0\(46)
    );
\ifmap_calc_reg[48]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(48),
      Q => \^ifmap_calc_reg[62]_0\(47)
    );
\ifmap_calc_reg[49]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(49),
      Q => \^ifmap_calc_reg[62]_0\(48)
    );
\ifmap_calc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(4),
      Q => \^ifmap_calc_reg[62]_0\(3)
    );
\ifmap_calc_reg[50]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(50),
      Q => \^ifmap_calc_reg[62]_0\(49)
    );
\ifmap_calc_reg[51]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(51),
      Q => \^ifmap_calc_reg[62]_0\(50)
    );
\ifmap_calc_reg[52]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(52),
      Q => \^ifmap_calc_reg[62]_0\(51)
    );
\ifmap_calc_reg[53]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(53),
      Q => \^ifmap_calc_reg[62]_0\(52)
    );
\ifmap_calc_reg[54]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(54),
      Q => \^ifmap_calc_reg[62]_0\(53)
    );
\ifmap_calc_reg[55]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(55),
      Q => \^ifmap_calc_reg[62]_0\(54)
    );
\ifmap_calc_reg[56]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(56),
      Q => \^ifmap_calc_reg[62]_0\(55)
    );
\ifmap_calc_reg[57]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(57),
      Q => \^ifmap_calc_reg[62]_0\(56)
    );
\ifmap_calc_reg[58]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(58),
      Q => \^ifmap_calc_reg[62]_0\(57)
    );
\ifmap_calc_reg[59]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(59),
      Q => \^ifmap_calc_reg[62]_0\(58)
    );
\ifmap_calc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(5),
      Q => \^ifmap_calc_reg[62]_0\(4)
    );
\ifmap_calc_reg[60]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(60),
      Q => \^ifmap_calc_reg[62]_0\(59)
    );
\ifmap_calc_reg[61]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(61),
      Q => \^ifmap_calc_reg[62]_0\(60)
    );
\ifmap_calc_reg[62]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(62),
      Q => \^ifmap_calc_reg[62]_0\(61)
    );
\ifmap_calc_reg[63]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(63),
      Q => \^ifmap_calc_reg[62]_0\(62)
    );
\ifmap_calc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(6),
      Q => \^ifmap_calc_reg[62]_0\(5)
    );
\ifmap_calc_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(7),
      Q => \^ifmap_calc_reg[62]_0\(6)
    );
\ifmap_calc_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(8),
      Q => \^ifmap_calc_reg[62]_0\(7)
    );
\ifmap_calc_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(9),
      Q => \^ifmap_calc_reg[62]_0\(8)
    );
\res_mul[0]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_mul[4]_i_2__1_n_0\,
      I1 => \w1_reg_n_0_[0]\,
      I2 => curr_state,
      O => res_mul_next(0)
    );
\res_mul[1]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_mul[4]_i_2__1_n_0\,
      I1 => \w1_reg_n_0_[1]\,
      I2 => curr_state,
      O => res_mul_next(1)
    );
\res_mul[2]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_mul[4]_i_2__1_n_0\,
      I1 => \w1_reg_n_0_[2]\,
      I2 => curr_state,
      O => res_mul_next(2)
    );
\res_mul[4]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_mul[4]_i_2__1_n_0\,
      I1 => \w1_reg_n_0_[3]\,
      I2 => curr_state,
      O => res_mul_next(4)
    );
\res_mul[4]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^ifmap_calc_reg[62]_0\(2),
      I1 => \^ifmap_calc_reg[62]_0\(1),
      I2 => \count_ifmap_del_reg_n_0_[1]\,
      I3 => \^ifmap_calc_reg[62]_0\(0),
      I4 => \count_ifmap_del_reg_n_0_[0]\,
      I5 => \ifmap_calc_reg_n_0_[0]\,
      O => \res_mul[4]_i_2__1_n_0\
    );
\res_mul_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => res_mul_next(0),
      Q => \res_mul_reg_n_0_[0]\
    );
\res_mul_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => res_mul_next(1),
      Q => \res_mul_reg_n_0_[1]\
    );
\res_mul_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => res_mul_next(2),
      Q => \res_mul_reg_n_0_[2]\
    );
\res_mul_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => res_mul_next(4),
      Q => \res_mul_reg_n_0_[4]\
    );
start_acc_OBUF_inst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => start_acc_3,
      I1 => start_acc_2,
      I2 => start_acc_1,
      I3 => start_acc_4,
      O => start_acc_OBUF
    );
\start_acc_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \count_del_reg_n_0_[0]\,
      I1 => \count_del_reg_n_0_[1]\,
      I2 => curr_state,
      O => start_acc_next0_out
    );
start_acc_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => start_acc_next0_out,
      Q => start_acc_3
    );
\w1[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008000000080"
    )
        port map (
      I0 => f_in_IBUF(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__1_n_0\,
      I5 => w2(0),
      O => w1_next(0)
    );
\w1[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008000000080"
    )
        port map (
      I0 => f_in_IBUF(1),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__1_n_0\,
      I5 => w2(1),
      O => w1_next(1)
    );
\w1[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008000000080"
    )
        port map (
      I0 => f_in_IBUF(2),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__1_n_0\,
      I5 => w2(2),
      O => w1_next(2)
    );
\w1[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAABAAAAAA"
    )
        port map (
      I0 => \w4[3]_i_3__1_n_0\,
      I1 => count_f(0),
      I2 => count_f(1),
      I3 => \count_reg[3]\(1),
      I4 => valid_in_f_IBUF,
      I5 => \count_reg[3]\(0),
      O => \w1[3]_i_1__0_n_0\
    );
\w1[3]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008000000080"
    )
        port map (
      I0 => f_in_IBUF(3),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__1_n_0\,
      I5 => w2(3),
      O => w1_next(3)
    );
\w1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w1[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => w1_next(0),
      Q => \w1_reg_n_0_[0]\
    );
\w1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w1[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => w1_next(1),
      Q => \w1_reg_n_0_[1]\
    );
\w1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w1[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => w1_next(2),
      Q => \w1_reg_n_0_[2]\
    );
\w1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w1[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => w1_next(3),
      Q => \w1_reg_n_0_[3]\
    );
\w2[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008000000080"
    )
        port map (
      I0 => f_in_IBUF(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__1_n_0\,
      I5 => w3(0),
      O => w2_next(0)
    );
\w2[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008000000080"
    )
        port map (
      I0 => f_in_IBUF(1),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__1_n_0\,
      I5 => w3(1),
      O => w2_next(1)
    );
\w2[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008000000080"
    )
        port map (
      I0 => f_in_IBUF(2),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__1_n_0\,
      I5 => w3(2),
      O => w2_next(2)
    );
\w2[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAEAAAAA"
    )
        port map (
      I0 => \w4[3]_i_3__1_n_0\,
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => count_f(0),
      I5 => count_f(1),
      O => \w2[3]_i_1__0_n_0\
    );
\w2[3]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008000000080"
    )
        port map (
      I0 => f_in_IBUF(3),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__1_n_0\,
      I5 => w3(3),
      O => w2_next(3)
    );
\w2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w2[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => w2_next(0),
      Q => w2(0)
    );
\w2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w2[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => w2_next(1),
      Q => w2(1)
    );
\w2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w2[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => w2_next(2),
      Q => w2(2)
    );
\w2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w2[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => w2_next(3),
      Q => w2(3)
    );
\w3[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008000000080"
    )
        port map (
      I0 => f_in_IBUF(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__1_n_0\,
      I5 => w4(0),
      O => w3_next(0)
    );
\w3[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008000000080"
    )
        port map (
      I0 => f_in_IBUF(1),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__1_n_0\,
      I5 => w4(1),
      O => w3_next(1)
    );
\w3[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008000000080"
    )
        port map (
      I0 => f_in_IBUF(2),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__1_n_0\,
      I5 => w4(2),
      O => w3_next(2)
    );
\w3[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAABAAAAAAAAAAA"
    )
        port map (
      I0 => \w4[3]_i_3__1_n_0\,
      I1 => count_f(0),
      I2 => \count_reg[3]\(1),
      I3 => valid_in_f_IBUF,
      I4 => \count_reg[3]\(0),
      I5 => count_f(1),
      O => \w3[3]_i_1__0_n_0\
    );
\w3[3]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008000000080"
    )
        port map (
      I0 => f_in_IBUF(3),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__1_n_0\,
      I5 => w4(3),
      O => w3_next(3)
    );
\w3_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w3[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => w3_next(0),
      Q => w3(0)
    );
\w3_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w3[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => w3_next(1),
      Q => w3(1)
    );
\w3_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w3[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => w3_next(2),
      Q => w3(2)
    );
\w3_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w3[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => w3_next(3),
      Q => w3(3)
    );
\w4[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008000000080"
    )
        port map (
      I0 => f_in_IBUF(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__1_n_0\,
      I5 => \w1_reg_n_0_[0]\,
      O => w4_next(0)
    );
\w4[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008000000080"
    )
        port map (
      I0 => f_in_IBUF(1),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__1_n_0\,
      I5 => \w1_reg_n_0_[1]\,
      O => w4_next(1)
    );
\w4[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008000000080"
    )
        port map (
      I0 => f_in_IBUF(2),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__1_n_0\,
      I5 => \w1_reg_n_0_[2]\,
      O => w4_next(2)
    );
\w4[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAEAAAAAAAAAAAAA"
    )
        port map (
      I0 => \w4[3]_i_3__1_n_0\,
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => count_f(0),
      I5 => count_f(1),
      O => \w4[3]_i_1__0_n_0\
    );
\w4[3]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008000000080"
    )
        port map (
      I0 => f_in_IBUF(3),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__1_n_0\,
      I5 => \w1_reg_n_0_[3]\,
      O => w4_next(3)
    );
\w4[3]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state,
      I1 => finish_IBUF,
      O => \w4[3]_i_3__1_n_0\
    );
\w4_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w4[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => w4_next(0),
      Q => w4(0)
    );
\w4_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w4[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => w4_next(1),
      Q => w4(1)
    );
\w4_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w4[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => w4_next(2),
      Q => w4(2)
    );
\w4_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w4[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => w4_next(3),
      Q => w4(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity PE_2 is
  port (
    start_acc_4 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \ifmap_calc_reg[62]_0\ : out STD_LOGIC_VECTOR ( 62 downto 0 );
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    start_IBUF : in STD_LOGIC;
    finish_IBUF : in STD_LOGIC;
    \count_reg[3]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    valid_in_f_IBUF : in STD_LOGIC;
    f_in_IBUF : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \count_row_del_reg[0]\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of PE_2 : entity is "PE";
end PE_2;

architecture STRUCTURE of PE_2 is
  signal \Psum_calc[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \Psum_calc[1]_i_1__2_n_0\ : STD_LOGIC;
  signal \Psum_calc[2]_i_1__2_n_0\ : STD_LOGIC;
  signal \Psum_calc[3]_i_1__2_n_0\ : STD_LOGIC;
  signal \Psum_calc[4]_i_1__2_n_0\ : STD_LOGIC;
  signal \Psum_calc[5]_i_1__2_n_0\ : STD_LOGIC;
  signal \Psum_calc[6]_i_1__2_n_0\ : STD_LOGIC;
  signal \Psum_calc[7]_i_1__2_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_1__2_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_2__2_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_3__2_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_4__2_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_i_5__2_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_1\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_2\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_3\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_4\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_5\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_6\ : STD_LOGIC;
  signal \Psum_next0_carry__0_n_7\ : STD_LOGIC;
  signal \Psum_next0_carry_i_1__2_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry_i_2__2_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry_i_3__2_n_0\ : STD_LOGIC;
  signal \Psum_next0_carry_i_4__2_n_0\ : STD_LOGIC;
  signal Psum_next0_carry_n_0 : STD_LOGIC;
  signal Psum_next0_carry_n_1 : STD_LOGIC;
  signal Psum_next0_carry_n_2 : STD_LOGIC;
  signal Psum_next0_carry_n_3 : STD_LOGIC;
  signal Psum_next0_carry_n_4 : STD_LOGIC;
  signal Psum_next0_carry_n_5 : STD_LOGIC;
  signal Psum_next0_carry_n_6 : STD_LOGIC;
  signal Psum_next0_carry_n_7 : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \count_del_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_del_reg_n_0_[1]\ : STD_LOGIC;
  signal count_f : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \count_f[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_ifmap_del_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_ifmap_del_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_ifmap_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_ifmap_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal curr_state : STD_LOGIC;
  signal \^ifmap_calc_reg[62]_0\ : STD_LOGIC_VECTOR ( 62 downto 0 );
  signal \ifmap_calc_reg_n_0_[0]\ : STD_LOGIC;
  signal ifmap_next : STD_LOGIC;
  signal next_count : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal next_count_f : STD_LOGIC_VECTOR ( 1 to 1 );
  signal next_count_ifmap : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal next_state : STD_LOGIC;
  signal \res_mul[4]_i_2__2_n_0\ : STD_LOGIC;
  signal res_mul_next : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \res_mul_reg_n_0_[0]\ : STD_LOGIC;
  signal \res_mul_reg_n_0_[1]\ : STD_LOGIC;
  signal \res_mul_reg_n_0_[2]\ : STD_LOGIC;
  signal \res_mul_reg_n_0_[4]\ : STD_LOGIC;
  signal start_acc_next0_out : STD_LOGIC;
  signal \w1[3]_i_1__2_n_0\ : STD_LOGIC;
  signal w1_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w1_reg_n_0_[0]\ : STD_LOGIC;
  signal \w1_reg_n_0_[1]\ : STD_LOGIC;
  signal \w1_reg_n_0_[2]\ : STD_LOGIC;
  signal \w1_reg_n_0_[3]\ : STD_LOGIC;
  signal w2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w2[3]_i_1__2_n_0\ : STD_LOGIC;
  signal w2_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal w3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w3[3]_i_1__2_n_0\ : STD_LOGIC;
  signal w3_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal w4 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \w4[3]_i_1__2_n_0\ : STD_LOGIC;
  signal \w4[3]_i_3__2_n_0\ : STD_LOGIC;
  signal w4_next : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_Psum_next0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \Psum_calc[6]_i_1__2\ : label is "soft_lutpair149";
  attribute SOFT_HLUTNM of \count[0]_i_1__3\ : label is "soft_lutpair155";
  attribute SOFT_HLUTNM of \count[1]_i_1__3\ : label is "soft_lutpair155";
  attribute SOFT_HLUTNM of \count_f[0]_i_1__2\ : label is "soft_lutpair150";
  attribute SOFT_HLUTNM of \count_f[1]_i_1__2\ : label is "soft_lutpair150";
  attribute SOFT_HLUTNM of \count_ifmap[0]_i_1__2\ : label is "soft_lutpair151";
  attribute SOFT_HLUTNM of \count_ifmap[1]_i_1__2\ : label is "soft_lutpair151";
  attribute SOFT_HLUTNM of \curr_state_i_1__2\ : label is "soft_lutpair153";
  attribute SOFT_HLUTNM of \res_mul[0]_i_1__2\ : label is "soft_lutpair154";
  attribute SOFT_HLUTNM of \res_mul[1]_i_1__2\ : label is "soft_lutpair154";
  attribute SOFT_HLUTNM of \res_mul[2]_i_1__2\ : label is "soft_lutpair152";
  attribute SOFT_HLUTNM of \res_mul[4]_i_1__2\ : label is "soft_lutpair152";
  attribute SOFT_HLUTNM of \start_acc_i_1__2\ : label is "soft_lutpair149";
  attribute SOFT_HLUTNM of \w4[3]_i_3__2\ : label is "soft_lutpair153";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
  \ifmap_calc_reg[62]_0\(62 downto 0) <= \^ifmap_calc_reg[62]_0\(62 downto 0);
\Psum_calc[0]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0_carry_n_7,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[0]\,
      O => \Psum_calc[0]_i_1__2_n_0\
    );
\Psum_calc[1]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0_carry_n_6,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[1]\,
      O => \Psum_calc[1]_i_1__2_n_0\
    );
\Psum_calc[2]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0_carry_n_5,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[2]\,
      O => \Psum_calc[2]_i_1__2_n_0\
    );
\Psum_calc[3]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => Psum_next0_carry_n_4,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[4]\,
      O => \Psum_calc[3]_i_1__2_n_0\
    );
\Psum_calc[4]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => \Psum_next0_carry__0_n_7\,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[4]\,
      O => \Psum_calc[4]_i_1__2_n_0\
    );
\Psum_calc[5]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => \Psum_next0_carry__0_n_6\,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[4]\,
      O => \Psum_calc[5]_i_1__2_n_0\
    );
\Psum_calc[6]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => \Psum_next0_carry__0_n_5\,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[4]\,
      O => \Psum_calc[6]_i_1__2_n_0\
    );
\Psum_calc[7]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888A8880"
    )
        port map (
      I0 => curr_state,
      I1 => \Psum_next0_carry__0_n_4\,
      I2 => \count_del_reg_n_0_[0]\,
      I3 => \count_del_reg_n_0_[1]\,
      I4 => \res_mul_reg_n_0_[4]\,
      O => \Psum_calc[7]_i_1__2_n_0\
    );
\Psum_calc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[0]_i_1__2_n_0\,
      Q => \^q\(0)
    );
\Psum_calc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[1]_i_1__2_n_0\,
      Q => \^q\(1)
    );
\Psum_calc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[2]_i_1__2_n_0\,
      Q => \^q\(2)
    );
\Psum_calc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[3]_i_1__2_n_0\,
      Q => \^q\(3)
    );
\Psum_calc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[4]_i_1__2_n_0\,
      Q => \^q\(4)
    );
\Psum_calc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[5]_i_1__2_n_0\,
      Q => \^q\(5)
    );
\Psum_calc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[6]_i_1__2_n_0\,
      Q => \^q\(6)
    );
\Psum_calc_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \Psum_calc[7]_i_1__2_n_0\,
      Q => \^q\(7)
    );
Psum_next0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => Psum_next0_carry_n_0,
      CO(2) => Psum_next0_carry_n_1,
      CO(1) => Psum_next0_carry_n_2,
      CO(0) => Psum_next0_carry_n_3,
      CYINIT => '0',
      DI(3) => \res_mul_reg_n_0_[4]\,
      DI(2) => \res_mul_reg_n_0_[2]\,
      DI(1) => \res_mul_reg_n_0_[1]\,
      DI(0) => \res_mul_reg_n_0_[0]\,
      O(3) => Psum_next0_carry_n_4,
      O(2) => Psum_next0_carry_n_5,
      O(1) => Psum_next0_carry_n_6,
      O(0) => Psum_next0_carry_n_7,
      S(3) => \Psum_next0_carry_i_1__2_n_0\,
      S(2) => \Psum_next0_carry_i_2__2_n_0\,
      S(1) => \Psum_next0_carry_i_3__2_n_0\,
      S(0) => \Psum_next0_carry_i_4__2_n_0\
    );
\Psum_next0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => Psum_next0_carry_n_0,
      CO(3) => \NLW_Psum_next0_carry__0_CO_UNCONNECTED\(3),
      CO(2) => \Psum_next0_carry__0_n_1\,
      CO(1) => \Psum_next0_carry__0_n_2\,
      CO(0) => \Psum_next0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 1) => \^q\(5 downto 4),
      DI(0) => \Psum_next0_carry__0_i_1__2_n_0\,
      O(3) => \Psum_next0_carry__0_n_4\,
      O(2) => \Psum_next0_carry__0_n_5\,
      O(1) => \Psum_next0_carry__0_n_6\,
      O(0) => \Psum_next0_carry__0_n_7\,
      S(3) => \Psum_next0_carry__0_i_2__2_n_0\,
      S(2) => \Psum_next0_carry__0_i_3__2_n_0\,
      S(1) => \Psum_next0_carry__0_i_4__2_n_0\,
      S(0) => \Psum_next0_carry__0_i_5__2_n_0\
    );
\Psum_next0_carry__0_i_1__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(4),
      O => \Psum_next0_carry__0_i_1__2_n_0\
    );
\Psum_next0_carry__0_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(7),
      O => \Psum_next0_carry__0_i_2__2_n_0\
    );
\Psum_next0_carry__0_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(6),
      O => \Psum_next0_carry__0_i_3__2_n_0\
    );
\Psum_next0_carry__0_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(5),
      O => \Psum_next0_carry__0_i_4__2_n_0\
    );
\Psum_next0_carry__0_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(4),
      I1 => \res_mul_reg_n_0_[4]\,
      O => \Psum_next0_carry__0_i_5__2_n_0\
    );
\Psum_next0_carry_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \res_mul_reg_n_0_[4]\,
      I1 => \^q\(3),
      O => \Psum_next0_carry_i_1__2_n_0\
    );
\Psum_next0_carry_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \res_mul_reg_n_0_[2]\,
      I1 => \^q\(2),
      O => \Psum_next0_carry_i_2__2_n_0\
    );
\Psum_next0_carry_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \res_mul_reg_n_0_[1]\,
      I1 => \^q\(1),
      O => \Psum_next0_carry_i_3__2_n_0\
    );
\Psum_next0_carry_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \res_mul_reg_n_0_[0]\,
      I1 => \^q\(0),
      O => \Psum_next0_carry_i_4__2_n_0\
    );
\count[0]_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state,
      I1 => \count_reg_n_0_[0]\,
      O => next_count(0)
    );
\count[1]_i_1__3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => curr_state,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      O => next_count(1)
    );
\count_del_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_reg_n_0_[0]\,
      Q => \count_del_reg_n_0_[0]\
    );
\count_del_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_reg_n_0_[1]\,
      Q => \count_del_reg_n_0_[1]\
    );
\count_f[0]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => count_f(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      O => \count_f[0]_i_1__2_n_0\
    );
\count_f[1]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00808000"
    )
        port map (
      I0 => \count_reg[3]\(0),
      I1 => valid_in_f_IBUF,
      I2 => \count_reg[3]\(1),
      I3 => count_f(1),
      I4 => count_f(0),
      O => next_count_f(1)
    );
\count_f_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_f[0]_i_1__2_n_0\,
      Q => count_f(0)
    );
\count_f_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count_f(1),
      Q => count_f(1)
    );
\count_ifmap[0]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => \count_ifmap_reg_n_0_[0]\,
      I1 => curr_state,
      I2 => start_IBUF,
      O => next_count_ifmap(0)
    );
\count_ifmap[1]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6660"
    )
        port map (
      I0 => \count_ifmap_reg_n_0_[1]\,
      I1 => \count_ifmap_reg_n_0_[0]\,
      I2 => curr_state,
      I3 => start_IBUF,
      O => next_count_ifmap(1)
    );
\count_ifmap_del_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_ifmap_reg_n_0_[0]\,
      Q => \count_ifmap_del_reg_n_0_[0]\
    );
\count_ifmap_del_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \count_ifmap_reg_n_0_[1]\,
      Q => \count_ifmap_del_reg_n_0_[1]\
    );
\count_ifmap_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count_ifmap(0),
      Q => \count_ifmap_reg_n_0_[0]\
    );
\count_ifmap_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count_ifmap(1),
      Q => \count_ifmap_reg_n_0_[1]\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count(0),
      Q => \count_reg_n_0_[0]\
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_count(1),
      Q => \count_reg_n_0_[1]\
    );
\curr_state_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => finish_IBUF,
      I1 => curr_state,
      I2 => start_IBUF,
      O => next_state
    );
curr_state_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => next_state,
      Q => curr_state
    );
\ifmap_calc[63]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => \count_row_del_reg[0]\,
      I1 => \count_ifmap_del_reg_n_0_[0]\,
      I2 => \count_ifmap_del_reg_n_0_[1]\,
      O => ifmap_next
    );
\ifmap_calc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(0),
      Q => \ifmap_calc_reg_n_0_[0]\
    );
\ifmap_calc_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(10),
      Q => \^ifmap_calc_reg[62]_0\(9)
    );
\ifmap_calc_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(11),
      Q => \^ifmap_calc_reg[62]_0\(10)
    );
\ifmap_calc_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(12),
      Q => \^ifmap_calc_reg[62]_0\(11)
    );
\ifmap_calc_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(13),
      Q => \^ifmap_calc_reg[62]_0\(12)
    );
\ifmap_calc_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(14),
      Q => \^ifmap_calc_reg[62]_0\(13)
    );
\ifmap_calc_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(15),
      Q => \^ifmap_calc_reg[62]_0\(14)
    );
\ifmap_calc_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(16),
      Q => \^ifmap_calc_reg[62]_0\(15)
    );
\ifmap_calc_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(17),
      Q => \^ifmap_calc_reg[62]_0\(16)
    );
\ifmap_calc_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(18),
      Q => \^ifmap_calc_reg[62]_0\(17)
    );
\ifmap_calc_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(19),
      Q => \^ifmap_calc_reg[62]_0\(18)
    );
\ifmap_calc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(1),
      Q => \^ifmap_calc_reg[62]_0\(0)
    );
\ifmap_calc_reg[20]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(20),
      Q => \^ifmap_calc_reg[62]_0\(19)
    );
\ifmap_calc_reg[21]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(21),
      Q => \^ifmap_calc_reg[62]_0\(20)
    );
\ifmap_calc_reg[22]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(22),
      Q => \^ifmap_calc_reg[62]_0\(21)
    );
\ifmap_calc_reg[23]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(23),
      Q => \^ifmap_calc_reg[62]_0\(22)
    );
\ifmap_calc_reg[24]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(24),
      Q => \^ifmap_calc_reg[62]_0\(23)
    );
\ifmap_calc_reg[25]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(25),
      Q => \^ifmap_calc_reg[62]_0\(24)
    );
\ifmap_calc_reg[26]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(26),
      Q => \^ifmap_calc_reg[62]_0\(25)
    );
\ifmap_calc_reg[27]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(27),
      Q => \^ifmap_calc_reg[62]_0\(26)
    );
\ifmap_calc_reg[28]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(28),
      Q => \^ifmap_calc_reg[62]_0\(27)
    );
\ifmap_calc_reg[29]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(29),
      Q => \^ifmap_calc_reg[62]_0\(28)
    );
\ifmap_calc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(2),
      Q => \^ifmap_calc_reg[62]_0\(1)
    );
\ifmap_calc_reg[30]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(30),
      Q => \^ifmap_calc_reg[62]_0\(29)
    );
\ifmap_calc_reg[31]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(31),
      Q => \^ifmap_calc_reg[62]_0\(30)
    );
\ifmap_calc_reg[32]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(32),
      Q => \^ifmap_calc_reg[62]_0\(31)
    );
\ifmap_calc_reg[33]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(33),
      Q => \^ifmap_calc_reg[62]_0\(32)
    );
\ifmap_calc_reg[34]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(34),
      Q => \^ifmap_calc_reg[62]_0\(33)
    );
\ifmap_calc_reg[35]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(35),
      Q => \^ifmap_calc_reg[62]_0\(34)
    );
\ifmap_calc_reg[36]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(36),
      Q => \^ifmap_calc_reg[62]_0\(35)
    );
\ifmap_calc_reg[37]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(37),
      Q => \^ifmap_calc_reg[62]_0\(36)
    );
\ifmap_calc_reg[38]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(38),
      Q => \^ifmap_calc_reg[62]_0\(37)
    );
\ifmap_calc_reg[39]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(39),
      Q => \^ifmap_calc_reg[62]_0\(38)
    );
\ifmap_calc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(3),
      Q => \^ifmap_calc_reg[62]_0\(2)
    );
\ifmap_calc_reg[40]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(40),
      Q => \^ifmap_calc_reg[62]_0\(39)
    );
\ifmap_calc_reg[41]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(41),
      Q => \^ifmap_calc_reg[62]_0\(40)
    );
\ifmap_calc_reg[42]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(42),
      Q => \^ifmap_calc_reg[62]_0\(41)
    );
\ifmap_calc_reg[43]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(43),
      Q => \^ifmap_calc_reg[62]_0\(42)
    );
\ifmap_calc_reg[44]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(44),
      Q => \^ifmap_calc_reg[62]_0\(43)
    );
\ifmap_calc_reg[45]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(45),
      Q => \^ifmap_calc_reg[62]_0\(44)
    );
\ifmap_calc_reg[46]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(46),
      Q => \^ifmap_calc_reg[62]_0\(45)
    );
\ifmap_calc_reg[47]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(47),
      Q => \^ifmap_calc_reg[62]_0\(46)
    );
\ifmap_calc_reg[48]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(48),
      Q => \^ifmap_calc_reg[62]_0\(47)
    );
\ifmap_calc_reg[49]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(49),
      Q => \^ifmap_calc_reg[62]_0\(48)
    );
\ifmap_calc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(4),
      Q => \^ifmap_calc_reg[62]_0\(3)
    );
\ifmap_calc_reg[50]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(50),
      Q => \^ifmap_calc_reg[62]_0\(49)
    );
\ifmap_calc_reg[51]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(51),
      Q => \^ifmap_calc_reg[62]_0\(50)
    );
\ifmap_calc_reg[52]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(52),
      Q => \^ifmap_calc_reg[62]_0\(51)
    );
\ifmap_calc_reg[53]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(53),
      Q => \^ifmap_calc_reg[62]_0\(52)
    );
\ifmap_calc_reg[54]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(54),
      Q => \^ifmap_calc_reg[62]_0\(53)
    );
\ifmap_calc_reg[55]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(55),
      Q => \^ifmap_calc_reg[62]_0\(54)
    );
\ifmap_calc_reg[56]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(56),
      Q => \^ifmap_calc_reg[62]_0\(55)
    );
\ifmap_calc_reg[57]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(57),
      Q => \^ifmap_calc_reg[62]_0\(56)
    );
\ifmap_calc_reg[58]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(58),
      Q => \^ifmap_calc_reg[62]_0\(57)
    );
\ifmap_calc_reg[59]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(59),
      Q => \^ifmap_calc_reg[62]_0\(58)
    );
\ifmap_calc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(5),
      Q => \^ifmap_calc_reg[62]_0\(4)
    );
\ifmap_calc_reg[60]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(60),
      Q => \^ifmap_calc_reg[62]_0\(59)
    );
\ifmap_calc_reg[61]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(61),
      Q => \^ifmap_calc_reg[62]_0\(60)
    );
\ifmap_calc_reg[62]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(62),
      Q => \^ifmap_calc_reg[62]_0\(61)
    );
\ifmap_calc_reg[63]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(63),
      Q => \^ifmap_calc_reg[62]_0\(62)
    );
\ifmap_calc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(6),
      Q => \^ifmap_calc_reg[62]_0\(5)
    );
\ifmap_calc_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(7),
      Q => \^ifmap_calc_reg[62]_0\(6)
    );
\ifmap_calc_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(8),
      Q => \^ifmap_calc_reg[62]_0\(7)
    );
\ifmap_calc_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => ifmap_next,
      CLR => AR(0),
      D => D(9),
      Q => \^ifmap_calc_reg[62]_0\(8)
    );
\res_mul[0]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_mul[4]_i_2__2_n_0\,
      I1 => \w1_reg_n_0_[0]\,
      I2 => curr_state,
      O => res_mul_next(0)
    );
\res_mul[1]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_mul[4]_i_2__2_n_0\,
      I1 => \w1_reg_n_0_[1]\,
      I2 => curr_state,
      O => res_mul_next(1)
    );
\res_mul[2]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_mul[4]_i_2__2_n_0\,
      I1 => \w1_reg_n_0_[2]\,
      I2 => curr_state,
      O => res_mul_next(2)
    );
\res_mul[4]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_mul[4]_i_2__2_n_0\,
      I1 => \w1_reg_n_0_[3]\,
      I2 => curr_state,
      O => res_mul_next(4)
    );
\res_mul[4]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^ifmap_calc_reg[62]_0\(2),
      I1 => \^ifmap_calc_reg[62]_0\(1),
      I2 => \count_ifmap_del_reg_n_0_[1]\,
      I3 => \^ifmap_calc_reg[62]_0\(0),
      I4 => \count_ifmap_del_reg_n_0_[0]\,
      I5 => \ifmap_calc_reg_n_0_[0]\,
      O => \res_mul[4]_i_2__2_n_0\
    );
\res_mul_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => res_mul_next(0),
      Q => \res_mul_reg_n_0_[0]\
    );
\res_mul_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => res_mul_next(1),
      Q => \res_mul_reg_n_0_[1]\
    );
\res_mul_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => res_mul_next(2),
      Q => \res_mul_reg_n_0_[2]\
    );
\res_mul_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => res_mul_next(4),
      Q => \res_mul_reg_n_0_[4]\
    );
\start_acc_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \count_del_reg_n_0_[0]\,
      I1 => \count_del_reg_n_0_[1]\,
      I2 => curr_state,
      O => start_acc_next0_out
    );
start_acc_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => start_acc_next0_out,
      Q => start_acc_4
    );
\w1[0]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000008000"
    )
        port map (
      I0 => f_in_IBUF(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__2_n_0\,
      I5 => w2(0),
      O => w1_next(0)
    );
\w1[1]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000008000"
    )
        port map (
      I0 => f_in_IBUF(1),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__2_n_0\,
      I5 => w2(1),
      O => w1_next(1)
    );
\w1[2]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000008000"
    )
        port map (
      I0 => f_in_IBUF(2),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__2_n_0\,
      I5 => w2(2),
      O => w1_next(2)
    );
\w1[3]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \w4[3]_i_3__2_n_0\,
      I1 => count_f(0),
      I2 => count_f(1),
      I3 => \count_reg[3]\(1),
      I4 => valid_in_f_IBUF,
      I5 => \count_reg[3]\(0),
      O => \w1[3]_i_1__2_n_0\
    );
\w1[3]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000008000"
    )
        port map (
      I0 => f_in_IBUF(3),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__2_n_0\,
      I5 => w2(3),
      O => w1_next(3)
    );
\w1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w1[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => w1_next(0),
      Q => \w1_reg_n_0_[0]\
    );
\w1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w1[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => w1_next(1),
      Q => \w1_reg_n_0_[1]\
    );
\w1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w1[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => w1_next(2),
      Q => \w1_reg_n_0_[2]\
    );
\w1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w1[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => w1_next(3),
      Q => \w1_reg_n_0_[3]\
    );
\w2[0]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000008000"
    )
        port map (
      I0 => f_in_IBUF(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__2_n_0\,
      I5 => w3(0),
      O => w2_next(0)
    );
\w2[1]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000008000"
    )
        port map (
      I0 => f_in_IBUF(1),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__2_n_0\,
      I5 => w3(1),
      O => w2_next(1)
    );
\w2[2]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000008000"
    )
        port map (
      I0 => f_in_IBUF(2),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__2_n_0\,
      I5 => w3(2),
      O => w2_next(2)
    );
\w2[3]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAEAAAAAAA"
    )
        port map (
      I0 => \w4[3]_i_3__2_n_0\,
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => count_f(0),
      I5 => count_f(1),
      O => \w2[3]_i_1__2_n_0\
    );
\w2[3]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000008000"
    )
        port map (
      I0 => f_in_IBUF(3),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__2_n_0\,
      I5 => w3(3),
      O => w2_next(3)
    );
\w2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w2[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => w2_next(0),
      Q => w2(0)
    );
\w2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w2[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => w2_next(1),
      Q => w2(1)
    );
\w2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w2[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => w2_next(2),
      Q => w2(2)
    );
\w2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w2[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => w2_next(3),
      Q => w2(3)
    );
\w3[0]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000008000"
    )
        port map (
      I0 => f_in_IBUF(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__2_n_0\,
      I5 => w4(0),
      O => w3_next(0)
    );
\w3[1]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000008000"
    )
        port map (
      I0 => f_in_IBUF(1),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__2_n_0\,
      I5 => w4(1),
      O => w3_next(1)
    );
\w3[2]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000008000"
    )
        port map (
      I0 => f_in_IBUF(2),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__2_n_0\,
      I5 => w4(2),
      O => w3_next(2)
    );
\w3[3]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \w4[3]_i_3__2_n_0\,
      I1 => count_f(0),
      I2 => \count_reg[3]\(1),
      I3 => valid_in_f_IBUF,
      I4 => \count_reg[3]\(0),
      I5 => count_f(1),
      O => \w3[3]_i_1__2_n_0\
    );
\w3[3]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000008000"
    )
        port map (
      I0 => f_in_IBUF(3),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__2_n_0\,
      I5 => w4(3),
      O => w3_next(3)
    );
\w3_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w3[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => w3_next(0),
      Q => w3(0)
    );
\w3_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w3[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => w3_next(1),
      Q => w3(1)
    );
\w3_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w3[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => w3_next(2),
      Q => w3(2)
    );
\w3_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w3[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => w3_next(3),
      Q => w3(3)
    );
\w4[0]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000008000"
    )
        port map (
      I0 => f_in_IBUF(0),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__2_n_0\,
      I5 => \w1_reg_n_0_[0]\,
      O => w4_next(0)
    );
\w4[1]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000008000"
    )
        port map (
      I0 => f_in_IBUF(1),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__2_n_0\,
      I5 => \w1_reg_n_0_[1]\,
      O => w4_next(1)
    );
\w4[2]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000008000"
    )
        port map (
      I0 => f_in_IBUF(2),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__2_n_0\,
      I5 => \w1_reg_n_0_[2]\,
      O => w4_next(2)
    );
\w4[3]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \w4[3]_i_3__2_n_0\,
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => count_f(0),
      I5 => count_f(1),
      O => \w4[3]_i_1__2_n_0\
    );
\w4[3]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000008000"
    )
        port map (
      I0 => f_in_IBUF(3),
      I1 => \count_reg[3]\(1),
      I2 => valid_in_f_IBUF,
      I3 => \count_reg[3]\(0),
      I4 => \w4[3]_i_3__2_n_0\,
      I5 => \w1_reg_n_0_[3]\,
      O => w4_next(3)
    );
\w4[3]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state,
      I1 => finish_IBUF,
      O => \w4[3]_i_3__2_n_0\
    );
\w4_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w4[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => w4_next(0),
      Q => w4(0)
    );
\w4_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w4[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => w4_next(1),
      Q => w4(1)
    );
\w4_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w4[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => w4_next(2),
      Q => w4(2)
    );
\w4_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \w4[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => w4_next(3),
      Q => w4(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity PE_TOP is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    start : in STD_LOGIC;
    finish : in STD_LOGIC;
    f_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    valid_in_f : in STD_LOGIC;
    ifmap_1 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    ifmap_2 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    ifmap_3 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    ifmap_4 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    count_PE : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Psum_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Psum_2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Psum_3 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Psum_4 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    start_acc : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of PE_TOP : entity is true;
end PE_TOP;

architecture STRUCTURE of PE_TOP is
  signal PE1_inst_n_10 : STD_LOGIC;
  signal PE1_inst_n_100 : STD_LOGIC;
  signal PE1_inst_n_101 : STD_LOGIC;
  signal PE1_inst_n_102 : STD_LOGIC;
  signal PE1_inst_n_103 : STD_LOGIC;
  signal PE1_inst_n_104 : STD_LOGIC;
  signal PE1_inst_n_105 : STD_LOGIC;
  signal PE1_inst_n_106 : STD_LOGIC;
  signal PE1_inst_n_107 : STD_LOGIC;
  signal PE1_inst_n_108 : STD_LOGIC;
  signal PE1_inst_n_109 : STD_LOGIC;
  signal PE1_inst_n_11 : STD_LOGIC;
  signal PE1_inst_n_110 : STD_LOGIC;
  signal PE1_inst_n_111 : STD_LOGIC;
  signal PE1_inst_n_112 : STD_LOGIC;
  signal PE1_inst_n_113 : STD_LOGIC;
  signal PE1_inst_n_114 : STD_LOGIC;
  signal PE1_inst_n_115 : STD_LOGIC;
  signal PE1_inst_n_116 : STD_LOGIC;
  signal PE1_inst_n_117 : STD_LOGIC;
  signal PE1_inst_n_118 : STD_LOGIC;
  signal PE1_inst_n_119 : STD_LOGIC;
  signal PE1_inst_n_12 : STD_LOGIC;
  signal PE1_inst_n_120 : STD_LOGIC;
  signal PE1_inst_n_121 : STD_LOGIC;
  signal PE1_inst_n_122 : STD_LOGIC;
  signal PE1_inst_n_123 : STD_LOGIC;
  signal PE1_inst_n_124 : STD_LOGIC;
  signal PE1_inst_n_125 : STD_LOGIC;
  signal PE1_inst_n_126 : STD_LOGIC;
  signal PE1_inst_n_127 : STD_LOGIC;
  signal PE1_inst_n_128 : STD_LOGIC;
  signal PE1_inst_n_129 : STD_LOGIC;
  signal PE1_inst_n_13 : STD_LOGIC;
  signal PE1_inst_n_130 : STD_LOGIC;
  signal PE1_inst_n_131 : STD_LOGIC;
  signal PE1_inst_n_132 : STD_LOGIC;
  signal PE1_inst_n_133 : STD_LOGIC;
  signal PE1_inst_n_134 : STD_LOGIC;
  signal PE1_inst_n_135 : STD_LOGIC;
  signal PE1_inst_n_136 : STD_LOGIC;
  signal PE1_inst_n_137 : STD_LOGIC;
  signal PE1_inst_n_138 : STD_LOGIC;
  signal PE1_inst_n_139 : STD_LOGIC;
  signal PE1_inst_n_14 : STD_LOGIC;
  signal PE1_inst_n_140 : STD_LOGIC;
  signal PE1_inst_n_141 : STD_LOGIC;
  signal PE1_inst_n_142 : STD_LOGIC;
  signal PE1_inst_n_143 : STD_LOGIC;
  signal PE1_inst_n_144 : STD_LOGIC;
  signal PE1_inst_n_145 : STD_LOGIC;
  signal PE1_inst_n_146 : STD_LOGIC;
  signal PE1_inst_n_147 : STD_LOGIC;
  signal PE1_inst_n_148 : STD_LOGIC;
  signal PE1_inst_n_149 : STD_LOGIC;
  signal PE1_inst_n_15 : STD_LOGIC;
  signal PE1_inst_n_150 : STD_LOGIC;
  signal PE1_inst_n_151 : STD_LOGIC;
  signal PE1_inst_n_152 : STD_LOGIC;
  signal PE1_inst_n_153 : STD_LOGIC;
  signal PE1_inst_n_154 : STD_LOGIC;
  signal PE1_inst_n_155 : STD_LOGIC;
  signal PE1_inst_n_156 : STD_LOGIC;
  signal PE1_inst_n_157 : STD_LOGIC;
  signal PE1_inst_n_158 : STD_LOGIC;
  signal PE1_inst_n_159 : STD_LOGIC;
  signal PE1_inst_n_16 : STD_LOGIC;
  signal PE1_inst_n_160 : STD_LOGIC;
  signal PE1_inst_n_161 : STD_LOGIC;
  signal PE1_inst_n_162 : STD_LOGIC;
  signal PE1_inst_n_163 : STD_LOGIC;
  signal PE1_inst_n_164 : STD_LOGIC;
  signal PE1_inst_n_165 : STD_LOGIC;
  signal PE1_inst_n_166 : STD_LOGIC;
  signal PE1_inst_n_167 : STD_LOGIC;
  signal PE1_inst_n_168 : STD_LOGIC;
  signal PE1_inst_n_169 : STD_LOGIC;
  signal PE1_inst_n_17 : STD_LOGIC;
  signal PE1_inst_n_170 : STD_LOGIC;
  signal PE1_inst_n_171 : STD_LOGIC;
  signal PE1_inst_n_172 : STD_LOGIC;
  signal PE1_inst_n_173 : STD_LOGIC;
  signal PE1_inst_n_174 : STD_LOGIC;
  signal PE1_inst_n_175 : STD_LOGIC;
  signal PE1_inst_n_176 : STD_LOGIC;
  signal PE1_inst_n_177 : STD_LOGIC;
  signal PE1_inst_n_178 : STD_LOGIC;
  signal PE1_inst_n_179 : STD_LOGIC;
  signal PE1_inst_n_18 : STD_LOGIC;
  signal PE1_inst_n_180 : STD_LOGIC;
  signal PE1_inst_n_181 : STD_LOGIC;
  signal PE1_inst_n_182 : STD_LOGIC;
  signal PE1_inst_n_183 : STD_LOGIC;
  signal PE1_inst_n_184 : STD_LOGIC;
  signal PE1_inst_n_185 : STD_LOGIC;
  signal PE1_inst_n_186 : STD_LOGIC;
  signal PE1_inst_n_187 : STD_LOGIC;
  signal PE1_inst_n_188 : STD_LOGIC;
  signal PE1_inst_n_189 : STD_LOGIC;
  signal PE1_inst_n_19 : STD_LOGIC;
  signal PE1_inst_n_190 : STD_LOGIC;
  signal PE1_inst_n_191 : STD_LOGIC;
  signal PE1_inst_n_192 : STD_LOGIC;
  signal PE1_inst_n_193 : STD_LOGIC;
  signal PE1_inst_n_194 : STD_LOGIC;
  signal PE1_inst_n_195 : STD_LOGIC;
  signal PE1_inst_n_196 : STD_LOGIC;
  signal PE1_inst_n_197 : STD_LOGIC;
  signal PE1_inst_n_198 : STD_LOGIC;
  signal PE1_inst_n_199 : STD_LOGIC;
  signal PE1_inst_n_20 : STD_LOGIC;
  signal PE1_inst_n_200 : STD_LOGIC;
  signal PE1_inst_n_201 : STD_LOGIC;
  signal PE1_inst_n_202 : STD_LOGIC;
  signal PE1_inst_n_203 : STD_LOGIC;
  signal PE1_inst_n_21 : STD_LOGIC;
  signal PE1_inst_n_22 : STD_LOGIC;
  signal PE1_inst_n_23 : STD_LOGIC;
  signal PE1_inst_n_24 : STD_LOGIC;
  signal PE1_inst_n_25 : STD_LOGIC;
  signal PE1_inst_n_26 : STD_LOGIC;
  signal PE1_inst_n_27 : STD_LOGIC;
  signal PE1_inst_n_28 : STD_LOGIC;
  signal PE1_inst_n_29 : STD_LOGIC;
  signal PE1_inst_n_30 : STD_LOGIC;
  signal PE1_inst_n_31 : STD_LOGIC;
  signal PE1_inst_n_32 : STD_LOGIC;
  signal PE1_inst_n_33 : STD_LOGIC;
  signal PE1_inst_n_34 : STD_LOGIC;
  signal PE1_inst_n_35 : STD_LOGIC;
  signal PE1_inst_n_36 : STD_LOGIC;
  signal PE1_inst_n_37 : STD_LOGIC;
  signal PE1_inst_n_38 : STD_LOGIC;
  signal PE1_inst_n_39 : STD_LOGIC;
  signal PE1_inst_n_40 : STD_LOGIC;
  signal PE1_inst_n_41 : STD_LOGIC;
  signal PE1_inst_n_42 : STD_LOGIC;
  signal PE1_inst_n_43 : STD_LOGIC;
  signal PE1_inst_n_44 : STD_LOGIC;
  signal PE1_inst_n_45 : STD_LOGIC;
  signal PE1_inst_n_46 : STD_LOGIC;
  signal PE1_inst_n_47 : STD_LOGIC;
  signal PE1_inst_n_48 : STD_LOGIC;
  signal PE1_inst_n_49 : STD_LOGIC;
  signal PE1_inst_n_50 : STD_LOGIC;
  signal PE1_inst_n_51 : STD_LOGIC;
  signal PE1_inst_n_52 : STD_LOGIC;
  signal PE1_inst_n_53 : STD_LOGIC;
  signal PE1_inst_n_54 : STD_LOGIC;
  signal PE1_inst_n_55 : STD_LOGIC;
  signal PE1_inst_n_56 : STD_LOGIC;
  signal PE1_inst_n_57 : STD_LOGIC;
  signal PE1_inst_n_58 : STD_LOGIC;
  signal PE1_inst_n_59 : STD_LOGIC;
  signal PE1_inst_n_60 : STD_LOGIC;
  signal PE1_inst_n_61 : STD_LOGIC;
  signal PE1_inst_n_62 : STD_LOGIC;
  signal PE1_inst_n_63 : STD_LOGIC;
  signal PE1_inst_n_64 : STD_LOGIC;
  signal PE1_inst_n_65 : STD_LOGIC;
  signal PE1_inst_n_66 : STD_LOGIC;
  signal PE1_inst_n_67 : STD_LOGIC;
  signal PE1_inst_n_68 : STD_LOGIC;
  signal PE1_inst_n_69 : STD_LOGIC;
  signal PE1_inst_n_70 : STD_LOGIC;
  signal PE1_inst_n_71 : STD_LOGIC;
  signal PE1_inst_n_72 : STD_LOGIC;
  signal PE1_inst_n_73 : STD_LOGIC;
  signal PE1_inst_n_74 : STD_LOGIC;
  signal PE1_inst_n_75 : STD_LOGIC;
  signal PE1_inst_n_76 : STD_LOGIC;
  signal PE1_inst_n_77 : STD_LOGIC;
  signal PE1_inst_n_78 : STD_LOGIC;
  signal PE1_inst_n_79 : STD_LOGIC;
  signal PE1_inst_n_80 : STD_LOGIC;
  signal PE1_inst_n_81 : STD_LOGIC;
  signal PE1_inst_n_82 : STD_LOGIC;
  signal PE1_inst_n_83 : STD_LOGIC;
  signal PE1_inst_n_84 : STD_LOGIC;
  signal PE1_inst_n_85 : STD_LOGIC;
  signal PE1_inst_n_86 : STD_LOGIC;
  signal PE1_inst_n_87 : STD_LOGIC;
  signal PE1_inst_n_88 : STD_LOGIC;
  signal PE1_inst_n_89 : STD_LOGIC;
  signal PE1_inst_n_9 : STD_LOGIC;
  signal PE1_inst_n_90 : STD_LOGIC;
  signal PE1_inst_n_91 : STD_LOGIC;
  signal PE1_inst_n_92 : STD_LOGIC;
  signal PE1_inst_n_93 : STD_LOGIC;
  signal PE1_inst_n_94 : STD_LOGIC;
  signal PE1_inst_n_95 : STD_LOGIC;
  signal PE1_inst_n_96 : STD_LOGIC;
  signal PE1_inst_n_97 : STD_LOGIC;
  signal PE1_inst_n_98 : STD_LOGIC;
  signal PE1_inst_n_99 : STD_LOGIC;
  signal Psum_1_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal Psum_2_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal Psum_3_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal Psum_4_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal count_PE_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal f_in_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal finish_IBUF : STD_LOGIC;
  signal ifmap_1_IBUF : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal ifmap_2_IBUF : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal ifmap_3_IBUF : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal ifmap_4_IBUF : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal next_count : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_0_in_0 : STD_LOGIC_VECTOR ( 62 downto 0 );
  signal p_0_in_1 : STD_LOGIC_VECTOR ( 62 downto 0 );
  signal p_0_in_2 : STD_LOGIC_VECTOR ( 62 downto 0 );
  signal rst_IBUF : STD_LOGIC;
  signal start_IBUF : STD_LOGIC;
  signal start_acc_1 : STD_LOGIC;
  signal start_acc_2 : STD_LOGIC;
  signal start_acc_4 : STD_LOGIC;
  signal start_acc_OBUF : STD_LOGIC;
  signal valid_in_f_IBUF : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair157";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair157";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair156";
  attribute SOFT_HLUTNM of \count[3]_i_1\ : label is "soft_lutpair156";
begin
PE1_inst: entity work.PE
     port map (
      AR(0) => rst_IBUF,
      CLK => clk_IBUF_BUFG,
      D(63) => PE1_inst_n_9,
      D(62) => PE1_inst_n_10,
      D(61) => PE1_inst_n_11,
      D(60) => PE1_inst_n_12,
      D(59) => PE1_inst_n_13,
      D(58) => PE1_inst_n_14,
      D(57) => PE1_inst_n_15,
      D(56) => PE1_inst_n_16,
      D(55) => PE1_inst_n_17,
      D(54) => PE1_inst_n_18,
      D(53) => PE1_inst_n_19,
      D(52) => PE1_inst_n_20,
      D(51) => PE1_inst_n_21,
      D(50) => PE1_inst_n_22,
      D(49) => PE1_inst_n_23,
      D(48) => PE1_inst_n_24,
      D(47) => PE1_inst_n_25,
      D(46) => PE1_inst_n_26,
      D(45) => PE1_inst_n_27,
      D(44) => PE1_inst_n_28,
      D(43) => PE1_inst_n_29,
      D(42) => PE1_inst_n_30,
      D(41) => PE1_inst_n_31,
      D(40) => PE1_inst_n_32,
      D(39) => PE1_inst_n_33,
      D(38) => PE1_inst_n_34,
      D(37) => PE1_inst_n_35,
      D(36) => PE1_inst_n_36,
      D(35) => PE1_inst_n_37,
      D(34) => PE1_inst_n_38,
      D(33) => PE1_inst_n_39,
      D(32) => PE1_inst_n_40,
      D(31) => PE1_inst_n_41,
      D(30) => PE1_inst_n_42,
      D(29) => PE1_inst_n_43,
      D(28) => PE1_inst_n_44,
      D(27) => PE1_inst_n_45,
      D(26) => PE1_inst_n_46,
      D(25) => PE1_inst_n_47,
      D(24) => PE1_inst_n_48,
      D(23) => PE1_inst_n_49,
      D(22) => PE1_inst_n_50,
      D(21) => PE1_inst_n_51,
      D(20) => PE1_inst_n_52,
      D(19) => PE1_inst_n_53,
      D(18) => PE1_inst_n_54,
      D(17) => PE1_inst_n_55,
      D(16) => PE1_inst_n_56,
      D(15) => PE1_inst_n_57,
      D(14) => PE1_inst_n_58,
      D(13) => PE1_inst_n_59,
      D(12) => PE1_inst_n_60,
      D(11) => PE1_inst_n_61,
      D(10) => PE1_inst_n_62,
      D(9) => PE1_inst_n_63,
      D(8) => PE1_inst_n_64,
      D(7) => PE1_inst_n_65,
      D(6) => PE1_inst_n_66,
      D(5) => PE1_inst_n_67,
      D(4) => PE1_inst_n_68,
      D(3) => PE1_inst_n_69,
      D(2) => PE1_inst_n_70,
      D(1) => PE1_inst_n_71,
      D(0) => PE1_inst_n_72,
      Q(7 downto 0) => Psum_1_OBUF(7 downto 0),
      \count_PE[7]\(7 downto 0) => count_PE_IBUF(7 downto 0),
      \count_reg[3]\(1 downto 0) => p_0_in(1 downto 0),
      f_in_IBUF(3 downto 0) => f_in_IBUF(3 downto 0),
      finish_IBUF => finish_IBUF,
      ifmap_1_IBUF(63 downto 0) => ifmap_1_IBUF(63 downto 0),
      ifmap_2_IBUF(63 downto 0) => ifmap_2_IBUF(63 downto 0),
      ifmap_3_IBUF(63 downto 0) => ifmap_3_IBUF(63 downto 0),
      ifmap_4_IBUF(63 downto 0) => ifmap_4_IBUF(63 downto 0),
      \ifmap_calc_reg[0]_0\ => PE1_inst_n_73,
      \ifmap_calc_reg[0]_1\ => PE1_inst_n_138,
      \ifmap_calc_reg[0]_2\ => PE1_inst_n_203,
      \ifmap_calc_reg[63]_0\(63) => PE1_inst_n_74,
      \ifmap_calc_reg[63]_0\(62) => PE1_inst_n_75,
      \ifmap_calc_reg[63]_0\(61) => PE1_inst_n_76,
      \ifmap_calc_reg[63]_0\(60) => PE1_inst_n_77,
      \ifmap_calc_reg[63]_0\(59) => PE1_inst_n_78,
      \ifmap_calc_reg[63]_0\(58) => PE1_inst_n_79,
      \ifmap_calc_reg[63]_0\(57) => PE1_inst_n_80,
      \ifmap_calc_reg[63]_0\(56) => PE1_inst_n_81,
      \ifmap_calc_reg[63]_0\(55) => PE1_inst_n_82,
      \ifmap_calc_reg[63]_0\(54) => PE1_inst_n_83,
      \ifmap_calc_reg[63]_0\(53) => PE1_inst_n_84,
      \ifmap_calc_reg[63]_0\(52) => PE1_inst_n_85,
      \ifmap_calc_reg[63]_0\(51) => PE1_inst_n_86,
      \ifmap_calc_reg[63]_0\(50) => PE1_inst_n_87,
      \ifmap_calc_reg[63]_0\(49) => PE1_inst_n_88,
      \ifmap_calc_reg[63]_0\(48) => PE1_inst_n_89,
      \ifmap_calc_reg[63]_0\(47) => PE1_inst_n_90,
      \ifmap_calc_reg[63]_0\(46) => PE1_inst_n_91,
      \ifmap_calc_reg[63]_0\(45) => PE1_inst_n_92,
      \ifmap_calc_reg[63]_0\(44) => PE1_inst_n_93,
      \ifmap_calc_reg[63]_0\(43) => PE1_inst_n_94,
      \ifmap_calc_reg[63]_0\(42) => PE1_inst_n_95,
      \ifmap_calc_reg[63]_0\(41) => PE1_inst_n_96,
      \ifmap_calc_reg[63]_0\(40) => PE1_inst_n_97,
      \ifmap_calc_reg[63]_0\(39) => PE1_inst_n_98,
      \ifmap_calc_reg[63]_0\(38) => PE1_inst_n_99,
      \ifmap_calc_reg[63]_0\(37) => PE1_inst_n_100,
      \ifmap_calc_reg[63]_0\(36) => PE1_inst_n_101,
      \ifmap_calc_reg[63]_0\(35) => PE1_inst_n_102,
      \ifmap_calc_reg[63]_0\(34) => PE1_inst_n_103,
      \ifmap_calc_reg[63]_0\(33) => PE1_inst_n_104,
      \ifmap_calc_reg[63]_0\(32) => PE1_inst_n_105,
      \ifmap_calc_reg[63]_0\(31) => PE1_inst_n_106,
      \ifmap_calc_reg[63]_0\(30) => PE1_inst_n_107,
      \ifmap_calc_reg[63]_0\(29) => PE1_inst_n_108,
      \ifmap_calc_reg[63]_0\(28) => PE1_inst_n_109,
      \ifmap_calc_reg[63]_0\(27) => PE1_inst_n_110,
      \ifmap_calc_reg[63]_0\(26) => PE1_inst_n_111,
      \ifmap_calc_reg[63]_0\(25) => PE1_inst_n_112,
      \ifmap_calc_reg[63]_0\(24) => PE1_inst_n_113,
      \ifmap_calc_reg[63]_0\(23) => PE1_inst_n_114,
      \ifmap_calc_reg[63]_0\(22) => PE1_inst_n_115,
      \ifmap_calc_reg[63]_0\(21) => PE1_inst_n_116,
      \ifmap_calc_reg[63]_0\(20) => PE1_inst_n_117,
      \ifmap_calc_reg[63]_0\(19) => PE1_inst_n_118,
      \ifmap_calc_reg[63]_0\(18) => PE1_inst_n_119,
      \ifmap_calc_reg[63]_0\(17) => PE1_inst_n_120,
      \ifmap_calc_reg[63]_0\(16) => PE1_inst_n_121,
      \ifmap_calc_reg[63]_0\(15) => PE1_inst_n_122,
      \ifmap_calc_reg[63]_0\(14) => PE1_inst_n_123,
      \ifmap_calc_reg[63]_0\(13) => PE1_inst_n_124,
      \ifmap_calc_reg[63]_0\(12) => PE1_inst_n_125,
      \ifmap_calc_reg[63]_0\(11) => PE1_inst_n_126,
      \ifmap_calc_reg[63]_0\(10) => PE1_inst_n_127,
      \ifmap_calc_reg[63]_0\(9) => PE1_inst_n_128,
      \ifmap_calc_reg[63]_0\(8) => PE1_inst_n_129,
      \ifmap_calc_reg[63]_0\(7) => PE1_inst_n_130,
      \ifmap_calc_reg[63]_0\(6) => PE1_inst_n_131,
      \ifmap_calc_reg[63]_0\(5) => PE1_inst_n_132,
      \ifmap_calc_reg[63]_0\(4) => PE1_inst_n_133,
      \ifmap_calc_reg[63]_0\(3) => PE1_inst_n_134,
      \ifmap_calc_reg[63]_0\(2) => PE1_inst_n_135,
      \ifmap_calc_reg[63]_0\(1) => PE1_inst_n_136,
      \ifmap_calc_reg[63]_0\(0) => PE1_inst_n_137,
      \ifmap_calc_reg[63]_1\(63) => PE1_inst_n_139,
      \ifmap_calc_reg[63]_1\(62) => PE1_inst_n_140,
      \ifmap_calc_reg[63]_1\(61) => PE1_inst_n_141,
      \ifmap_calc_reg[63]_1\(60) => PE1_inst_n_142,
      \ifmap_calc_reg[63]_1\(59) => PE1_inst_n_143,
      \ifmap_calc_reg[63]_1\(58) => PE1_inst_n_144,
      \ifmap_calc_reg[63]_1\(57) => PE1_inst_n_145,
      \ifmap_calc_reg[63]_1\(56) => PE1_inst_n_146,
      \ifmap_calc_reg[63]_1\(55) => PE1_inst_n_147,
      \ifmap_calc_reg[63]_1\(54) => PE1_inst_n_148,
      \ifmap_calc_reg[63]_1\(53) => PE1_inst_n_149,
      \ifmap_calc_reg[63]_1\(52) => PE1_inst_n_150,
      \ifmap_calc_reg[63]_1\(51) => PE1_inst_n_151,
      \ifmap_calc_reg[63]_1\(50) => PE1_inst_n_152,
      \ifmap_calc_reg[63]_1\(49) => PE1_inst_n_153,
      \ifmap_calc_reg[63]_1\(48) => PE1_inst_n_154,
      \ifmap_calc_reg[63]_1\(47) => PE1_inst_n_155,
      \ifmap_calc_reg[63]_1\(46) => PE1_inst_n_156,
      \ifmap_calc_reg[63]_1\(45) => PE1_inst_n_157,
      \ifmap_calc_reg[63]_1\(44) => PE1_inst_n_158,
      \ifmap_calc_reg[63]_1\(43) => PE1_inst_n_159,
      \ifmap_calc_reg[63]_1\(42) => PE1_inst_n_160,
      \ifmap_calc_reg[63]_1\(41) => PE1_inst_n_161,
      \ifmap_calc_reg[63]_1\(40) => PE1_inst_n_162,
      \ifmap_calc_reg[63]_1\(39) => PE1_inst_n_163,
      \ifmap_calc_reg[63]_1\(38) => PE1_inst_n_164,
      \ifmap_calc_reg[63]_1\(37) => PE1_inst_n_165,
      \ifmap_calc_reg[63]_1\(36) => PE1_inst_n_166,
      \ifmap_calc_reg[63]_1\(35) => PE1_inst_n_167,
      \ifmap_calc_reg[63]_1\(34) => PE1_inst_n_168,
      \ifmap_calc_reg[63]_1\(33) => PE1_inst_n_169,
      \ifmap_calc_reg[63]_1\(32) => PE1_inst_n_170,
      \ifmap_calc_reg[63]_1\(31) => PE1_inst_n_171,
      \ifmap_calc_reg[63]_1\(30) => PE1_inst_n_172,
      \ifmap_calc_reg[63]_1\(29) => PE1_inst_n_173,
      \ifmap_calc_reg[63]_1\(28) => PE1_inst_n_174,
      \ifmap_calc_reg[63]_1\(27) => PE1_inst_n_175,
      \ifmap_calc_reg[63]_1\(26) => PE1_inst_n_176,
      \ifmap_calc_reg[63]_1\(25) => PE1_inst_n_177,
      \ifmap_calc_reg[63]_1\(24) => PE1_inst_n_178,
      \ifmap_calc_reg[63]_1\(23) => PE1_inst_n_179,
      \ifmap_calc_reg[63]_1\(22) => PE1_inst_n_180,
      \ifmap_calc_reg[63]_1\(21) => PE1_inst_n_181,
      \ifmap_calc_reg[63]_1\(20) => PE1_inst_n_182,
      \ifmap_calc_reg[63]_1\(19) => PE1_inst_n_183,
      \ifmap_calc_reg[63]_1\(18) => PE1_inst_n_184,
      \ifmap_calc_reg[63]_1\(17) => PE1_inst_n_185,
      \ifmap_calc_reg[63]_1\(16) => PE1_inst_n_186,
      \ifmap_calc_reg[63]_1\(15) => PE1_inst_n_187,
      \ifmap_calc_reg[63]_1\(14) => PE1_inst_n_188,
      \ifmap_calc_reg[63]_1\(13) => PE1_inst_n_189,
      \ifmap_calc_reg[63]_1\(12) => PE1_inst_n_190,
      \ifmap_calc_reg[63]_1\(11) => PE1_inst_n_191,
      \ifmap_calc_reg[63]_1\(10) => PE1_inst_n_192,
      \ifmap_calc_reg[63]_1\(9) => PE1_inst_n_193,
      \ifmap_calc_reg[63]_1\(8) => PE1_inst_n_194,
      \ifmap_calc_reg[63]_1\(7) => PE1_inst_n_195,
      \ifmap_calc_reg[63]_1\(6) => PE1_inst_n_196,
      \ifmap_calc_reg[63]_1\(5) => PE1_inst_n_197,
      \ifmap_calc_reg[63]_1\(4) => PE1_inst_n_198,
      \ifmap_calc_reg[63]_1\(3) => PE1_inst_n_199,
      \ifmap_calc_reg[63]_1\(2) => PE1_inst_n_200,
      \ifmap_calc_reg[63]_1\(1) => PE1_inst_n_201,
      \ifmap_calc_reg[63]_1\(0) => PE1_inst_n_202,
      \ifmap_calc_reg[63]_2\(62 downto 0) => p_0_in_2(62 downto 0),
      \ifmap_calc_reg[63]_3\(62 downto 0) => p_0_in_1(62 downto 0),
      \ifmap_calc_reg[63]_4\(62 downto 0) => p_0_in_0(62 downto 0),
      start_IBUF => start_IBUF,
      start_acc_1 => start_acc_1,
      valid_in_f_IBUF => valid_in_f_IBUF
    );
PE2_inst: entity work.PE_0
     port map (
      AR(0) => rst_IBUF,
      CLK => clk_IBUF_BUFG,
      D(63) => PE1_inst_n_139,
      D(62) => PE1_inst_n_140,
      D(61) => PE1_inst_n_141,
      D(60) => PE1_inst_n_142,
      D(59) => PE1_inst_n_143,
      D(58) => PE1_inst_n_144,
      D(57) => PE1_inst_n_145,
      D(56) => PE1_inst_n_146,
      D(55) => PE1_inst_n_147,
      D(54) => PE1_inst_n_148,
      D(53) => PE1_inst_n_149,
      D(52) => PE1_inst_n_150,
      D(51) => PE1_inst_n_151,
      D(50) => PE1_inst_n_152,
      D(49) => PE1_inst_n_153,
      D(48) => PE1_inst_n_154,
      D(47) => PE1_inst_n_155,
      D(46) => PE1_inst_n_156,
      D(45) => PE1_inst_n_157,
      D(44) => PE1_inst_n_158,
      D(43) => PE1_inst_n_159,
      D(42) => PE1_inst_n_160,
      D(41) => PE1_inst_n_161,
      D(40) => PE1_inst_n_162,
      D(39) => PE1_inst_n_163,
      D(38) => PE1_inst_n_164,
      D(37) => PE1_inst_n_165,
      D(36) => PE1_inst_n_166,
      D(35) => PE1_inst_n_167,
      D(34) => PE1_inst_n_168,
      D(33) => PE1_inst_n_169,
      D(32) => PE1_inst_n_170,
      D(31) => PE1_inst_n_171,
      D(30) => PE1_inst_n_172,
      D(29) => PE1_inst_n_173,
      D(28) => PE1_inst_n_174,
      D(27) => PE1_inst_n_175,
      D(26) => PE1_inst_n_176,
      D(25) => PE1_inst_n_177,
      D(24) => PE1_inst_n_178,
      D(23) => PE1_inst_n_179,
      D(22) => PE1_inst_n_180,
      D(21) => PE1_inst_n_181,
      D(20) => PE1_inst_n_182,
      D(19) => PE1_inst_n_183,
      D(18) => PE1_inst_n_184,
      D(17) => PE1_inst_n_185,
      D(16) => PE1_inst_n_186,
      D(15) => PE1_inst_n_187,
      D(14) => PE1_inst_n_188,
      D(13) => PE1_inst_n_189,
      D(12) => PE1_inst_n_190,
      D(11) => PE1_inst_n_191,
      D(10) => PE1_inst_n_192,
      D(9) => PE1_inst_n_193,
      D(8) => PE1_inst_n_194,
      D(7) => PE1_inst_n_195,
      D(6) => PE1_inst_n_196,
      D(5) => PE1_inst_n_197,
      D(4) => PE1_inst_n_198,
      D(3) => PE1_inst_n_199,
      D(2) => PE1_inst_n_200,
      D(1) => PE1_inst_n_201,
      D(0) => PE1_inst_n_202,
      Q(7 downto 0) => Psum_2_OBUF(7 downto 0),
      \count_reg[3]\(1 downto 0) => p_0_in(1 downto 0),
      \count_row_del_reg[0]\ => PE1_inst_n_203,
      f_in_IBUF(3 downto 0) => f_in_IBUF(3 downto 0),
      finish_IBUF => finish_IBUF,
      \ifmap_calc_reg[62]_0\(62 downto 0) => p_0_in_0(62 downto 0),
      start_IBUF => start_IBUF,
      start_acc_2 => start_acc_2,
      valid_in_f_IBUF => valid_in_f_IBUF
    );
PE3_inst: entity work.PE_1
     port map (
      AR(0) => rst_IBUF,
      CLK => clk_IBUF_BUFG,
      D(63) => PE1_inst_n_74,
      D(62) => PE1_inst_n_75,
      D(61) => PE1_inst_n_76,
      D(60) => PE1_inst_n_77,
      D(59) => PE1_inst_n_78,
      D(58) => PE1_inst_n_79,
      D(57) => PE1_inst_n_80,
      D(56) => PE1_inst_n_81,
      D(55) => PE1_inst_n_82,
      D(54) => PE1_inst_n_83,
      D(53) => PE1_inst_n_84,
      D(52) => PE1_inst_n_85,
      D(51) => PE1_inst_n_86,
      D(50) => PE1_inst_n_87,
      D(49) => PE1_inst_n_88,
      D(48) => PE1_inst_n_89,
      D(47) => PE1_inst_n_90,
      D(46) => PE1_inst_n_91,
      D(45) => PE1_inst_n_92,
      D(44) => PE1_inst_n_93,
      D(43) => PE1_inst_n_94,
      D(42) => PE1_inst_n_95,
      D(41) => PE1_inst_n_96,
      D(40) => PE1_inst_n_97,
      D(39) => PE1_inst_n_98,
      D(38) => PE1_inst_n_99,
      D(37) => PE1_inst_n_100,
      D(36) => PE1_inst_n_101,
      D(35) => PE1_inst_n_102,
      D(34) => PE1_inst_n_103,
      D(33) => PE1_inst_n_104,
      D(32) => PE1_inst_n_105,
      D(31) => PE1_inst_n_106,
      D(30) => PE1_inst_n_107,
      D(29) => PE1_inst_n_108,
      D(28) => PE1_inst_n_109,
      D(27) => PE1_inst_n_110,
      D(26) => PE1_inst_n_111,
      D(25) => PE1_inst_n_112,
      D(24) => PE1_inst_n_113,
      D(23) => PE1_inst_n_114,
      D(22) => PE1_inst_n_115,
      D(21) => PE1_inst_n_116,
      D(20) => PE1_inst_n_117,
      D(19) => PE1_inst_n_118,
      D(18) => PE1_inst_n_119,
      D(17) => PE1_inst_n_120,
      D(16) => PE1_inst_n_121,
      D(15) => PE1_inst_n_122,
      D(14) => PE1_inst_n_123,
      D(13) => PE1_inst_n_124,
      D(12) => PE1_inst_n_125,
      D(11) => PE1_inst_n_126,
      D(10) => PE1_inst_n_127,
      D(9) => PE1_inst_n_128,
      D(8) => PE1_inst_n_129,
      D(7) => PE1_inst_n_130,
      D(6) => PE1_inst_n_131,
      D(5) => PE1_inst_n_132,
      D(4) => PE1_inst_n_133,
      D(3) => PE1_inst_n_134,
      D(2) => PE1_inst_n_135,
      D(1) => PE1_inst_n_136,
      D(0) => PE1_inst_n_137,
      Q(7 downto 0) => Psum_3_OBUF(7 downto 0),
      \count_reg[3]\(1 downto 0) => p_0_in(1 downto 0),
      \count_row_del_reg[0]\ => PE1_inst_n_138,
      f_in_IBUF(3 downto 0) => f_in_IBUF(3 downto 0),
      finish_IBUF => finish_IBUF,
      \ifmap_calc_reg[62]_0\(62 downto 0) => p_0_in_1(62 downto 0),
      start_IBUF => start_IBUF,
      start_acc_1 => start_acc_1,
      start_acc_2 => start_acc_2,
      start_acc_4 => start_acc_4,
      start_acc_OBUF => start_acc_OBUF,
      valid_in_f_IBUF => valid_in_f_IBUF
    );
PE4_inst: entity work.PE_2
     port map (
      AR(0) => rst_IBUF,
      CLK => clk_IBUF_BUFG,
      D(63) => PE1_inst_n_9,
      D(62) => PE1_inst_n_10,
      D(61) => PE1_inst_n_11,
      D(60) => PE1_inst_n_12,
      D(59) => PE1_inst_n_13,
      D(58) => PE1_inst_n_14,
      D(57) => PE1_inst_n_15,
      D(56) => PE1_inst_n_16,
      D(55) => PE1_inst_n_17,
      D(54) => PE1_inst_n_18,
      D(53) => PE1_inst_n_19,
      D(52) => PE1_inst_n_20,
      D(51) => PE1_inst_n_21,
      D(50) => PE1_inst_n_22,
      D(49) => PE1_inst_n_23,
      D(48) => PE1_inst_n_24,
      D(47) => PE1_inst_n_25,
      D(46) => PE1_inst_n_26,
      D(45) => PE1_inst_n_27,
      D(44) => PE1_inst_n_28,
      D(43) => PE1_inst_n_29,
      D(42) => PE1_inst_n_30,
      D(41) => PE1_inst_n_31,
      D(40) => PE1_inst_n_32,
      D(39) => PE1_inst_n_33,
      D(38) => PE1_inst_n_34,
      D(37) => PE1_inst_n_35,
      D(36) => PE1_inst_n_36,
      D(35) => PE1_inst_n_37,
      D(34) => PE1_inst_n_38,
      D(33) => PE1_inst_n_39,
      D(32) => PE1_inst_n_40,
      D(31) => PE1_inst_n_41,
      D(30) => PE1_inst_n_42,
      D(29) => PE1_inst_n_43,
      D(28) => PE1_inst_n_44,
      D(27) => PE1_inst_n_45,
      D(26) => PE1_inst_n_46,
      D(25) => PE1_inst_n_47,
      D(24) => PE1_inst_n_48,
      D(23) => PE1_inst_n_49,
      D(22) => PE1_inst_n_50,
      D(21) => PE1_inst_n_51,
      D(20) => PE1_inst_n_52,
      D(19) => PE1_inst_n_53,
      D(18) => PE1_inst_n_54,
      D(17) => PE1_inst_n_55,
      D(16) => PE1_inst_n_56,
      D(15) => PE1_inst_n_57,
      D(14) => PE1_inst_n_58,
      D(13) => PE1_inst_n_59,
      D(12) => PE1_inst_n_60,
      D(11) => PE1_inst_n_61,
      D(10) => PE1_inst_n_62,
      D(9) => PE1_inst_n_63,
      D(8) => PE1_inst_n_64,
      D(7) => PE1_inst_n_65,
      D(6) => PE1_inst_n_66,
      D(5) => PE1_inst_n_67,
      D(4) => PE1_inst_n_68,
      D(3) => PE1_inst_n_69,
      D(2) => PE1_inst_n_70,
      D(1) => PE1_inst_n_71,
      D(0) => PE1_inst_n_72,
      Q(7 downto 0) => Psum_4_OBUF(7 downto 0),
      \count_reg[3]\(1 downto 0) => p_0_in(1 downto 0),
      \count_row_del_reg[0]\ => PE1_inst_n_73,
      f_in_IBUF(3 downto 0) => f_in_IBUF(3 downto 0),
      finish_IBUF => finish_IBUF,
      \ifmap_calc_reg[62]_0\(62 downto 0) => p_0_in_2(62 downto 0),
      start_IBUF => start_IBUF,
      start_acc_4 => start_acc_4,
      valid_in_f_IBUF => valid_in_f_IBUF
    );
\Psum_1_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_1_OBUF(0),
      O => Psum_1(0)
    );
\Psum_1_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_1_OBUF(1),
      O => Psum_1(1)
    );
\Psum_1_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_1_OBUF(2),
      O => Psum_1(2)
    );
\Psum_1_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_1_OBUF(3),
      O => Psum_1(3)
    );
\Psum_1_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_1_OBUF(4),
      O => Psum_1(4)
    );
\Psum_1_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_1_OBUF(5),
      O => Psum_1(5)
    );
\Psum_1_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_1_OBUF(6),
      O => Psum_1(6)
    );
\Psum_1_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_1_OBUF(7),
      O => Psum_1(7)
    );
\Psum_2_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_2_OBUF(0),
      O => Psum_2(0)
    );
\Psum_2_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_2_OBUF(1),
      O => Psum_2(1)
    );
\Psum_2_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_2_OBUF(2),
      O => Psum_2(2)
    );
\Psum_2_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_2_OBUF(3),
      O => Psum_2(3)
    );
\Psum_2_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_2_OBUF(4),
      O => Psum_2(4)
    );
\Psum_2_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_2_OBUF(5),
      O => Psum_2(5)
    );
\Psum_2_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_2_OBUF(6),
      O => Psum_2(6)
    );
\Psum_2_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_2_OBUF(7),
      O => Psum_2(7)
    );
\Psum_3_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_3_OBUF(0),
      O => Psum_3(0)
    );
\Psum_3_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_3_OBUF(1),
      O => Psum_3(1)
    );
\Psum_3_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_3_OBUF(2),
      O => Psum_3(2)
    );
\Psum_3_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_3_OBUF(3),
      O => Psum_3(3)
    );
\Psum_3_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_3_OBUF(4),
      O => Psum_3(4)
    );
\Psum_3_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_3_OBUF(5),
      O => Psum_3(5)
    );
\Psum_3_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_3_OBUF(6),
      O => Psum_3(6)
    );
\Psum_3_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_3_OBUF(7),
      O => Psum_3(7)
    );
\Psum_4_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_4_OBUF(0),
      O => Psum_4(0)
    );
\Psum_4_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_4_OBUF(1),
      O => Psum_4(1)
    );
\Psum_4_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_4_OBUF(2),
      O => Psum_4(2)
    );
\Psum_4_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_4_OBUF(3),
      O => Psum_4(3)
    );
\Psum_4_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_4_OBUF(4),
      O => Psum_4(4)
    );
\Psum_4_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_4_OBUF(5),
      O => Psum_4(5)
    );
\Psum_4_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_4_OBUF(6),
      O => Psum_4(6)
    );
\Psum_4_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => Psum_4_OBUF(7),
      O => Psum_4(7)
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
\count[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => valid_in_f_IBUF,
      I1 => \count_reg_n_0_[0]\,
      O => next_count(0)
    );
\count[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => valid_in_f_IBUF,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      O => next_count(1)
    );
\count[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => valid_in_f_IBUF,
      I1 => \count_reg_n_0_[0]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => p_0_in(0),
      O => next_count(2)
    );
\count[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => valid_in_f_IBUF,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      I3 => p_0_in(0),
      I4 => p_0_in(1),
      O => next_count(3)
    );
\count_PE_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => count_PE(0),
      O => count_PE_IBUF(0)
    );
\count_PE_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => count_PE(1),
      O => count_PE_IBUF(1)
    );
\count_PE_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => count_PE(2),
      O => count_PE_IBUF(2)
    );
\count_PE_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => count_PE(3),
      O => count_PE_IBUF(3)
    );
\count_PE_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => count_PE(4),
      O => count_PE_IBUF(4)
    );
\count_PE_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => count_PE(5),
      O => count_PE_IBUF(5)
    );
\count_PE_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => count_PE(6),
      O => count_PE_IBUF(6)
    );
\count_PE_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => count_PE(7),
      O => count_PE_IBUF(7)
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => next_count(0),
      Q => \count_reg_n_0_[0]\
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => next_count(1),
      Q => \count_reg_n_0_[1]\
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => next_count(2),
      Q => p_0_in(0)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => next_count(3),
      Q => p_0_in(1)
    );
\f_in_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => f_in(0),
      O => f_in_IBUF(0)
    );
\f_in_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => f_in(1),
      O => f_in_IBUF(1)
    );
\f_in_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => f_in(2),
      O => f_in_IBUF(2)
    );
\f_in_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => f_in(3),
      O => f_in_IBUF(3)
    );
finish_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => finish,
      O => finish_IBUF
    );
\ifmap_1_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(0),
      O => ifmap_1_IBUF(0)
    );
\ifmap_1_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(10),
      O => ifmap_1_IBUF(10)
    );
\ifmap_1_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(11),
      O => ifmap_1_IBUF(11)
    );
\ifmap_1_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(12),
      O => ifmap_1_IBUF(12)
    );
\ifmap_1_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(13),
      O => ifmap_1_IBUF(13)
    );
\ifmap_1_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(14),
      O => ifmap_1_IBUF(14)
    );
\ifmap_1_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(15),
      O => ifmap_1_IBUF(15)
    );
\ifmap_1_IBUF[16]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(16),
      O => ifmap_1_IBUF(16)
    );
\ifmap_1_IBUF[17]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(17),
      O => ifmap_1_IBUF(17)
    );
\ifmap_1_IBUF[18]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(18),
      O => ifmap_1_IBUF(18)
    );
\ifmap_1_IBUF[19]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(19),
      O => ifmap_1_IBUF(19)
    );
\ifmap_1_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(1),
      O => ifmap_1_IBUF(1)
    );
\ifmap_1_IBUF[20]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(20),
      O => ifmap_1_IBUF(20)
    );
\ifmap_1_IBUF[21]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(21),
      O => ifmap_1_IBUF(21)
    );
\ifmap_1_IBUF[22]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(22),
      O => ifmap_1_IBUF(22)
    );
\ifmap_1_IBUF[23]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(23),
      O => ifmap_1_IBUF(23)
    );
\ifmap_1_IBUF[24]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(24),
      O => ifmap_1_IBUF(24)
    );
\ifmap_1_IBUF[25]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(25),
      O => ifmap_1_IBUF(25)
    );
\ifmap_1_IBUF[26]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(26),
      O => ifmap_1_IBUF(26)
    );
\ifmap_1_IBUF[27]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(27),
      O => ifmap_1_IBUF(27)
    );
\ifmap_1_IBUF[28]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(28),
      O => ifmap_1_IBUF(28)
    );
\ifmap_1_IBUF[29]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(29),
      O => ifmap_1_IBUF(29)
    );
\ifmap_1_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(2),
      O => ifmap_1_IBUF(2)
    );
\ifmap_1_IBUF[30]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(30),
      O => ifmap_1_IBUF(30)
    );
\ifmap_1_IBUF[31]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(31),
      O => ifmap_1_IBUF(31)
    );
\ifmap_1_IBUF[32]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(32),
      O => ifmap_1_IBUF(32)
    );
\ifmap_1_IBUF[33]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(33),
      O => ifmap_1_IBUF(33)
    );
\ifmap_1_IBUF[34]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(34),
      O => ifmap_1_IBUF(34)
    );
\ifmap_1_IBUF[35]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(35),
      O => ifmap_1_IBUF(35)
    );
\ifmap_1_IBUF[36]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(36),
      O => ifmap_1_IBUF(36)
    );
\ifmap_1_IBUF[37]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(37),
      O => ifmap_1_IBUF(37)
    );
\ifmap_1_IBUF[38]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(38),
      O => ifmap_1_IBUF(38)
    );
\ifmap_1_IBUF[39]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(39),
      O => ifmap_1_IBUF(39)
    );
\ifmap_1_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(3),
      O => ifmap_1_IBUF(3)
    );
\ifmap_1_IBUF[40]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(40),
      O => ifmap_1_IBUF(40)
    );
\ifmap_1_IBUF[41]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(41),
      O => ifmap_1_IBUF(41)
    );
\ifmap_1_IBUF[42]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(42),
      O => ifmap_1_IBUF(42)
    );
\ifmap_1_IBUF[43]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(43),
      O => ifmap_1_IBUF(43)
    );
\ifmap_1_IBUF[44]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(44),
      O => ifmap_1_IBUF(44)
    );
\ifmap_1_IBUF[45]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(45),
      O => ifmap_1_IBUF(45)
    );
\ifmap_1_IBUF[46]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(46),
      O => ifmap_1_IBUF(46)
    );
\ifmap_1_IBUF[47]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(47),
      O => ifmap_1_IBUF(47)
    );
\ifmap_1_IBUF[48]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(48),
      O => ifmap_1_IBUF(48)
    );
\ifmap_1_IBUF[49]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(49),
      O => ifmap_1_IBUF(49)
    );
\ifmap_1_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(4),
      O => ifmap_1_IBUF(4)
    );
\ifmap_1_IBUF[50]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(50),
      O => ifmap_1_IBUF(50)
    );
\ifmap_1_IBUF[51]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(51),
      O => ifmap_1_IBUF(51)
    );
\ifmap_1_IBUF[52]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(52),
      O => ifmap_1_IBUF(52)
    );
\ifmap_1_IBUF[53]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(53),
      O => ifmap_1_IBUF(53)
    );
\ifmap_1_IBUF[54]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(54),
      O => ifmap_1_IBUF(54)
    );
\ifmap_1_IBUF[55]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(55),
      O => ifmap_1_IBUF(55)
    );
\ifmap_1_IBUF[56]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(56),
      O => ifmap_1_IBUF(56)
    );
\ifmap_1_IBUF[57]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(57),
      O => ifmap_1_IBUF(57)
    );
\ifmap_1_IBUF[58]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(58),
      O => ifmap_1_IBUF(58)
    );
\ifmap_1_IBUF[59]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(59),
      O => ifmap_1_IBUF(59)
    );
\ifmap_1_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(5),
      O => ifmap_1_IBUF(5)
    );
\ifmap_1_IBUF[60]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(60),
      O => ifmap_1_IBUF(60)
    );
\ifmap_1_IBUF[61]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(61),
      O => ifmap_1_IBUF(61)
    );
\ifmap_1_IBUF[62]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(62),
      O => ifmap_1_IBUF(62)
    );
\ifmap_1_IBUF[63]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(63),
      O => ifmap_1_IBUF(63)
    );
\ifmap_1_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(6),
      O => ifmap_1_IBUF(6)
    );
\ifmap_1_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(7),
      O => ifmap_1_IBUF(7)
    );
\ifmap_1_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(8),
      O => ifmap_1_IBUF(8)
    );
\ifmap_1_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_1(9),
      O => ifmap_1_IBUF(9)
    );
\ifmap_2_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(0),
      O => ifmap_2_IBUF(0)
    );
\ifmap_2_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(10),
      O => ifmap_2_IBUF(10)
    );
\ifmap_2_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(11),
      O => ifmap_2_IBUF(11)
    );
\ifmap_2_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(12),
      O => ifmap_2_IBUF(12)
    );
\ifmap_2_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(13),
      O => ifmap_2_IBUF(13)
    );
\ifmap_2_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(14),
      O => ifmap_2_IBUF(14)
    );
\ifmap_2_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(15),
      O => ifmap_2_IBUF(15)
    );
\ifmap_2_IBUF[16]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(16),
      O => ifmap_2_IBUF(16)
    );
\ifmap_2_IBUF[17]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(17),
      O => ifmap_2_IBUF(17)
    );
\ifmap_2_IBUF[18]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(18),
      O => ifmap_2_IBUF(18)
    );
\ifmap_2_IBUF[19]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(19),
      O => ifmap_2_IBUF(19)
    );
\ifmap_2_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(1),
      O => ifmap_2_IBUF(1)
    );
\ifmap_2_IBUF[20]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(20),
      O => ifmap_2_IBUF(20)
    );
\ifmap_2_IBUF[21]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(21),
      O => ifmap_2_IBUF(21)
    );
\ifmap_2_IBUF[22]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(22),
      O => ifmap_2_IBUF(22)
    );
\ifmap_2_IBUF[23]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(23),
      O => ifmap_2_IBUF(23)
    );
\ifmap_2_IBUF[24]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(24),
      O => ifmap_2_IBUF(24)
    );
\ifmap_2_IBUF[25]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(25),
      O => ifmap_2_IBUF(25)
    );
\ifmap_2_IBUF[26]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(26),
      O => ifmap_2_IBUF(26)
    );
\ifmap_2_IBUF[27]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(27),
      O => ifmap_2_IBUF(27)
    );
\ifmap_2_IBUF[28]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(28),
      O => ifmap_2_IBUF(28)
    );
\ifmap_2_IBUF[29]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(29),
      O => ifmap_2_IBUF(29)
    );
\ifmap_2_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(2),
      O => ifmap_2_IBUF(2)
    );
\ifmap_2_IBUF[30]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(30),
      O => ifmap_2_IBUF(30)
    );
\ifmap_2_IBUF[31]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(31),
      O => ifmap_2_IBUF(31)
    );
\ifmap_2_IBUF[32]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(32),
      O => ifmap_2_IBUF(32)
    );
\ifmap_2_IBUF[33]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(33),
      O => ifmap_2_IBUF(33)
    );
\ifmap_2_IBUF[34]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(34),
      O => ifmap_2_IBUF(34)
    );
\ifmap_2_IBUF[35]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(35),
      O => ifmap_2_IBUF(35)
    );
\ifmap_2_IBUF[36]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(36),
      O => ifmap_2_IBUF(36)
    );
\ifmap_2_IBUF[37]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(37),
      O => ifmap_2_IBUF(37)
    );
\ifmap_2_IBUF[38]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(38),
      O => ifmap_2_IBUF(38)
    );
\ifmap_2_IBUF[39]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(39),
      O => ifmap_2_IBUF(39)
    );
\ifmap_2_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(3),
      O => ifmap_2_IBUF(3)
    );
\ifmap_2_IBUF[40]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(40),
      O => ifmap_2_IBUF(40)
    );
\ifmap_2_IBUF[41]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(41),
      O => ifmap_2_IBUF(41)
    );
\ifmap_2_IBUF[42]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(42),
      O => ifmap_2_IBUF(42)
    );
\ifmap_2_IBUF[43]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(43),
      O => ifmap_2_IBUF(43)
    );
\ifmap_2_IBUF[44]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(44),
      O => ifmap_2_IBUF(44)
    );
\ifmap_2_IBUF[45]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(45),
      O => ifmap_2_IBUF(45)
    );
\ifmap_2_IBUF[46]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(46),
      O => ifmap_2_IBUF(46)
    );
\ifmap_2_IBUF[47]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(47),
      O => ifmap_2_IBUF(47)
    );
\ifmap_2_IBUF[48]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(48),
      O => ifmap_2_IBUF(48)
    );
\ifmap_2_IBUF[49]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(49),
      O => ifmap_2_IBUF(49)
    );
\ifmap_2_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(4),
      O => ifmap_2_IBUF(4)
    );
\ifmap_2_IBUF[50]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(50),
      O => ifmap_2_IBUF(50)
    );
\ifmap_2_IBUF[51]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(51),
      O => ifmap_2_IBUF(51)
    );
\ifmap_2_IBUF[52]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(52),
      O => ifmap_2_IBUF(52)
    );
\ifmap_2_IBUF[53]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(53),
      O => ifmap_2_IBUF(53)
    );
\ifmap_2_IBUF[54]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(54),
      O => ifmap_2_IBUF(54)
    );
\ifmap_2_IBUF[55]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(55),
      O => ifmap_2_IBUF(55)
    );
\ifmap_2_IBUF[56]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(56),
      O => ifmap_2_IBUF(56)
    );
\ifmap_2_IBUF[57]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(57),
      O => ifmap_2_IBUF(57)
    );
\ifmap_2_IBUF[58]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(58),
      O => ifmap_2_IBUF(58)
    );
\ifmap_2_IBUF[59]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(59),
      O => ifmap_2_IBUF(59)
    );
\ifmap_2_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(5),
      O => ifmap_2_IBUF(5)
    );
\ifmap_2_IBUF[60]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(60),
      O => ifmap_2_IBUF(60)
    );
\ifmap_2_IBUF[61]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(61),
      O => ifmap_2_IBUF(61)
    );
\ifmap_2_IBUF[62]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(62),
      O => ifmap_2_IBUF(62)
    );
\ifmap_2_IBUF[63]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(63),
      O => ifmap_2_IBUF(63)
    );
\ifmap_2_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(6),
      O => ifmap_2_IBUF(6)
    );
\ifmap_2_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(7),
      O => ifmap_2_IBUF(7)
    );
\ifmap_2_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(8),
      O => ifmap_2_IBUF(8)
    );
\ifmap_2_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_2(9),
      O => ifmap_2_IBUF(9)
    );
\ifmap_3_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(0),
      O => ifmap_3_IBUF(0)
    );
\ifmap_3_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(10),
      O => ifmap_3_IBUF(10)
    );
\ifmap_3_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(11),
      O => ifmap_3_IBUF(11)
    );
\ifmap_3_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(12),
      O => ifmap_3_IBUF(12)
    );
\ifmap_3_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(13),
      O => ifmap_3_IBUF(13)
    );
\ifmap_3_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(14),
      O => ifmap_3_IBUF(14)
    );
\ifmap_3_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(15),
      O => ifmap_3_IBUF(15)
    );
\ifmap_3_IBUF[16]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(16),
      O => ifmap_3_IBUF(16)
    );
\ifmap_3_IBUF[17]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(17),
      O => ifmap_3_IBUF(17)
    );
\ifmap_3_IBUF[18]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(18),
      O => ifmap_3_IBUF(18)
    );
\ifmap_3_IBUF[19]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(19),
      O => ifmap_3_IBUF(19)
    );
\ifmap_3_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(1),
      O => ifmap_3_IBUF(1)
    );
\ifmap_3_IBUF[20]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(20),
      O => ifmap_3_IBUF(20)
    );
\ifmap_3_IBUF[21]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(21),
      O => ifmap_3_IBUF(21)
    );
\ifmap_3_IBUF[22]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(22),
      O => ifmap_3_IBUF(22)
    );
\ifmap_3_IBUF[23]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(23),
      O => ifmap_3_IBUF(23)
    );
\ifmap_3_IBUF[24]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(24),
      O => ifmap_3_IBUF(24)
    );
\ifmap_3_IBUF[25]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(25),
      O => ifmap_3_IBUF(25)
    );
\ifmap_3_IBUF[26]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(26),
      O => ifmap_3_IBUF(26)
    );
\ifmap_3_IBUF[27]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(27),
      O => ifmap_3_IBUF(27)
    );
\ifmap_3_IBUF[28]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(28),
      O => ifmap_3_IBUF(28)
    );
\ifmap_3_IBUF[29]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(29),
      O => ifmap_3_IBUF(29)
    );
\ifmap_3_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(2),
      O => ifmap_3_IBUF(2)
    );
\ifmap_3_IBUF[30]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(30),
      O => ifmap_3_IBUF(30)
    );
\ifmap_3_IBUF[31]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(31),
      O => ifmap_3_IBUF(31)
    );
\ifmap_3_IBUF[32]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(32),
      O => ifmap_3_IBUF(32)
    );
\ifmap_3_IBUF[33]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(33),
      O => ifmap_3_IBUF(33)
    );
\ifmap_3_IBUF[34]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(34),
      O => ifmap_3_IBUF(34)
    );
\ifmap_3_IBUF[35]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(35),
      O => ifmap_3_IBUF(35)
    );
\ifmap_3_IBUF[36]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(36),
      O => ifmap_3_IBUF(36)
    );
\ifmap_3_IBUF[37]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(37),
      O => ifmap_3_IBUF(37)
    );
\ifmap_3_IBUF[38]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(38),
      O => ifmap_3_IBUF(38)
    );
\ifmap_3_IBUF[39]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(39),
      O => ifmap_3_IBUF(39)
    );
\ifmap_3_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(3),
      O => ifmap_3_IBUF(3)
    );
\ifmap_3_IBUF[40]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(40),
      O => ifmap_3_IBUF(40)
    );
\ifmap_3_IBUF[41]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(41),
      O => ifmap_3_IBUF(41)
    );
\ifmap_3_IBUF[42]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(42),
      O => ifmap_3_IBUF(42)
    );
\ifmap_3_IBUF[43]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(43),
      O => ifmap_3_IBUF(43)
    );
\ifmap_3_IBUF[44]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(44),
      O => ifmap_3_IBUF(44)
    );
\ifmap_3_IBUF[45]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(45),
      O => ifmap_3_IBUF(45)
    );
\ifmap_3_IBUF[46]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(46),
      O => ifmap_3_IBUF(46)
    );
\ifmap_3_IBUF[47]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(47),
      O => ifmap_3_IBUF(47)
    );
\ifmap_3_IBUF[48]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(48),
      O => ifmap_3_IBUF(48)
    );
\ifmap_3_IBUF[49]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(49),
      O => ifmap_3_IBUF(49)
    );
\ifmap_3_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(4),
      O => ifmap_3_IBUF(4)
    );
\ifmap_3_IBUF[50]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(50),
      O => ifmap_3_IBUF(50)
    );
\ifmap_3_IBUF[51]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(51),
      O => ifmap_3_IBUF(51)
    );
\ifmap_3_IBUF[52]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(52),
      O => ifmap_3_IBUF(52)
    );
\ifmap_3_IBUF[53]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(53),
      O => ifmap_3_IBUF(53)
    );
\ifmap_3_IBUF[54]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(54),
      O => ifmap_3_IBUF(54)
    );
\ifmap_3_IBUF[55]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(55),
      O => ifmap_3_IBUF(55)
    );
\ifmap_3_IBUF[56]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(56),
      O => ifmap_3_IBUF(56)
    );
\ifmap_3_IBUF[57]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(57),
      O => ifmap_3_IBUF(57)
    );
\ifmap_3_IBUF[58]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(58),
      O => ifmap_3_IBUF(58)
    );
\ifmap_3_IBUF[59]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(59),
      O => ifmap_3_IBUF(59)
    );
\ifmap_3_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(5),
      O => ifmap_3_IBUF(5)
    );
\ifmap_3_IBUF[60]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(60),
      O => ifmap_3_IBUF(60)
    );
\ifmap_3_IBUF[61]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(61),
      O => ifmap_3_IBUF(61)
    );
\ifmap_3_IBUF[62]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(62),
      O => ifmap_3_IBUF(62)
    );
\ifmap_3_IBUF[63]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(63),
      O => ifmap_3_IBUF(63)
    );
\ifmap_3_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(6),
      O => ifmap_3_IBUF(6)
    );
\ifmap_3_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(7),
      O => ifmap_3_IBUF(7)
    );
\ifmap_3_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(8),
      O => ifmap_3_IBUF(8)
    );
\ifmap_3_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_3(9),
      O => ifmap_3_IBUF(9)
    );
\ifmap_4_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(0),
      O => ifmap_4_IBUF(0)
    );
\ifmap_4_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(10),
      O => ifmap_4_IBUF(10)
    );
\ifmap_4_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(11),
      O => ifmap_4_IBUF(11)
    );
\ifmap_4_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(12),
      O => ifmap_4_IBUF(12)
    );
\ifmap_4_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(13),
      O => ifmap_4_IBUF(13)
    );
\ifmap_4_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(14),
      O => ifmap_4_IBUF(14)
    );
\ifmap_4_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(15),
      O => ifmap_4_IBUF(15)
    );
\ifmap_4_IBUF[16]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(16),
      O => ifmap_4_IBUF(16)
    );
\ifmap_4_IBUF[17]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(17),
      O => ifmap_4_IBUF(17)
    );
\ifmap_4_IBUF[18]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(18),
      O => ifmap_4_IBUF(18)
    );
\ifmap_4_IBUF[19]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(19),
      O => ifmap_4_IBUF(19)
    );
\ifmap_4_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(1),
      O => ifmap_4_IBUF(1)
    );
\ifmap_4_IBUF[20]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(20),
      O => ifmap_4_IBUF(20)
    );
\ifmap_4_IBUF[21]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(21),
      O => ifmap_4_IBUF(21)
    );
\ifmap_4_IBUF[22]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(22),
      O => ifmap_4_IBUF(22)
    );
\ifmap_4_IBUF[23]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(23),
      O => ifmap_4_IBUF(23)
    );
\ifmap_4_IBUF[24]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(24),
      O => ifmap_4_IBUF(24)
    );
\ifmap_4_IBUF[25]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(25),
      O => ifmap_4_IBUF(25)
    );
\ifmap_4_IBUF[26]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(26),
      O => ifmap_4_IBUF(26)
    );
\ifmap_4_IBUF[27]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(27),
      O => ifmap_4_IBUF(27)
    );
\ifmap_4_IBUF[28]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(28),
      O => ifmap_4_IBUF(28)
    );
\ifmap_4_IBUF[29]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(29),
      O => ifmap_4_IBUF(29)
    );
\ifmap_4_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(2),
      O => ifmap_4_IBUF(2)
    );
\ifmap_4_IBUF[30]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(30),
      O => ifmap_4_IBUF(30)
    );
\ifmap_4_IBUF[31]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(31),
      O => ifmap_4_IBUF(31)
    );
\ifmap_4_IBUF[32]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(32),
      O => ifmap_4_IBUF(32)
    );
\ifmap_4_IBUF[33]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(33),
      O => ifmap_4_IBUF(33)
    );
\ifmap_4_IBUF[34]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(34),
      O => ifmap_4_IBUF(34)
    );
\ifmap_4_IBUF[35]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(35),
      O => ifmap_4_IBUF(35)
    );
\ifmap_4_IBUF[36]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(36),
      O => ifmap_4_IBUF(36)
    );
\ifmap_4_IBUF[37]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(37),
      O => ifmap_4_IBUF(37)
    );
\ifmap_4_IBUF[38]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(38),
      O => ifmap_4_IBUF(38)
    );
\ifmap_4_IBUF[39]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(39),
      O => ifmap_4_IBUF(39)
    );
\ifmap_4_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(3),
      O => ifmap_4_IBUF(3)
    );
\ifmap_4_IBUF[40]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(40),
      O => ifmap_4_IBUF(40)
    );
\ifmap_4_IBUF[41]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(41),
      O => ifmap_4_IBUF(41)
    );
\ifmap_4_IBUF[42]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(42),
      O => ifmap_4_IBUF(42)
    );
\ifmap_4_IBUF[43]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(43),
      O => ifmap_4_IBUF(43)
    );
\ifmap_4_IBUF[44]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(44),
      O => ifmap_4_IBUF(44)
    );
\ifmap_4_IBUF[45]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(45),
      O => ifmap_4_IBUF(45)
    );
\ifmap_4_IBUF[46]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(46),
      O => ifmap_4_IBUF(46)
    );
\ifmap_4_IBUF[47]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(47),
      O => ifmap_4_IBUF(47)
    );
\ifmap_4_IBUF[48]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(48),
      O => ifmap_4_IBUF(48)
    );
\ifmap_4_IBUF[49]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(49),
      O => ifmap_4_IBUF(49)
    );
\ifmap_4_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(4),
      O => ifmap_4_IBUF(4)
    );
\ifmap_4_IBUF[50]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(50),
      O => ifmap_4_IBUF(50)
    );
\ifmap_4_IBUF[51]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(51),
      O => ifmap_4_IBUF(51)
    );
\ifmap_4_IBUF[52]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(52),
      O => ifmap_4_IBUF(52)
    );
\ifmap_4_IBUF[53]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(53),
      O => ifmap_4_IBUF(53)
    );
\ifmap_4_IBUF[54]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(54),
      O => ifmap_4_IBUF(54)
    );
\ifmap_4_IBUF[55]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(55),
      O => ifmap_4_IBUF(55)
    );
\ifmap_4_IBUF[56]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(56),
      O => ifmap_4_IBUF(56)
    );
\ifmap_4_IBUF[57]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(57),
      O => ifmap_4_IBUF(57)
    );
\ifmap_4_IBUF[58]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(58),
      O => ifmap_4_IBUF(58)
    );
\ifmap_4_IBUF[59]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(59),
      O => ifmap_4_IBUF(59)
    );
\ifmap_4_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(5),
      O => ifmap_4_IBUF(5)
    );
\ifmap_4_IBUF[60]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(60),
      O => ifmap_4_IBUF(60)
    );
\ifmap_4_IBUF[61]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(61),
      O => ifmap_4_IBUF(61)
    );
\ifmap_4_IBUF[62]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(62),
      O => ifmap_4_IBUF(62)
    );
\ifmap_4_IBUF[63]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(63),
      O => ifmap_4_IBUF(63)
    );
\ifmap_4_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(6),
      O => ifmap_4_IBUF(6)
    );
\ifmap_4_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(7),
      O => ifmap_4_IBUF(7)
    );
\ifmap_4_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(8),
      O => ifmap_4_IBUF(8)
    );
\ifmap_4_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ifmap_4(9),
      O => ifmap_4_IBUF(9)
    );
rst_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => rst,
      O => rst_IBUF
    );
start_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => start,
      O => start_IBUF
    );
start_acc_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => start_acc_OBUF,
      O => start_acc
    );
valid_in_f_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => valid_in_f,
      O => valid_in_f_IBUF
    );
end STRUCTURE;
