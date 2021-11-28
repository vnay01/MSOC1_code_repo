-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
-- Date        : Mon Oct 15 13:54:32 2018
-- Host        : pax-15 running 64-bit major release  (build 9200)
-- Command     : write_vhdl accumulator
-- Design      : Acc
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Acc is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    start : in STD_LOGIC;
    Psum1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Psum2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Psum3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Psum4 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    ofmap : out STD_LOGIC_VECTOR ( 3 downto 0 );
    valid_ofmap : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Acc : entity is true;
  attribute bias : string;
  attribute bias of Acc : entity is "4'b0000";
end Acc;

architecture STRUCTURE of Acc is
  signal Psum1_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal Psum1_calc : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal Psum2_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal Psum2_calc : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal Psum3_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal Psum3_calc : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal Psum4_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal Psum4_calc : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal curr_state : STD_LOGIC;
  signal ofmap_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \ofmap_OBUF[3]_inst_i_10_n_0\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_11_n_0\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_12_n_0\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_13_n_0\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_14_n_0\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_15_n_0\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_16_n_0\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_17_n_0\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_18_n_0\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_19_n_0\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_20_n_0\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_21_n_0\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_22_n_0\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_2_n_3\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_3_n_3\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_4_n_0\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_4_n_1\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_4_n_2\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_4_n_3\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_6_n_0\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_6_n_1\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_6_n_2\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_6_n_3\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_7_n_0\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_8_n_0\ : STD_LOGIC;
  signal \ofmap_OBUF[3]_inst_i_9_n_0\ : STD_LOGIC;
  signal \ofmap_calc[0]_i_1_n_0\ : STD_LOGIC;
  signal \ofmap_calc[11]_i_1_n_0\ : STD_LOGIC;
  signal \ofmap_calc[11]_i_3_n_0\ : STD_LOGIC;
  signal \ofmap_calc[11]_i_4_n_0\ : STD_LOGIC;
  signal \ofmap_calc[11]_i_5_n_0\ : STD_LOGIC;
  signal \ofmap_calc[11]_i_6_n_0\ : STD_LOGIC;
  signal \ofmap_calc[11]_i_8_n_0\ : STD_LOGIC;
  signal \ofmap_calc[11]_i_9_n_0\ : STD_LOGIC;
  signal \ofmap_calc[1]_i_1_n_0\ : STD_LOGIC;
  signal \ofmap_calc[2]_i_1_n_0\ : STD_LOGIC;
  signal \ofmap_calc[3]_i_10_n_0\ : STD_LOGIC;
  signal \ofmap_calc[3]_i_11_n_0\ : STD_LOGIC;
  signal \ofmap_calc[3]_i_13_n_0\ : STD_LOGIC;
  signal \ofmap_calc[3]_i_14_n_0\ : STD_LOGIC;
  signal \ofmap_calc[3]_i_15_n_0\ : STD_LOGIC;
  signal \ofmap_calc[3]_i_16_n_0\ : STD_LOGIC;
  signal \ofmap_calc[3]_i_1_n_0\ : STD_LOGIC;
  signal \ofmap_calc[3]_i_3_n_0\ : STD_LOGIC;
  signal \ofmap_calc[3]_i_4_n_0\ : STD_LOGIC;
  signal \ofmap_calc[3]_i_5_n_0\ : STD_LOGIC;
  signal \ofmap_calc[3]_i_6_n_0\ : STD_LOGIC;
  signal \ofmap_calc[3]_i_8_n_0\ : STD_LOGIC;
  signal \ofmap_calc[3]_i_9_n_0\ : STD_LOGIC;
  signal \ofmap_calc[4]_i_1_n_0\ : STD_LOGIC;
  signal \ofmap_calc[5]_i_1_n_0\ : STD_LOGIC;
  signal \ofmap_calc[6]_i_1_n_0\ : STD_LOGIC;
  signal \ofmap_calc[7]_i_10_n_0\ : STD_LOGIC;
  signal \ofmap_calc[7]_i_11_n_0\ : STD_LOGIC;
  signal \ofmap_calc[7]_i_13_n_0\ : STD_LOGIC;
  signal \ofmap_calc[7]_i_14_n_0\ : STD_LOGIC;
  signal \ofmap_calc[7]_i_15_n_0\ : STD_LOGIC;
  signal \ofmap_calc[7]_i_16_n_0\ : STD_LOGIC;
  signal \ofmap_calc[7]_i_17_n_0\ : STD_LOGIC;
  signal \ofmap_calc[7]_i_1_n_0\ : STD_LOGIC;
  signal \ofmap_calc[7]_i_3_n_0\ : STD_LOGIC;
  signal \ofmap_calc[7]_i_4_n_0\ : STD_LOGIC;
  signal \ofmap_calc[7]_i_5_n_0\ : STD_LOGIC;
  signal \ofmap_calc[7]_i_6_n_0\ : STD_LOGIC;
  signal \ofmap_calc[7]_i_8_n_0\ : STD_LOGIC;
  signal \ofmap_calc[7]_i_9_n_0\ : STD_LOGIC;
  signal \ofmap_calc[8]_i_1_n_0\ : STD_LOGIC;
  signal \ofmap_calc[9]_i_1_n_0\ : STD_LOGIC;
  signal \ofmap_calc_reg[11]_i_10_n_3\ : STD_LOGIC;
  signal \ofmap_calc_reg[11]_i_2_n_1\ : STD_LOGIC;
  signal \ofmap_calc_reg[11]_i_2_n_3\ : STD_LOGIC;
  signal \ofmap_calc_reg[11]_i_7_n_2\ : STD_LOGIC;
  signal \ofmap_calc_reg[3]_i_12_n_0\ : STD_LOGIC;
  signal \ofmap_calc_reg[3]_i_12_n_1\ : STD_LOGIC;
  signal \ofmap_calc_reg[3]_i_12_n_2\ : STD_LOGIC;
  signal \ofmap_calc_reg[3]_i_12_n_3\ : STD_LOGIC;
  signal \ofmap_calc_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \ofmap_calc_reg[3]_i_2_n_1\ : STD_LOGIC;
  signal \ofmap_calc_reg[3]_i_2_n_2\ : STD_LOGIC;
  signal \ofmap_calc_reg[3]_i_2_n_3\ : STD_LOGIC;
  signal \ofmap_calc_reg[3]_i_7_n_0\ : STD_LOGIC;
  signal \ofmap_calc_reg[3]_i_7_n_1\ : STD_LOGIC;
  signal \ofmap_calc_reg[3]_i_7_n_2\ : STD_LOGIC;
  signal \ofmap_calc_reg[3]_i_7_n_3\ : STD_LOGIC;
  signal \ofmap_calc_reg[7]_i_12_n_0\ : STD_LOGIC;
  signal \ofmap_calc_reg[7]_i_12_n_1\ : STD_LOGIC;
  signal \ofmap_calc_reg[7]_i_12_n_2\ : STD_LOGIC;
  signal \ofmap_calc_reg[7]_i_12_n_3\ : STD_LOGIC;
  signal \ofmap_calc_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \ofmap_calc_reg[7]_i_2_n_1\ : STD_LOGIC;
  signal \ofmap_calc_reg[7]_i_2_n_2\ : STD_LOGIC;
  signal \ofmap_calc_reg[7]_i_2_n_3\ : STD_LOGIC;
  signal \ofmap_calc_reg[7]_i_7_n_0\ : STD_LOGIC;
  signal \ofmap_calc_reg[7]_i_7_n_1\ : STD_LOGIC;
  signal \ofmap_calc_reg[7]_i_7_n_2\ : STD_LOGIC;
  signal \ofmap_calc_reg[7]_i_7_n_3\ : STD_LOGIC;
  signal \ofmap_calc_reg_n_0_[0]\ : STD_LOGIC;
  signal \ofmap_calc_reg_n_0_[11]\ : STD_LOGIC;
  signal \ofmap_calc_reg_n_0_[1]\ : STD_LOGIC;
  signal \ofmap_calc_reg_n_0_[2]\ : STD_LOGIC;
  signal \ofmap_calc_reg_n_0_[3]\ : STD_LOGIC;
  signal \ofmap_calc_reg_n_0_[4]\ : STD_LOGIC;
  signal \ofmap_calc_reg_n_0_[5]\ : STD_LOGIC;
  signal \ofmap_calc_reg_n_0_[6]\ : STD_LOGIC;
  signal \ofmap_calc_reg_n_0_[7]\ : STD_LOGIC;
  signal \ofmap_calc_reg_n_0_[8]\ : STD_LOGIC;
  signal \ofmap_calc_reg_n_0_[9]\ : STD_LOGIC;
  signal res_ad_10 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal res_ad_20 : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal res_ad_30 : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal rst_IBUF : STD_LOGIC;
  signal start_IBUF : STD_LOGIC;
  signal valid_ofmap_OBUF : STD_LOGIC;
  signal \NLW_ofmap_OBUF[3]_inst_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_ofmap_OBUF[3]_inst_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_ofmap_OBUF[3]_inst_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_ofmap_OBUF[3]_inst_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_ofmap_OBUF[3]_inst_i_4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_ofmap_OBUF[3]_inst_i_6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_ofmap_calc_reg[11]_i_10_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_ofmap_calc_reg[11]_i_10_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_ofmap_calc_reg[11]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_ofmap_calc_reg[11]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_ofmap_calc_reg[11]_i_7_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_ofmap_calc_reg[11]_i_7_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ofmap_OBUF[0]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ofmap_OBUF[1]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ofmap_OBUF[2]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ofmap_OBUF[3]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ofmap_calc[11]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \ofmap_calc[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \ofmap_calc[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \ofmap_calc[3]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \ofmap_calc[4]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \ofmap_calc[5]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \ofmap_calc[6]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \ofmap_calc[7]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \ofmap_calc[8]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \ofmap_calc[9]_i_1\ : label is "soft_lutpair2";
begin
\Psum1_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum1(0),
      O => Psum1_IBUF(0)
    );
\Psum1_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum1(1),
      O => Psum1_IBUF(1)
    );
\Psum1_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum1(2),
      O => Psum1_IBUF(2)
    );
\Psum1_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum1(3),
      O => Psum1_IBUF(3)
    );
\Psum1_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum1(4),
      O => Psum1_IBUF(4)
    );
\Psum1_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum1(5),
      O => Psum1_IBUF(5)
    );
\Psum1_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum1(6),
      O => Psum1_IBUF(6)
    );
\Psum1_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum1(7),
      O => Psum1_IBUF(7)
    );
\Psum1_calc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum1_IBUF(0),
      Q => Psum1_calc(0)
    );
\Psum1_calc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum1_IBUF(1),
      Q => Psum1_calc(1)
    );
\Psum1_calc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum1_IBUF(2),
      Q => Psum1_calc(2)
    );
\Psum1_calc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum1_IBUF(3),
      Q => Psum1_calc(3)
    );
\Psum1_calc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum1_IBUF(4),
      Q => Psum1_calc(4)
    );
\Psum1_calc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum1_IBUF(5),
      Q => Psum1_calc(5)
    );
\Psum1_calc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum1_IBUF(6),
      Q => Psum1_calc(6)
    );
\Psum1_calc_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum1_IBUF(7),
      Q => Psum1_calc(7)
    );
\Psum2_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum2(0),
      O => Psum2_IBUF(0)
    );
\Psum2_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum2(1),
      O => Psum2_IBUF(1)
    );
\Psum2_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum2(2),
      O => Psum2_IBUF(2)
    );
\Psum2_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum2(3),
      O => Psum2_IBUF(3)
    );
\Psum2_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum2(4),
      O => Psum2_IBUF(4)
    );
\Psum2_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum2(5),
      O => Psum2_IBUF(5)
    );
\Psum2_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum2(6),
      O => Psum2_IBUF(6)
    );
\Psum2_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum2(7),
      O => Psum2_IBUF(7)
    );
\Psum2_calc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum2_IBUF(0),
      Q => Psum2_calc(0)
    );
\Psum2_calc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum2_IBUF(1),
      Q => Psum2_calc(1)
    );
\Psum2_calc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum2_IBUF(2),
      Q => Psum2_calc(2)
    );
\Psum2_calc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum2_IBUF(3),
      Q => Psum2_calc(3)
    );
\Psum2_calc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum2_IBUF(4),
      Q => Psum2_calc(4)
    );
\Psum2_calc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum2_IBUF(5),
      Q => Psum2_calc(5)
    );
\Psum2_calc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum2_IBUF(6),
      Q => Psum2_calc(6)
    );
\Psum2_calc_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum2_IBUF(7),
      Q => Psum2_calc(7)
    );
\Psum3_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum3(0),
      O => Psum3_IBUF(0)
    );
\Psum3_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum3(1),
      O => Psum3_IBUF(1)
    );
\Psum3_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum3(2),
      O => Psum3_IBUF(2)
    );
\Psum3_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum3(3),
      O => Psum3_IBUF(3)
    );
\Psum3_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum3(4),
      O => Psum3_IBUF(4)
    );
\Psum3_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum3(5),
      O => Psum3_IBUF(5)
    );
\Psum3_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum3(6),
      O => Psum3_IBUF(6)
    );
\Psum3_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum3(7),
      O => Psum3_IBUF(7)
    );
\Psum3_calc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum3_IBUF(0),
      Q => Psum3_calc(0)
    );
\Psum3_calc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum3_IBUF(1),
      Q => Psum3_calc(1)
    );
\Psum3_calc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum3_IBUF(2),
      Q => Psum3_calc(2)
    );
\Psum3_calc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum3_IBUF(3),
      Q => Psum3_calc(3)
    );
\Psum3_calc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum3_IBUF(4),
      Q => Psum3_calc(4)
    );
\Psum3_calc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum3_IBUF(5),
      Q => Psum3_calc(5)
    );
\Psum3_calc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum3_IBUF(6),
      Q => Psum3_calc(6)
    );
\Psum3_calc_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum3_IBUF(7),
      Q => Psum3_calc(7)
    );
\Psum4_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum4(0),
      O => Psum4_IBUF(0)
    );
\Psum4_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum4(1),
      O => Psum4_IBUF(1)
    );
\Psum4_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum4(2),
      O => Psum4_IBUF(2)
    );
\Psum4_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum4(3),
      O => Psum4_IBUF(3)
    );
\Psum4_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum4(4),
      O => Psum4_IBUF(4)
    );
\Psum4_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum4(5),
      O => Psum4_IBUF(5)
    );
\Psum4_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum4(6),
      O => Psum4_IBUF(6)
    );
\Psum4_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => Psum4(7),
      O => Psum4_IBUF(7)
    );
\Psum4_calc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum4_IBUF(0),
      Q => Psum4_calc(0)
    );
\Psum4_calc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum4_IBUF(1),
      Q => Psum4_calc(1)
    );
\Psum4_calc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum4_IBUF(2),
      Q => Psum4_calc(2)
    );
\Psum4_calc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum4_IBUF(3),
      Q => Psum4_calc(3)
    );
\Psum4_calc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum4_IBUF(4),
      Q => Psum4_calc(4)
    );
\Psum4_calc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum4_IBUF(5),
      Q => Psum4_calc(5)
    );
\Psum4_calc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum4_IBUF(6),
      Q => Psum4_calc(6)
    );
\Psum4_calc_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => Psum4_IBUF(7),
      Q => Psum4_calc(7)
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
curr_state_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => start_IBUF,
      Q => curr_state
    );
\ofmap_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ofmap_OBUF(0),
      O => ofmap(0)
    );
\ofmap_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => \ofmap_OBUF[3]_inst_i_3_n_3\,
      I1 => \ofmap_calc_reg_n_0_[0]\,
      I2 => \ofmap_OBUF[3]_inst_i_2_n_3\,
      O => ofmap_OBUF(0)
    );
\ofmap_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ofmap_OBUF(1),
      O => ofmap(1)
    );
\ofmap_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => \ofmap_OBUF[3]_inst_i_3_n_3\,
      I1 => \ofmap_calc_reg_n_0_[1]\,
      I2 => \ofmap_OBUF[3]_inst_i_2_n_3\,
      O => ofmap_OBUF(1)
    );
\ofmap_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ofmap_OBUF(2),
      O => ofmap(2)
    );
\ofmap_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => \ofmap_OBUF[3]_inst_i_3_n_3\,
      I1 => \ofmap_calc_reg_n_0_[2]\,
      I2 => \ofmap_OBUF[3]_inst_i_2_n_3\,
      O => ofmap_OBUF(2)
    );
\ofmap_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ofmap_OBUF(3),
      O => ofmap(3)
    );
\ofmap_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AE"
    )
        port map (
      I0 => \ofmap_OBUF[3]_inst_i_2_n_3\,
      I1 => \ofmap_calc_reg_n_0_[11]\,
      I2 => \ofmap_OBUF[3]_inst_i_3_n_3\,
      O => ofmap_OBUF(3)
    );
\ofmap_OBUF[3]_inst_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \ofmap_calc_reg_n_0_[4]\,
      I1 => \ofmap_calc_reg_n_0_[5]\,
      O => \ofmap_OBUF[3]_inst_i_10_n_0\
    );
\ofmap_OBUF[3]_inst_i_11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \ofmap_calc_reg_n_0_[3]\,
      O => \ofmap_OBUF[3]_inst_i_11_n_0\
    );
\ofmap_OBUF[3]_inst_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \ofmap_calc_reg_n_0_[8]\,
      I1 => \ofmap_calc_reg_n_0_[9]\,
      O => \ofmap_OBUF[3]_inst_i_12_n_0\
    );
\ofmap_OBUF[3]_inst_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \ofmap_calc_reg_n_0_[6]\,
      I1 => \ofmap_calc_reg_n_0_[7]\,
      O => \ofmap_OBUF[3]_inst_i_13_n_0\
    );
\ofmap_OBUF[3]_inst_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \ofmap_calc_reg_n_0_[4]\,
      I1 => \ofmap_calc_reg_n_0_[5]\,
      O => \ofmap_OBUF[3]_inst_i_14_n_0\
    );
\ofmap_OBUF[3]_inst_i_15\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \ofmap_calc_reg_n_0_[3]\,
      I1 => \ofmap_calc_reg_n_0_[2]\,
      O => \ofmap_OBUF[3]_inst_i_15_n_0\
    );
\ofmap_OBUF[3]_inst_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \ofmap_calc_reg_n_0_[8]\,
      I1 => \ofmap_calc_reg_n_0_[9]\,
      O => \ofmap_OBUF[3]_inst_i_16_n_0\
    );
\ofmap_OBUF[3]_inst_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \ofmap_calc_reg_n_0_[6]\,
      I1 => \ofmap_calc_reg_n_0_[7]\,
      O => \ofmap_OBUF[3]_inst_i_17_n_0\
    );
\ofmap_OBUF[3]_inst_i_18\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \ofmap_calc_reg_n_0_[4]\,
      I1 => \ofmap_calc_reg_n_0_[5]\,
      O => \ofmap_OBUF[3]_inst_i_18_n_0\
    );
\ofmap_OBUF[3]_inst_i_19\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \ofmap_calc_reg_n_0_[8]\,
      I1 => \ofmap_calc_reg_n_0_[9]\,
      O => \ofmap_OBUF[3]_inst_i_19_n_0\
    );
\ofmap_OBUF[3]_inst_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \ofmap_OBUF[3]_inst_i_4_n_0\,
      CO(3 downto 1) => \NLW_ofmap_OBUF[3]_inst_i_2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \ofmap_OBUF[3]_inst_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_ofmap_OBUF[3]_inst_i_2_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => B"000",
      S(0) => \ofmap_calc_reg_n_0_[11]\
    );
\ofmap_OBUF[3]_inst_i_20\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \ofmap_calc_reg_n_0_[6]\,
      I1 => \ofmap_calc_reg_n_0_[7]\,
      O => \ofmap_OBUF[3]_inst_i_20_n_0\
    );
\ofmap_OBUF[3]_inst_i_21\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \ofmap_calc_reg_n_0_[4]\,
      I1 => \ofmap_calc_reg_n_0_[5]\,
      O => \ofmap_OBUF[3]_inst_i_21_n_0\
    );
\ofmap_OBUF[3]_inst_i_22\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \ofmap_calc_reg_n_0_[2]\,
      I1 => \ofmap_calc_reg_n_0_[3]\,
      O => \ofmap_OBUF[3]_inst_i_22_n_0\
    );
\ofmap_OBUF[3]_inst_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \ofmap_OBUF[3]_inst_i_6_n_0\,
      CO(3 downto 1) => \NLW_ofmap_OBUF[3]_inst_i_3_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \ofmap_OBUF[3]_inst_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_ofmap_OBUF[3]_inst_i_3_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => B"000",
      S(0) => \ofmap_OBUF[3]_inst_i_7_n_0\
    );
\ofmap_OBUF[3]_inst_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \ofmap_OBUF[3]_inst_i_4_n_0\,
      CO(2) => \ofmap_OBUF[3]_inst_i_4_n_1\,
      CO(1) => \ofmap_OBUF[3]_inst_i_4_n_2\,
      CO(0) => \ofmap_OBUF[3]_inst_i_4_n_3\,
      CYINIT => '0',
      DI(3) => \ofmap_OBUF[3]_inst_i_8_n_0\,
      DI(2) => \ofmap_OBUF[3]_inst_i_9_n_0\,
      DI(1) => \ofmap_OBUF[3]_inst_i_10_n_0\,
      DI(0) => \ofmap_OBUF[3]_inst_i_11_n_0\,
      O(3 downto 0) => \NLW_ofmap_OBUF[3]_inst_i_4_O_UNCONNECTED\(3 downto 0),
      S(3) => \ofmap_OBUF[3]_inst_i_12_n_0\,
      S(2) => \ofmap_OBUF[3]_inst_i_13_n_0\,
      S(1) => \ofmap_OBUF[3]_inst_i_14_n_0\,
      S(0) => \ofmap_OBUF[3]_inst_i_15_n_0\
    );
\ofmap_OBUF[3]_inst_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \ofmap_OBUF[3]_inst_i_6_n_0\,
      CO(2) => \ofmap_OBUF[3]_inst_i_6_n_1\,
      CO(1) => \ofmap_OBUF[3]_inst_i_6_n_2\,
      CO(0) => \ofmap_OBUF[3]_inst_i_6_n_3\,
      CYINIT => '0',
      DI(3) => \ofmap_OBUF[3]_inst_i_16_n_0\,
      DI(2) => \ofmap_OBUF[3]_inst_i_17_n_0\,
      DI(1) => \ofmap_OBUF[3]_inst_i_18_n_0\,
      DI(0) => \ofmap_calc_reg_n_0_[3]\,
      O(3 downto 0) => \NLW_ofmap_OBUF[3]_inst_i_6_O_UNCONNECTED\(3 downto 0),
      S(3) => \ofmap_OBUF[3]_inst_i_19_n_0\,
      S(2) => \ofmap_OBUF[3]_inst_i_20_n_0\,
      S(1) => \ofmap_OBUF[3]_inst_i_21_n_0\,
      S(0) => \ofmap_OBUF[3]_inst_i_22_n_0\
    );
\ofmap_OBUF[3]_inst_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \ofmap_calc_reg_n_0_[11]\,
      O => \ofmap_OBUF[3]_inst_i_7_n_0\
    );
\ofmap_OBUF[3]_inst_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \ofmap_calc_reg_n_0_[8]\,
      I1 => \ofmap_calc_reg_n_0_[9]\,
      O => \ofmap_OBUF[3]_inst_i_8_n_0\
    );
\ofmap_OBUF[3]_inst_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \ofmap_calc_reg_n_0_[6]\,
      I1 => \ofmap_calc_reg_n_0_[7]\,
      O => \ofmap_OBUF[3]_inst_i_9_n_0\
    );
\ofmap_calc[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => curr_state,
      I1 => res_ad_30(0),
      O => \ofmap_calc[0]_i_1_n_0\
    );
\ofmap_calc[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state,
      I1 => \ofmap_calc_reg[11]_i_2_n_1\,
      O => \ofmap_calc[11]_i_1_n_0\
    );
\ofmap_calc[11]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => curr_state,
      I1 => res_ad_20(8),
      O => \ofmap_calc[11]_i_3_n_0\
    );
\ofmap_calc[11]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Psum4_calc(7),
      O => \ofmap_calc[11]_i_4_n_0\
    );
\ofmap_calc[11]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6F"
    )
        port map (
      I0 => res_ad_20(8),
      I1 => \ofmap_calc_reg[11]_i_7_n_2\,
      I2 => curr_state,
      O => \ofmap_calc[11]_i_5_n_0\
    );
\ofmap_calc[11]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => Psum4_calc(7),
      I1 => res_ad_20(8),
      I2 => curr_state,
      O => \ofmap_calc[11]_i_6_n_0\
    );
\ofmap_calc[11]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Psum3_calc(7),
      O => \ofmap_calc[11]_i_8_n_0\
    );
\ofmap_calc[11]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => Psum3_calc(7),
      I1 => \ofmap_calc_reg[11]_i_10_n_3\,
      I2 => curr_state,
      O => \ofmap_calc[11]_i_9_n_0\
    );
\ofmap_calc[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => curr_state,
      I1 => res_ad_30(1),
      O => \ofmap_calc[1]_i_1_n_0\
    );
\ofmap_calc[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => curr_state,
      I1 => res_ad_30(2),
      O => \ofmap_calc[2]_i_1_n_0\
    );
\ofmap_calc[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => curr_state,
      I1 => res_ad_30(3),
      O => \ofmap_calc[3]_i_1_n_0\
    );
\ofmap_calc[3]_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => res_ad_10(1),
      I1 => curr_state,
      I2 => Psum3_calc(1),
      O => \ofmap_calc[3]_i_10_n_0\
    );
\ofmap_calc[3]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => res_ad_10(0),
      I1 => curr_state,
      I2 => Psum3_calc(0),
      O => \ofmap_calc[3]_i_11_n_0\
    );
\ofmap_calc[3]_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Psum1_calc(3),
      I1 => Psum2_calc(3),
      O => \ofmap_calc[3]_i_13_n_0\
    );
\ofmap_calc[3]_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Psum1_calc(2),
      I1 => Psum2_calc(2),
      O => \ofmap_calc[3]_i_14_n_0\
    );
\ofmap_calc[3]_i_15\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Psum1_calc(1),
      I1 => Psum2_calc(1),
      O => \ofmap_calc[3]_i_15_n_0\
    );
\ofmap_calc[3]_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Psum1_calc(0),
      I1 => Psum2_calc(0),
      O => \ofmap_calc[3]_i_16_n_0\
    );
\ofmap_calc[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => res_ad_20(3),
      I1 => curr_state,
      I2 => Psum4_calc(3),
      O => \ofmap_calc[3]_i_3_n_0\
    );
\ofmap_calc[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => res_ad_20(2),
      I1 => curr_state,
      I2 => Psum4_calc(2),
      O => \ofmap_calc[3]_i_4_n_0\
    );
\ofmap_calc[3]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => res_ad_20(1),
      I1 => curr_state,
      I2 => Psum4_calc(1),
      O => \ofmap_calc[3]_i_5_n_0\
    );
\ofmap_calc[3]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => res_ad_20(0),
      I1 => curr_state,
      I2 => Psum4_calc(0),
      O => \ofmap_calc[3]_i_6_n_0\
    );
\ofmap_calc[3]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => res_ad_10(3),
      I1 => curr_state,
      I2 => Psum3_calc(3),
      O => \ofmap_calc[3]_i_8_n_0\
    );
\ofmap_calc[3]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => res_ad_10(2),
      I1 => curr_state,
      I2 => Psum3_calc(2),
      O => \ofmap_calc[3]_i_9_n_0\
    );
\ofmap_calc[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => curr_state,
      I1 => res_ad_30(4),
      O => \ofmap_calc[4]_i_1_n_0\
    );
\ofmap_calc[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => curr_state,
      I1 => res_ad_30(5),
      O => \ofmap_calc[5]_i_1_n_0\
    );
\ofmap_calc[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => curr_state,
      I1 => res_ad_30(6),
      O => \ofmap_calc[6]_i_1_n_0\
    );
\ofmap_calc[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => curr_state,
      I1 => res_ad_30(7),
      O => \ofmap_calc[7]_i_1_n_0\
    );
\ofmap_calc[7]_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => res_ad_10(5),
      I1 => curr_state,
      I2 => Psum3_calc(5),
      O => \ofmap_calc[7]_i_10_n_0\
    );
\ofmap_calc[7]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => res_ad_10(4),
      I1 => curr_state,
      I2 => Psum3_calc(4),
      O => \ofmap_calc[7]_i_11_n_0\
    );
\ofmap_calc[7]_i_13\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Psum1_calc(7),
      O => \ofmap_calc[7]_i_13_n_0\
    );
\ofmap_calc[7]_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Psum1_calc(7),
      I1 => Psum2_calc(7),
      O => \ofmap_calc[7]_i_14_n_0\
    );
\ofmap_calc[7]_i_15\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Psum1_calc(6),
      I1 => Psum2_calc(6),
      O => \ofmap_calc[7]_i_15_n_0\
    );
\ofmap_calc[7]_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Psum1_calc(5),
      I1 => Psum2_calc(5),
      O => \ofmap_calc[7]_i_16_n_0\
    );
\ofmap_calc[7]_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Psum1_calc(4),
      I1 => Psum2_calc(4),
      O => \ofmap_calc[7]_i_17_n_0\
    );
\ofmap_calc[7]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => Psum4_calc(7),
      I1 => res_ad_20(7),
      I2 => curr_state,
      O => \ofmap_calc[7]_i_3_n_0\
    );
\ofmap_calc[7]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => res_ad_20(6),
      I1 => curr_state,
      I2 => Psum4_calc(6),
      O => \ofmap_calc[7]_i_4_n_0\
    );
\ofmap_calc[7]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => res_ad_20(5),
      I1 => curr_state,
      I2 => Psum4_calc(5),
      O => \ofmap_calc[7]_i_5_n_0\
    );
\ofmap_calc[7]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => res_ad_20(4),
      I1 => curr_state,
      I2 => Psum4_calc(4),
      O => \ofmap_calc[7]_i_6_n_0\
    );
\ofmap_calc[7]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => Psum3_calc(7),
      I1 => res_ad_10(7),
      I2 => curr_state,
      O => \ofmap_calc[7]_i_8_n_0\
    );
\ofmap_calc[7]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => res_ad_10(6),
      I1 => curr_state,
      I2 => Psum3_calc(6),
      O => \ofmap_calc[7]_i_9_n_0\
    );
\ofmap_calc[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => curr_state,
      I1 => res_ad_30(8),
      O => \ofmap_calc[8]_i_1_n_0\
    );
\ofmap_calc[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => curr_state,
      I1 => res_ad_30(9),
      O => \ofmap_calc[9]_i_1_n_0\
    );
\ofmap_calc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => curr_state,
      CLR => rst_IBUF,
      D => \ofmap_calc[0]_i_1_n_0\,
      Q => \ofmap_calc_reg_n_0_[0]\
    );
\ofmap_calc_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => curr_state,
      CLR => rst_IBUF,
      D => \ofmap_calc[11]_i_1_n_0\,
      Q => \ofmap_calc_reg_n_0_[11]\
    );
\ofmap_calc_reg[11]_i_10\: unisim.vcomponents.CARRY4
     port map (
      CI => \ofmap_calc_reg[7]_i_12_n_0\,
      CO(3 downto 1) => \NLW_ofmap_calc_reg[11]_i_10_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \ofmap_calc_reg[11]_i_10_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_ofmap_calc_reg[11]_i_10_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"0001"
    );
\ofmap_calc_reg[11]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \ofmap_calc_reg[7]_i_2_n_0\,
      CO(3) => \NLW_ofmap_calc_reg[11]_i_2_CO_UNCONNECTED\(3),
      CO(2) => \ofmap_calc_reg[11]_i_2_n_1\,
      CO(1) => \NLW_ofmap_calc_reg[11]_i_2_CO_UNCONNECTED\(1),
      CO(0) => \ofmap_calc_reg[11]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \ofmap_calc[11]_i_3_n_0\,
      DI(0) => \ofmap_calc[11]_i_4_n_0\,
      O(3 downto 2) => \NLW_ofmap_calc_reg[11]_i_2_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => res_ad_30(9 downto 8),
      S(3 downto 2) => B"01",
      S(1) => \ofmap_calc[11]_i_5_n_0\,
      S(0) => \ofmap_calc[11]_i_6_n_0\
    );
\ofmap_calc_reg[11]_i_7\: unisim.vcomponents.CARRY4
     port map (
      CI => \ofmap_calc_reg[7]_i_7_n_0\,
      CO(3 downto 2) => \NLW_ofmap_calc_reg[11]_i_7_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \ofmap_calc_reg[11]_i_7_n_2\,
      CO(0) => \NLW_ofmap_calc_reg[11]_i_7_CO_UNCONNECTED\(0),
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \ofmap_calc[11]_i_8_n_0\,
      O(3 downto 1) => \NLW_ofmap_calc_reg[11]_i_7_O_UNCONNECTED\(3 downto 1),
      O(0) => res_ad_20(8),
      S(3 downto 1) => B"001",
      S(0) => \ofmap_calc[11]_i_9_n_0\
    );
\ofmap_calc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => curr_state,
      CLR => rst_IBUF,
      D => \ofmap_calc[1]_i_1_n_0\,
      Q => \ofmap_calc_reg_n_0_[1]\
    );
\ofmap_calc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => curr_state,
      CLR => rst_IBUF,
      D => \ofmap_calc[2]_i_1_n_0\,
      Q => \ofmap_calc_reg_n_0_[2]\
    );
\ofmap_calc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => curr_state,
      CLR => rst_IBUF,
      D => \ofmap_calc[3]_i_1_n_0\,
      Q => \ofmap_calc_reg_n_0_[3]\
    );
\ofmap_calc_reg[3]_i_12\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \ofmap_calc_reg[3]_i_12_n_0\,
      CO(2) => \ofmap_calc_reg[3]_i_12_n_1\,
      CO(1) => \ofmap_calc_reg[3]_i_12_n_2\,
      CO(0) => \ofmap_calc_reg[3]_i_12_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => Psum1_calc(3 downto 0),
      O(3 downto 0) => res_ad_10(3 downto 0),
      S(3) => \ofmap_calc[3]_i_13_n_0\,
      S(2) => \ofmap_calc[3]_i_14_n_0\,
      S(1) => \ofmap_calc[3]_i_15_n_0\,
      S(0) => \ofmap_calc[3]_i_16_n_0\
    );
\ofmap_calc_reg[3]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \ofmap_calc_reg[3]_i_2_n_0\,
      CO(2) => \ofmap_calc_reg[3]_i_2_n_1\,
      CO(1) => \ofmap_calc_reg[3]_i_2_n_2\,
      CO(0) => \ofmap_calc_reg[3]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => Psum4_calc(3 downto 0),
      O(3 downto 0) => res_ad_30(3 downto 0),
      S(3) => \ofmap_calc[3]_i_3_n_0\,
      S(2) => \ofmap_calc[3]_i_4_n_0\,
      S(1) => \ofmap_calc[3]_i_5_n_0\,
      S(0) => \ofmap_calc[3]_i_6_n_0\
    );
\ofmap_calc_reg[3]_i_7\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \ofmap_calc_reg[3]_i_7_n_0\,
      CO(2) => \ofmap_calc_reg[3]_i_7_n_1\,
      CO(1) => \ofmap_calc_reg[3]_i_7_n_2\,
      CO(0) => \ofmap_calc_reg[3]_i_7_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => Psum3_calc(3 downto 0),
      O(3 downto 0) => res_ad_20(3 downto 0),
      S(3) => \ofmap_calc[3]_i_8_n_0\,
      S(2) => \ofmap_calc[3]_i_9_n_0\,
      S(1) => \ofmap_calc[3]_i_10_n_0\,
      S(0) => \ofmap_calc[3]_i_11_n_0\
    );
\ofmap_calc_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => curr_state,
      CLR => rst_IBUF,
      D => \ofmap_calc[4]_i_1_n_0\,
      Q => \ofmap_calc_reg_n_0_[4]\
    );
\ofmap_calc_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => curr_state,
      CLR => rst_IBUF,
      D => \ofmap_calc[5]_i_1_n_0\,
      Q => \ofmap_calc_reg_n_0_[5]\
    );
\ofmap_calc_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => curr_state,
      CLR => rst_IBUF,
      D => \ofmap_calc[6]_i_1_n_0\,
      Q => \ofmap_calc_reg_n_0_[6]\
    );
\ofmap_calc_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => curr_state,
      CLR => rst_IBUF,
      D => \ofmap_calc[7]_i_1_n_0\,
      Q => \ofmap_calc_reg_n_0_[7]\
    );
\ofmap_calc_reg[7]_i_12\: unisim.vcomponents.CARRY4
     port map (
      CI => \ofmap_calc_reg[3]_i_12_n_0\,
      CO(3) => \ofmap_calc_reg[7]_i_12_n_0\,
      CO(2) => \ofmap_calc_reg[7]_i_12_n_1\,
      CO(1) => \ofmap_calc_reg[7]_i_12_n_2\,
      CO(0) => \ofmap_calc_reg[7]_i_12_n_3\,
      CYINIT => '0',
      DI(3) => \ofmap_calc[7]_i_13_n_0\,
      DI(2 downto 0) => Psum1_calc(6 downto 4),
      O(3 downto 0) => res_ad_10(7 downto 4),
      S(3) => \ofmap_calc[7]_i_14_n_0\,
      S(2) => \ofmap_calc[7]_i_15_n_0\,
      S(1) => \ofmap_calc[7]_i_16_n_0\,
      S(0) => \ofmap_calc[7]_i_17_n_0\
    );
\ofmap_calc_reg[7]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \ofmap_calc_reg[3]_i_2_n_0\,
      CO(3) => \ofmap_calc_reg[7]_i_2_n_0\,
      CO(2) => \ofmap_calc_reg[7]_i_2_n_1\,
      CO(1) => \ofmap_calc_reg[7]_i_2_n_2\,
      CO(0) => \ofmap_calc_reg[7]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => Psum4_calc(7 downto 4),
      O(3 downto 0) => res_ad_30(7 downto 4),
      S(3) => \ofmap_calc[7]_i_3_n_0\,
      S(2) => \ofmap_calc[7]_i_4_n_0\,
      S(1) => \ofmap_calc[7]_i_5_n_0\,
      S(0) => \ofmap_calc[7]_i_6_n_0\
    );
\ofmap_calc_reg[7]_i_7\: unisim.vcomponents.CARRY4
     port map (
      CI => \ofmap_calc_reg[3]_i_7_n_0\,
      CO(3) => \ofmap_calc_reg[7]_i_7_n_0\,
      CO(2) => \ofmap_calc_reg[7]_i_7_n_1\,
      CO(1) => \ofmap_calc_reg[7]_i_7_n_2\,
      CO(0) => \ofmap_calc_reg[7]_i_7_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => Psum3_calc(7 downto 4),
      O(3 downto 0) => res_ad_20(7 downto 4),
      S(3) => \ofmap_calc[7]_i_8_n_0\,
      S(2) => \ofmap_calc[7]_i_9_n_0\,
      S(1) => \ofmap_calc[7]_i_10_n_0\,
      S(0) => \ofmap_calc[7]_i_11_n_0\
    );
\ofmap_calc_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => curr_state,
      CLR => rst_IBUF,
      D => \ofmap_calc[8]_i_1_n_0\,
      Q => \ofmap_calc_reg_n_0_[8]\
    );
\ofmap_calc_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => curr_state,
      CLR => rst_IBUF,
      D => \ofmap_calc[9]_i_1_n_0\,
      Q => \ofmap_calc_reg_n_0_[9]\
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
valid_ofmap_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => valid_ofmap_OBUF,
      O => valid_ofmap
    );
valid_ofmap_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => curr_state,
      Q => valid_ofmap_OBUF
    );
end STRUCTURE;
