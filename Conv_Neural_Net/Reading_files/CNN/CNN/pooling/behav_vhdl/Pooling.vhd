-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
-- Date        : Mon Oct 15 15:15:49 2018
-- Host        : pax-16 running 64-bit major release  (build 9200)
-- Command     : write_vhdl Pooling.vhd
-- Design      : Pooling_TOP
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity PC is
  port (
    valid_comp_1_out : out STD_LOGIC;
    pooling_out_OBUF : out STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    ofmap_RELU_IBUF : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \comp_11__5\ : in STD_LOGIC;
    valid_data_IBUF : in STD_LOGIC;
    valid_comp_2_out : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \max_calc_reg[3]_0\ : in STD_LOGIC;
    \max_calc_reg[2]_0\ : in STD_LOGIC;
    \max_calc_reg[1]_0\ : in STD_LOGIC;
    \max_calc_reg[0]_0\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 3 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end PC;

architecture STRUCTURE of PC is
  signal count : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \count[5]_i_2_n_0\ : STD_LOGIC;
  signal \count[7]_i_3_n_0\ : STD_LOGIC;
  signal \count[7]_i_4_n_0\ : STD_LOGIC;
  signal count_next : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal max_calc : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \max_calc[3]_i_1__2_n_0\ : STD_LOGIC;
  signal \max_calc[3]_i_3_n_0\ : STD_LOGIC;
  signal \max_calc[3]_i_5_n_0\ : STD_LOGIC;
  signal \max_calc[3]_i_6_n_0\ : STD_LOGIC;
  signal \^valid_comp_1_out\ : STD_LOGIC;
  signal \valid_max_i_1__2_n_0\ : STD_LOGIC;
  signal \valid_max_i_2__2_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count[5]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count[6]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count[7]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count[7]_i_4\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \max_calc[3]_i_5\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \valid_max_i_2__2\ : label is "soft_lutpair0";
begin
  valid_comp_1_out <= \^valid_comp_1_out\;
\count[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \count[7]_i_4_n_0\,
      I1 => count(0),
      O => count_next(0)
    );
\count[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \count[7]_i_4_n_0\,
      I1 => count(0),
      I2 => count(1),
      O => count_next(1)
    );
\count[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => \count[7]_i_4_n_0\,
      I1 => count(0),
      I2 => count(1),
      I3 => count(2),
      O => count_next(2)
    );
\count[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => \count[7]_i_4_n_0\,
      I1 => count(1),
      I2 => count(0),
      I3 => count(2),
      I4 => count(3),
      O => count_next(3)
    );
\count[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
        port map (
      I0 => \count[7]_i_4_n_0\,
      I1 => count(3),
      I2 => count(2),
      I3 => count(0),
      I4 => count(1),
      I5 => count(4),
      O => count_next(4)
    );
\count[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \count[7]_i_4_n_0\,
      I1 => \count[5]_i_2_n_0\,
      I2 => count(5),
      O => count_next(5)
    );
\count[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => count(4),
      I1 => count(3),
      I2 => count(2),
      I3 => count(0),
      I4 => count(1),
      O => \count[5]_i_2_n_0\
    );
\count[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"84"
    )
        port map (
      I0 => \count[7]_i_3_n_0\,
      I1 => \count[7]_i_4_n_0\,
      I2 => count(6),
      O => count_next(6)
    );
\count[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B040"
    )
        port map (
      I0 => \count[7]_i_3_n_0\,
      I1 => count(6),
      I2 => \count[7]_i_4_n_0\,
      I3 => count(7),
      O => count_next(7)
    );
\count[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => count(1),
      I1 => count(0),
      I2 => count(2),
      I3 => count(3),
      I4 => count(4),
      I5 => count(5),
      O => \count[7]_i_3_n_0\
    );
\count[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => count(7),
      I1 => count(5),
      I2 => count(6),
      I3 => \valid_max_i_2__2_n_0\,
      O => \count[7]_i_4_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => count_next(0),
      Q => count(0)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => count_next(1),
      Q => count(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => count_next(2),
      Q => count(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => count_next(3),
      Q => count(3)
    );
\count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => count_next(4),
      Q => count(4)
    );
\count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => count_next(5),
      Q => count(5)
    );
\count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => count_next(6),
      Q => count(6)
    );
\count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => E(0),
      CLR => AR(0),
      D => count_next(7),
      Q => count(7)
    );
\max_calc[3]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF000000B2000000"
    )
        port map (
      I0 => ofmap_RELU_IBUF(3),
      I1 => max_calc(3),
      I2 => \max_calc[3]_i_3_n_0\,
      I3 => \comp_11__5\,
      I4 => valid_data_IBUF,
      I5 => \max_calc[3]_i_5_n_0\,
      O => \max_calc[3]_i_1__2_n_0\
    );
\max_calc[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200BB00B200"
    )
        port map (
      I0 => ofmap_RELU_IBUF(2),
      I1 => max_calc(2),
      I2 => \max_calc[3]_i_6_n_0\,
      I3 => \comp_11__5\,
      I4 => ofmap_RELU_IBUF(1),
      I5 => max_calc(1),
      O => \max_calc[3]_i_3_n_0\
    );
\max_calc[3]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => count(5),
      I1 => count(6),
      I2 => count(7),
      I3 => \valid_max_i_2__2_n_0\,
      O => \max_calc[3]_i_5_n_0\
    );
\max_calc[3]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4404"
    )
        port map (
      I0 => max_calc(0),
      I1 => ofmap_RELU_IBUF(0),
      I2 => max_calc(1),
      I3 => ofmap_RELU_IBUF(1),
      O => \max_calc[3]_i_6_n_0\
    );
\max_calc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \max_calc[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => D(0),
      Q => max_calc(0)
    );
\max_calc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \max_calc[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => D(1),
      Q => max_calc(1)
    );
\max_calc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \max_calc[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => D(2),
      Q => max_calc(2)
    );
\max_calc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \max_calc[3]_i_1__2_n_0\,
      CLR => AR(0),
      D => D(3),
      Q => max_calc(3)
    );
\pooling_out_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFEA40"
    )
        port map (
      I0 => \^valid_comp_1_out\,
      I1 => valid_comp_2_out,
      I2 => Q(0),
      I3 => max_calc(0),
      I4 => \max_calc_reg[0]_0\,
      O => pooling_out_OBUF(0)
    );
\pooling_out_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFEA40"
    )
        port map (
      I0 => \^valid_comp_1_out\,
      I1 => valid_comp_2_out,
      I2 => Q(1),
      I3 => max_calc(1),
      I4 => \max_calc_reg[1]_0\,
      O => pooling_out_OBUF(1)
    );
\pooling_out_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFEA40"
    )
        port map (
      I0 => \^valid_comp_1_out\,
      I1 => valid_comp_2_out,
      I2 => Q(2),
      I3 => max_calc(2),
      I4 => \max_calc_reg[2]_0\,
      O => pooling_out_OBUF(2)
    );
\pooling_out_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFEA40"
    )
        port map (
      I0 => \^valid_comp_1_out\,
      I1 => valid_comp_2_out,
      I2 => Q(3),
      I3 => max_calc(3),
      I4 => \max_calc_reg[3]_0\,
      O => pooling_out_OBUF(3)
    );
\valid_max_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800000000000000"
    )
        port map (
      I0 => \comp_11__5\,
      I1 => valid_data_IBUF,
      I2 => \valid_max_i_2__2_n_0\,
      I3 => count(7),
      I4 => count(6),
      I5 => count(5),
      O => \valid_max_i_1__2_n_0\
    );
\valid_max_i_2__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => count(4),
      I1 => count(3),
      I2 => count(2),
      I3 => count(0),
      I4 => count(1),
      O => \valid_max_i_2__2_n_0\
    );
valid_max_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \valid_max_i_1__2_n_0\,
      Q => \^valid_comp_1_out\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity PC_0 is
  port (
    valid_comp_2_out : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    ofmap_RELU_IBUF : in STD_LOGIC_VECTOR ( 3 downto 0 );
    valid_data_IBUF : in STD_LOGIC;
    \comp_21__5\ : in STD_LOGIC;
    \count_col_reg[1]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \count_col_reg[1]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of PC_0 : entity is "PC";
end PC_0;

architecture STRUCTURE of PC_0 is
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \count[5]_i_2__0_n_0\ : STD_LOGIC;
  signal \count[7]_i_3__0_n_0\ : STD_LOGIC;
  signal \count[7]_i_4__0_n_0\ : STD_LOGIC;
  signal count_next : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_reg_n_0_[3]\ : STD_LOGIC;
  signal \count_reg_n_0_[4]\ : STD_LOGIC;
  signal \count_reg_n_0_[5]\ : STD_LOGIC;
  signal \count_reg_n_0_[6]\ : STD_LOGIC;
  signal \count_reg_n_0_[7]\ : STD_LOGIC;
  signal \max_calc[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \max_calc[3]_i_3__0_n_0\ : STD_LOGIC;
  signal \max_calc[3]_i_4__1_n_0\ : STD_LOGIC;
  signal \max_calc[3]_i_5__0_n_0\ : STD_LOGIC;
  signal \valid_max_i_1__1_n_0\ : STD_LOGIC;
  signal valid_max_i_3_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1__0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \count[1]_i_1__0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \count[2]_i_1__0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \count[3]_i_1__0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \count[5]_i_2__0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \count[6]_i_1__0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \count[7]_i_2__0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \count[7]_i_4__0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \max_calc[3]_i_3__0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of valid_max_i_3 : label is "soft_lutpair5";
begin
  Q(3 downto 0) <= \^q\(3 downto 0);
\count[0]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \count[7]_i_4__0_n_0\,
      I1 => \count_reg_n_0_[0]\,
      O => count_next(0)
    );
\count[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \count[7]_i_4__0_n_0\,
      I1 => \count_reg_n_0_[0]\,
      I2 => \count_reg_n_0_[1]\,
      O => count_next(1)
    );
\count[2]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => \count[7]_i_4__0_n_0\,
      I1 => \count_reg_n_0_[0]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => \count_reg_n_0_[2]\,
      O => count_next(2)
    );
\count[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => \count[7]_i_4__0_n_0\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      I3 => \count_reg_n_0_[2]\,
      I4 => \count_reg_n_0_[3]\,
      O => count_next(3)
    );
\count[4]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
        port map (
      I0 => \count[7]_i_4__0_n_0\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[0]\,
      I4 => \count_reg_n_0_[1]\,
      I5 => \count_reg_n_0_[4]\,
      O => count_next(4)
    );
\count[5]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \count[7]_i_4__0_n_0\,
      I1 => \count[5]_i_2__0_n_0\,
      I2 => \count_reg_n_0_[5]\,
      O => count_next(5)
    );
\count[5]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[0]\,
      I4 => \count_reg_n_0_[1]\,
      O => \count[5]_i_2__0_n_0\
    );
\count[6]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"84"
    )
        port map (
      I0 => \count[7]_i_3__0_n_0\,
      I1 => \count[7]_i_4__0_n_0\,
      I2 => \count_reg_n_0_[6]\,
      O => count_next(6)
    );
\count[7]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B040"
    )
        port map (
      I0 => \count[7]_i_3__0_n_0\,
      I1 => \count_reg_n_0_[6]\,
      I2 => \count[7]_i_4__0_n_0\,
      I3 => \count_reg_n_0_[7]\,
      O => count_next(7)
    );
\count[7]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \count_reg_n_0_[1]\,
      I1 => \count_reg_n_0_[0]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[3]\,
      I4 => \count_reg_n_0_[4]\,
      I5 => \count_reg_n_0_[5]\,
      O => \count[7]_i_3__0_n_0\
    );
\count[7]_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => \count_reg_n_0_[7]\,
      I1 => \count_reg_n_0_[5]\,
      I2 => \count_reg_n_0_[6]\,
      I3 => valid_max_i_3_n_0,
      O => \count[7]_i_4__0_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[1]_0\(0),
      CLR => AR(0),
      D => count_next(0),
      Q => \count_reg_n_0_[0]\
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[1]_0\(0),
      CLR => AR(0),
      D => count_next(1),
      Q => \count_reg_n_0_[1]\
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[1]_0\(0),
      CLR => AR(0),
      D => count_next(2),
      Q => \count_reg_n_0_[2]\
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[1]_0\(0),
      CLR => AR(0),
      D => count_next(3),
      Q => \count_reg_n_0_[3]\
    );
\count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[1]_0\(0),
      CLR => AR(0),
      D => count_next(4),
      Q => \count_reg_n_0_[4]\
    );
\count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[1]_0\(0),
      CLR => AR(0),
      D => count_next(5),
      Q => \count_reg_n_0_[5]\
    );
\count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[1]_0\(0),
      CLR => AR(0),
      D => count_next(6),
      Q => \count_reg_n_0_[6]\
    );
\count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[1]_0\(0),
      CLR => AR(0),
      D => count_next(7),
      Q => \count_reg_n_0_[7]\
    );
\max_calc[3]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EC000000FE000000"
    )
        port map (
      I0 => ofmap_RELU_IBUF(3),
      I1 => \max_calc[3]_i_3__0_n_0\,
      I2 => \max_calc[3]_i_4__1_n_0\,
      I3 => valid_data_IBUF,
      I4 => \comp_21__5\,
      I5 => \^q\(3),
      O => \max_calc[3]_i_1__1_n_0\
    );
\max_calc[3]_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \count_reg_n_0_[5]\,
      I1 => \count_reg_n_0_[6]\,
      I2 => \count_reg_n_0_[7]\,
      I3 => valid_max_i_3_n_0,
      O => \max_calc[3]_i_3__0_n_0\
    );
\max_calc[3]_i_4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200BB00B200"
    )
        port map (
      I0 => ofmap_RELU_IBUF(2),
      I1 => \^q\(2),
      I2 => \max_calc[3]_i_5__0_n_0\,
      I3 => \comp_21__5\,
      I4 => ofmap_RELU_IBUF(1),
      I5 => \^q\(1),
      O => \max_calc[3]_i_4__1_n_0\
    );
\max_calc[3]_i_5__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4404"
    )
        port map (
      I0 => \^q\(0),
      I1 => ofmap_RELU_IBUF(0),
      I2 => \^q\(1),
      I3 => ofmap_RELU_IBUF(1),
      O => \max_calc[3]_i_5__0_n_0\
    );
\max_calc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \max_calc[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => \count_col_reg[1]\(0),
      Q => \^q\(0)
    );
\max_calc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \max_calc[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => \count_col_reg[1]\(1),
      Q => \^q\(1)
    );
\max_calc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \max_calc[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => \count_col_reg[1]\(2),
      Q => \^q\(2)
    );
\max_calc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \max_calc[3]_i_1__1_n_0\,
      CLR => AR(0),
      D => \count_col_reg[1]\(3),
      Q => \^q\(3)
    );
\valid_max_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800000000000000"
    )
        port map (
      I0 => \comp_21__5\,
      I1 => valid_data_IBUF,
      I2 => valid_max_i_3_n_0,
      I3 => \count_reg_n_0_[7]\,
      I4 => \count_reg_n_0_[6]\,
      I5 => \count_reg_n_0_[5]\,
      O => \valid_max_i_1__1_n_0\
    );
valid_max_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[0]\,
      I4 => \count_reg_n_0_[1]\,
      O => valid_max_i_3_n_0
    );
valid_max_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \valid_max_i_1__1_n_0\,
      Q => valid_comp_2_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity PC_1 is
  port (
    valid_comp_3_out : out STD_LOGIC;
    \pooling_out[0]\ : out STD_LOGIC;
    \pooling_out[1]\ : out STD_LOGIC;
    \pooling_out[2]\ : out STD_LOGIC;
    \pooling_out[3]\ : out STD_LOGIC;
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    ofmap_RELU_IBUF : in STD_LOGIC_VECTOR ( 3 downto 0 );
    valid_data_IBUF : in STD_LOGIC;
    \comp_31__8\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    valid_comp_2_out : in STD_LOGIC;
    valid_comp_4_out : in STD_LOGIC;
    valid_comp_1_out : in STD_LOGIC;
    \count_col_reg[1]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \count_col_reg[1]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of PC_1 : entity is "PC";
end PC_1;

architecture STRUCTURE of PC_1 is
  signal \count[5]_i_2__1_n_0\ : STD_LOGIC;
  signal \count[7]_i_3__1_n_0\ : STD_LOGIC;
  signal \count[7]_i_4__1_n_0\ : STD_LOGIC;
  signal count_next : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_reg_n_0_[3]\ : STD_LOGIC;
  signal \count_reg_n_0_[4]\ : STD_LOGIC;
  signal \count_reg_n_0_[5]\ : STD_LOGIC;
  signal \count_reg_n_0_[6]\ : STD_LOGIC;
  signal \count_reg_n_0_[7]\ : STD_LOGIC;
  signal \max_calc[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \max_calc[3]_i_3__1_n_0\ : STD_LOGIC;
  signal \max_calc[3]_i_4__0_n_0\ : STD_LOGIC;
  signal \max_calc[3]_i_5__1_n_0\ : STD_LOGIC;
  signal \max_calc_reg_n_0_[0]\ : STD_LOGIC;
  signal \max_calc_reg_n_0_[1]\ : STD_LOGIC;
  signal \max_calc_reg_n_0_[2]\ : STD_LOGIC;
  signal \max_calc_reg_n_0_[3]\ : STD_LOGIC;
  signal \^valid_comp_3_out\ : STD_LOGIC;
  signal \valid_max_i_1__0_n_0\ : STD_LOGIC;
  signal \valid_max_i_3__0_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1__1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \count[2]_i_1__1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \count[3]_i_1__1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \count[5]_i_1__1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \count[5]_i_2__1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \count[6]_i_1__1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \count[7]_i_2__1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \count[7]_i_4__1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \max_calc[3]_i_3__1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \valid_max_i_3__0\ : label is "soft_lutpair11";
begin
  valid_comp_3_out <= \^valid_comp_3_out\;
\count[0]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \count[7]_i_4__1_n_0\,
      I1 => \count_reg_n_0_[0]\,
      O => count_next(0)
    );
\count[1]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \count[7]_i_4__1_n_0\,
      I1 => \count_reg_n_0_[0]\,
      I2 => \count_reg_n_0_[1]\,
      O => count_next(1)
    );
\count[2]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => \count[7]_i_4__1_n_0\,
      I1 => \count_reg_n_0_[0]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => \count_reg_n_0_[2]\,
      O => count_next(2)
    );
\count[3]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => \count[7]_i_4__1_n_0\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      I3 => \count_reg_n_0_[2]\,
      I4 => \count_reg_n_0_[3]\,
      O => count_next(3)
    );
\count[4]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
        port map (
      I0 => \count[7]_i_4__1_n_0\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[0]\,
      I4 => \count_reg_n_0_[1]\,
      I5 => \count_reg_n_0_[4]\,
      O => count_next(4)
    );
\count[5]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \count[7]_i_4__1_n_0\,
      I1 => \count[5]_i_2__1_n_0\,
      I2 => \count_reg_n_0_[5]\,
      O => count_next(5)
    );
\count[5]_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[0]\,
      I4 => \count_reg_n_0_[1]\,
      O => \count[5]_i_2__1_n_0\
    );
\count[6]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"84"
    )
        port map (
      I0 => \count[7]_i_3__1_n_0\,
      I1 => \count[7]_i_4__1_n_0\,
      I2 => \count_reg_n_0_[6]\,
      O => count_next(6)
    );
\count[7]_i_2__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B040"
    )
        port map (
      I0 => \count[7]_i_3__1_n_0\,
      I1 => \count_reg_n_0_[6]\,
      I2 => \count[7]_i_4__1_n_0\,
      I3 => \count_reg_n_0_[7]\,
      O => count_next(7)
    );
\count[7]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \count_reg_n_0_[1]\,
      I1 => \count_reg_n_0_[0]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[3]\,
      I4 => \count_reg_n_0_[4]\,
      I5 => \count_reg_n_0_[5]\,
      O => \count[7]_i_3__1_n_0\
    );
\count[7]_i_4__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => \count_reg_n_0_[7]\,
      I1 => \count_reg_n_0_[5]\,
      I2 => \count_reg_n_0_[6]\,
      I3 => \valid_max_i_3__0_n_0\,
      O => \count[7]_i_4__1_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[1]_0\(0),
      CLR => AR(0),
      D => count_next(0),
      Q => \count_reg_n_0_[0]\
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[1]_0\(0),
      CLR => AR(0),
      D => count_next(1),
      Q => \count_reg_n_0_[1]\
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[1]_0\(0),
      CLR => AR(0),
      D => count_next(2),
      Q => \count_reg_n_0_[2]\
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[1]_0\(0),
      CLR => AR(0),
      D => count_next(3),
      Q => \count_reg_n_0_[3]\
    );
\count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[1]_0\(0),
      CLR => AR(0),
      D => count_next(4),
      Q => \count_reg_n_0_[4]\
    );
\count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[1]_0\(0),
      CLR => AR(0),
      D => count_next(5),
      Q => \count_reg_n_0_[5]\
    );
\count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[1]_0\(0),
      CLR => AR(0),
      D => count_next(6),
      Q => \count_reg_n_0_[6]\
    );
\count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[1]_0\(0),
      CLR => AR(0),
      D => count_next(7),
      Q => \count_reg_n_0_[7]\
    );
\max_calc[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EC000000FE000000"
    )
        port map (
      I0 => ofmap_RELU_IBUF(3),
      I1 => \max_calc[3]_i_3__1_n_0\,
      I2 => \max_calc[3]_i_4__0_n_0\,
      I3 => valid_data_IBUF,
      I4 => \comp_31__8\,
      I5 => \max_calc_reg_n_0_[3]\,
      O => \max_calc[3]_i_1__0_n_0\
    );
\max_calc[3]_i_3__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \count_reg_n_0_[5]\,
      I1 => \count_reg_n_0_[6]\,
      I2 => \count_reg_n_0_[7]\,
      I3 => \valid_max_i_3__0_n_0\,
      O => \max_calc[3]_i_3__1_n_0\
    );
\max_calc[3]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200BB00B200"
    )
        port map (
      I0 => ofmap_RELU_IBUF(2),
      I1 => \max_calc_reg_n_0_[2]\,
      I2 => \max_calc[3]_i_5__1_n_0\,
      I3 => \comp_31__8\,
      I4 => ofmap_RELU_IBUF(1),
      I5 => \max_calc_reg_n_0_[1]\,
      O => \max_calc[3]_i_4__0_n_0\
    );
\max_calc[3]_i_5__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4404"
    )
        port map (
      I0 => \max_calc_reg_n_0_[0]\,
      I1 => ofmap_RELU_IBUF(0),
      I2 => \max_calc_reg_n_0_[1]\,
      I3 => ofmap_RELU_IBUF(1),
      O => \max_calc[3]_i_5__1_n_0\
    );
\max_calc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \max_calc[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => \count_col_reg[1]\(0),
      Q => \max_calc_reg_n_0_[0]\
    );
\max_calc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \max_calc[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => \count_col_reg[1]\(1),
      Q => \max_calc_reg_n_0_[1]\
    );
\max_calc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \max_calc[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => \count_col_reg[1]\(2),
      Q => \max_calc_reg_n_0_[2]\
    );
\max_calc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \max_calc[3]_i_1__0_n_0\,
      CLR => AR(0),
      D => \count_col_reg[1]\(3),
      Q => \max_calc_reg_n_0_[3]\
    );
\pooling_out_OBUF[0]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000A0A0C00"
    )
        port map (
      I0 => \max_calc_reg_n_0_[0]\,
      I1 => Q(0),
      I2 => valid_comp_2_out,
      I3 => valid_comp_4_out,
      I4 => \^valid_comp_3_out\,
      I5 => valid_comp_1_out,
      O => \pooling_out[0]\
    );
\pooling_out_OBUF[1]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000A0A0C00"
    )
        port map (
      I0 => \max_calc_reg_n_0_[1]\,
      I1 => Q(1),
      I2 => valid_comp_2_out,
      I3 => valid_comp_4_out,
      I4 => \^valid_comp_3_out\,
      I5 => valid_comp_1_out,
      O => \pooling_out[1]\
    );
\pooling_out_OBUF[2]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000A0A0C00"
    )
        port map (
      I0 => \max_calc_reg_n_0_[2]\,
      I1 => Q(2),
      I2 => valid_comp_2_out,
      I3 => valid_comp_4_out,
      I4 => \^valid_comp_3_out\,
      I5 => valid_comp_1_out,
      O => \pooling_out[2]\
    );
\pooling_out_OBUF[3]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000A0A0C00"
    )
        port map (
      I0 => \max_calc_reg_n_0_[3]\,
      I1 => Q(3),
      I2 => valid_comp_2_out,
      I3 => valid_comp_4_out,
      I4 => \^valid_comp_3_out\,
      I5 => valid_comp_1_out,
      O => \pooling_out[3]\
    );
\valid_max_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800000000000000"
    )
        port map (
      I0 => \comp_31__8\,
      I1 => valid_data_IBUF,
      I2 => \valid_max_i_3__0_n_0\,
      I3 => \count_reg_n_0_[7]\,
      I4 => \count_reg_n_0_[6]\,
      I5 => \count_reg_n_0_[5]\,
      O => \valid_max_i_1__0_n_0\
    );
\valid_max_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[0]\,
      I4 => \count_reg_n_0_[1]\,
      O => \valid_max_i_3__0_n_0\
    );
valid_max_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => \valid_max_i_1__0_n_0\,
      Q => \^valid_comp_3_out\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity PC_2 is
  port (
    valid_comp_4_out : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    valid_pooling_OBUF : out STD_LOGIC;
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    ofmap_RELU_IBUF : in STD_LOGIC_VECTOR ( 3 downto 0 );
    valid_data_IBUF : in STD_LOGIC;
    \comp_41__9\ : in STD_LOGIC;
    valid_comp_3_out : in STD_LOGIC;
    valid_comp_2_out : in STD_LOGIC;
    valid_comp_1_out : in STD_LOGIC;
    \count_col_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \count_col_reg[3]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of PC_2 : entity is "PC";
end PC_2;

architecture STRUCTURE of PC_2 is
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \count[5]_i_2__2_n_0\ : STD_LOGIC;
  signal \count[7]_i_3__2_n_0\ : STD_LOGIC;
  signal \count[7]_i_4__2_n_0\ : STD_LOGIC;
  signal count_next : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_reg_n_0_[3]\ : STD_LOGIC;
  signal \count_reg_n_0_[4]\ : STD_LOGIC;
  signal \count_reg_n_0_[5]\ : STD_LOGIC;
  signal \count_reg_n_0_[6]\ : STD_LOGIC;
  signal \count_reg_n_0_[7]\ : STD_LOGIC;
  signal \max_calc[3]_i_1_n_0\ : STD_LOGIC;
  signal \max_calc[3]_i_3__2_n_0\ : STD_LOGIC;
  signal \max_calc[3]_i_4_n_0\ : STD_LOGIC;
  signal \max_calc[3]_i_5__2_n_0\ : STD_LOGIC;
  signal \^valid_comp_4_out\ : STD_LOGIC;
  signal valid_max_i_1_n_0 : STD_LOGIC;
  signal \valid_max_i_3__1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1__2\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \count[1]_i_1__2\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \count[2]_i_1__2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \count[3]_i_1__2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \count[5]_i_2__2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \count[6]_i_1__2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \count[7]_i_2__2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \count[7]_i_4__2\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \max_calc[3]_i_3__2\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \valid_max_i_3__1\ : label is "soft_lutpair15";
begin
  Q(3 downto 0) <= \^q\(3 downto 0);
  valid_comp_4_out <= \^valid_comp_4_out\;
\count[0]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \count[7]_i_4__2_n_0\,
      I1 => \count_reg_n_0_[0]\,
      O => count_next(0)
    );
\count[1]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \count[7]_i_4__2_n_0\,
      I1 => \count_reg_n_0_[0]\,
      I2 => \count_reg_n_0_[1]\,
      O => count_next(1)
    );
\count[2]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => \count[7]_i_4__2_n_0\,
      I1 => \count_reg_n_0_[0]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => \count_reg_n_0_[2]\,
      O => count_next(2)
    );
\count[3]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => \count[7]_i_4__2_n_0\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      I3 => \count_reg_n_0_[2]\,
      I4 => \count_reg_n_0_[3]\,
      O => count_next(3)
    );
\count[4]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
        port map (
      I0 => \count[7]_i_4__2_n_0\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[0]\,
      I4 => \count_reg_n_0_[1]\,
      I5 => \count_reg_n_0_[4]\,
      O => count_next(4)
    );
\count[5]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \count[7]_i_4__2_n_0\,
      I1 => \count[5]_i_2__2_n_0\,
      I2 => \count_reg_n_0_[5]\,
      O => count_next(5)
    );
\count[5]_i_2__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[0]\,
      I4 => \count_reg_n_0_[1]\,
      O => \count[5]_i_2__2_n_0\
    );
\count[6]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"84"
    )
        port map (
      I0 => \count[7]_i_3__2_n_0\,
      I1 => \count[7]_i_4__2_n_0\,
      I2 => \count_reg_n_0_[6]\,
      O => count_next(6)
    );
\count[7]_i_2__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B040"
    )
        port map (
      I0 => \count[7]_i_3__2_n_0\,
      I1 => \count_reg_n_0_[6]\,
      I2 => \count[7]_i_4__2_n_0\,
      I3 => \count_reg_n_0_[7]\,
      O => count_next(7)
    );
\count[7]_i_3__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \count_reg_n_0_[1]\,
      I1 => \count_reg_n_0_[0]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[3]\,
      I4 => \count_reg_n_0_[4]\,
      I5 => \count_reg_n_0_[5]\,
      O => \count[7]_i_3__2_n_0\
    );
\count[7]_i_4__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => \count_reg_n_0_[7]\,
      I1 => \count_reg_n_0_[5]\,
      I2 => \count_reg_n_0_[6]\,
      I3 => \valid_max_i_3__1_n_0\,
      O => \count[7]_i_4__2_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[3]_0\(0),
      CLR => AR(0),
      D => count_next(0),
      Q => \count_reg_n_0_[0]\
    );
\count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[3]_0\(0),
      CLR => AR(0),
      D => count_next(1),
      Q => \count_reg_n_0_[1]\
    );
\count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[3]_0\(0),
      CLR => AR(0),
      D => count_next(2),
      Q => \count_reg_n_0_[2]\
    );
\count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[3]_0\(0),
      CLR => AR(0),
      D => count_next(3),
      Q => \count_reg_n_0_[3]\
    );
\count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[3]_0\(0),
      CLR => AR(0),
      D => count_next(4),
      Q => \count_reg_n_0_[4]\
    );
\count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[3]_0\(0),
      CLR => AR(0),
      D => count_next(5),
      Q => \count_reg_n_0_[5]\
    );
\count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[3]_0\(0),
      CLR => AR(0),
      D => count_next(6),
      Q => \count_reg_n_0_[6]\
    );
\count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_col_reg[3]_0\(0),
      CLR => AR(0),
      D => count_next(7),
      Q => \count_reg_n_0_[7]\
    );
\max_calc[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EC000000FE000000"
    )
        port map (
      I0 => ofmap_RELU_IBUF(3),
      I1 => \max_calc[3]_i_3__2_n_0\,
      I2 => \max_calc[3]_i_4_n_0\,
      I3 => valid_data_IBUF,
      I4 => \comp_41__9\,
      I5 => \^q\(3),
      O => \max_calc[3]_i_1_n_0\
    );
\max_calc[3]_i_3__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \count_reg_n_0_[5]\,
      I1 => \count_reg_n_0_[6]\,
      I2 => \count_reg_n_0_[7]\,
      I3 => \valid_max_i_3__1_n_0\,
      O => \max_calc[3]_i_3__2_n_0\
    );
\max_calc[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B200BB00B200"
    )
        port map (
      I0 => ofmap_RELU_IBUF(2),
      I1 => \^q\(2),
      I2 => \max_calc[3]_i_5__2_n_0\,
      I3 => \comp_41__9\,
      I4 => ofmap_RELU_IBUF(1),
      I5 => \^q\(1),
      O => \max_calc[3]_i_4_n_0\
    );
\max_calc[3]_i_5__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4404"
    )
        port map (
      I0 => \^q\(0),
      I1 => ofmap_RELU_IBUF(0),
      I2 => \^q\(1),
      I3 => ofmap_RELU_IBUF(1),
      O => \max_calc[3]_i_5__2_n_0\
    );
\max_calc_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \max_calc[3]_i_1_n_0\,
      CLR => AR(0),
      D => \count_col_reg[3]\(0),
      Q => \^q\(0)
    );
\max_calc_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \max_calc[3]_i_1_n_0\,
      CLR => AR(0),
      D => \count_col_reg[3]\(1),
      Q => \^q\(1)
    );
\max_calc_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \max_calc[3]_i_1_n_0\,
      CLR => AR(0),
      D => \count_col_reg[3]\(2),
      Q => \^q\(2)
    );
\max_calc_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \max_calc[3]_i_1_n_0\,
      CLR => AR(0),
      D => \count_col_reg[3]\(3),
      Q => \^q\(3)
    );
valid_max_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800000000000000"
    )
        port map (
      I0 => \comp_41__9\,
      I1 => valid_data_IBUF,
      I2 => \valid_max_i_3__1_n_0\,
      I3 => \count_reg_n_0_[7]\,
      I4 => \count_reg_n_0_[6]\,
      I5 => \count_reg_n_0_[5]\,
      O => valid_max_i_1_n_0
    );
\valid_max_i_3__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \count_reg_n_0_[4]\,
      I1 => \count_reg_n_0_[3]\,
      I2 => \count_reg_n_0_[2]\,
      I3 => \count_reg_n_0_[0]\,
      I4 => \count_reg_n_0_[1]\,
      O => \valid_max_i_3__1_n_0\
    );
valid_max_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => AR(0),
      D => valid_max_i_1_n_0,
      Q => \^valid_comp_4_out\
    );
valid_pooling_OBUF_inst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^valid_comp_4_out\,
      I1 => valid_comp_3_out,
      I2 => valid_comp_2_out,
      I3 => valid_comp_1_out,
      O => valid_pooling_OBUF
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Pooling_Controller is
  port (
    \max_calc_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \comp_41__9\ : out STD_LOGIC;
    \count_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \max_calc_reg[3]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \comp_31__8\ : out STD_LOGIC;
    \count_reg[0]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \max_calc_reg[3]_1\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \comp_21__5\ : out STD_LOGIC;
    \count_reg[0]_1\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \comp_11__5\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    ofmap_RELU_IBUF : in STD_LOGIC_VECTOR ( 3 downto 0 );
    valid_data_IBUF : in STD_LOGIC;
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end Pooling_Controller;

architecture STRUCTURE of Pooling_Controller is
  signal \^comp_11__5\ : STD_LOGIC;
  signal \comp_12__2\ : STD_LOGIC;
  signal \^comp_21__5\ : STD_LOGIC;
  signal \^comp_31__8\ : STD_LOGIC;
  signal \^comp_41__9\ : STD_LOGIC;
  signal count_col : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal count_col_next : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal count_row : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \count_row[5]_i_1_n_0\ : STD_LOGIC;
  signal \count_row[5]_i_3_n_0\ : STD_LOGIC;
  signal count_row_next : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \max_calc[3]_i_7_n_0\ : STD_LOGIC;
  signal valid_max_i_4_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[7]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \count[7]_i_1__0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \count[7]_i_1__1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \count[7]_i_1__2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \count_row[5]_i_3\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \max_calc[0]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \max_calc[0]_i_1__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \max_calc[0]_i_1__1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \max_calc[0]_i_1__2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \max_calc[1]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \max_calc[1]_i_1__0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \max_calc[1]_i_1__2\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \max_calc[2]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \max_calc[2]_i_1__0\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \max_calc[2]_i_1__1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \max_calc[3]_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \max_calc[3]_i_2__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \max_calc[3]_i_2__1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \max_calc[3]_i_2__2\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \max_calc[3]_i_7\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of valid_max_i_4 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \valid_max_i_4__0\ : label is "soft_lutpair20";
begin
  \comp_11__5\ <= \^comp_11__5\;
  \comp_21__5\ <= \^comp_21__5\;
  \comp_31__8\ <= \^comp_31__8\;
  \comp_41__9\ <= \^comp_41__9\;
\count[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_41__9\,
      I1 => valid_data_IBUF,
      O => \count_reg[0]\(0)
    );
\count[7]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_31__8\,
      I1 => valid_data_IBUF,
      O => \count_reg[0]_0\(0)
    );
\count[7]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_21__5\,
      I1 => valid_data_IBUF,
      O => \count_reg[0]_1\(0)
    );
\count[7]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_11__5\,
      I1 => valid_data_IBUF,
      O => E(0)
    );
\count_col[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000F7FFFFFF"
    )
        port map (
      I0 => count_col(5),
      I1 => count_col(4),
      I2 => count_col(1),
      I3 => count_col(3),
      I4 => count_col(2),
      I5 => count_col(0),
      O => count_col_next(0)
    );
\count_col[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => count_col(0),
      I1 => count_col(1),
      O => count_col_next(1)
    );
\count_col[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"668C66CC66CC66CC"
    )
        port map (
      I0 => count_col(0),
      I1 => count_col(2),
      I2 => count_col(3),
      I3 => count_col(1),
      I4 => count_col(4),
      I5 => count_col(5),
      O => count_col_next(2)
    );
\count_col[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"78B078F078F078F0"
    )
        port map (
      I0 => count_col(0),
      I1 => count_col(2),
      I2 => count_col(3),
      I3 => count_col(1),
      I4 => count_col(4),
      I5 => count_col(5),
      O => count_col_next(3)
    );
\count_col[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FBF80007FFF8000"
    )
        port map (
      I0 => count_col(0),
      I1 => count_col(2),
      I2 => count_col(3),
      I3 => count_col(1),
      I4 => count_col(4),
      I5 => count_col(5),
      O => count_col_next(4)
    );
\count_col[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FF7FFFF80000000"
    )
        port map (
      I0 => count_col(3),
      I1 => count_col(2),
      I2 => count_col(1),
      I3 => count_col(0),
      I4 => count_col(4),
      I5 => count_col(5),
      O => count_col_next(5)
    );
\count_col_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => valid_data_IBUF,
      CLR => AR(0),
      D => count_col_next(0),
      Q => count_col(0)
    );
\count_col_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => valid_data_IBUF,
      CLR => AR(0),
      D => count_col_next(1),
      Q => count_col(1)
    );
\count_col_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => valid_data_IBUF,
      CLR => AR(0),
      D => count_col_next(2),
      Q => count_col(2)
    );
\count_col_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => valid_data_IBUF,
      CLR => AR(0),
      D => count_col_next(3),
      Q => count_col(3)
    );
\count_col_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => valid_data_IBUF,
      CLR => AR(0),
      D => count_col_next(4),
      Q => count_col(4)
    );
\count_col_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => valid_data_IBUF,
      CLR => AR(0),
      D => count_col_next(5),
      Q => count_col(5)
    );
\count_row[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BFFFFFFF"
    )
        port map (
      I0 => count_row(1),
      I1 => count_row(2),
      I2 => count_row(3),
      I3 => count_row(5),
      I4 => count_row(4),
      I5 => count_row(0),
      O => count_row_next(0)
    );
\count_row[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => count_row(1),
      I1 => count_row(0),
      O => count_row_next(1)
    );
\count_row[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFFF00FF007F00"
    )
        port map (
      I0 => count_row(4),
      I1 => count_row(5),
      I2 => count_row(3),
      I3 => count_row(2),
      I4 => count_row(1),
      I5 => count_row(0),
      O => count_row_next(2)
    );
\count_row[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FF0F0F0F0F070F0"
    )
        port map (
      I0 => count_row(4),
      I1 => count_row(5),
      I2 => count_row(3),
      I3 => count_row(2),
      I4 => count_row(1),
      I5 => count_row(0),
      O => count_row_next(3)
    );
\count_row[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FFF7FFF80008000"
    )
        port map (
      I0 => count_row(1),
      I1 => count_row(0),
      I2 => count_row(2),
      I3 => count_row(3),
      I4 => count_row(5),
      I5 => count_row(4),
      O => count_row_next(4)
    );
\count_row[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => count_col(5),
      I1 => count_col(4),
      I2 => valid_data_IBUF,
      I3 => \count_row[5]_i_3_n_0\,
      O => \count_row[5]_i_1_n_0\
    );
\count_row[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FF7FFFF80000000"
    )
        port map (
      I0 => count_row(3),
      I1 => count_row(2),
      I2 => count_row(0),
      I3 => count_row(1),
      I4 => count_row(4),
      I5 => count_row(5),
      O => count_row_next(5)
    );
\count_row[5]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFBF"
    )
        port map (
      I0 => count_col(1),
      I1 => count_col(3),
      I2 => count_col(2),
      I3 => count_col(0),
      O => \count_row[5]_i_3_n_0\
    );
\count_row_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_row[5]_i_1_n_0\,
      CLR => AR(0),
      D => count_row_next(0),
      Q => count_row(0)
    );
\count_row_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_row[5]_i_1_n_0\,
      CLR => AR(0),
      D => count_row_next(1),
      Q => count_row(1)
    );
\count_row_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_row[5]_i_1_n_0\,
      CLR => AR(0),
      D => count_row_next(2),
      Q => count_row(2)
    );
\count_row_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_row[5]_i_1_n_0\,
      CLR => AR(0),
      D => count_row_next(3),
      Q => count_row(3)
    );
\count_row_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_row[5]_i_1_n_0\,
      CLR => AR(0),
      D => count_row_next(4),
      Q => count_row(4)
    );
\count_row_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \count_row[5]_i_1_n_0\,
      CLR => AR(0),
      D => count_row_next(5),
      Q => count_row(5)
    );
\max_calc[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_41__9\,
      I1 => ofmap_RELU_IBUF(0),
      O => \max_calc_reg[3]\(0)
    );
\max_calc[0]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_31__8\,
      I1 => ofmap_RELU_IBUF(0),
      O => \max_calc_reg[3]_0\(0)
    );
\max_calc[0]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_21__5\,
      I1 => ofmap_RELU_IBUF(0),
      O => \max_calc_reg[3]_1\(0)
    );
\max_calc[0]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_11__5\,
      I1 => ofmap_RELU_IBUF(0),
      O => D(0)
    );
\max_calc[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_41__9\,
      I1 => ofmap_RELU_IBUF(1),
      O => \max_calc_reg[3]\(1)
    );
\max_calc[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_31__8\,
      I1 => ofmap_RELU_IBUF(1),
      O => \max_calc_reg[3]_0\(1)
    );
\max_calc[1]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_21__5\,
      I1 => ofmap_RELU_IBUF(1),
      O => \max_calc_reg[3]_1\(1)
    );
\max_calc[1]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_11__5\,
      I1 => ofmap_RELU_IBUF(1),
      O => D(1)
    );
\max_calc[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_41__9\,
      I1 => ofmap_RELU_IBUF(2),
      O => \max_calc_reg[3]\(2)
    );
\max_calc[2]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_31__8\,
      I1 => ofmap_RELU_IBUF(2),
      O => \max_calc_reg[3]_0\(2)
    );
\max_calc[2]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_21__5\,
      I1 => ofmap_RELU_IBUF(2),
      O => \max_calc_reg[3]_1\(2)
    );
\max_calc[2]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_11__5\,
      I1 => ofmap_RELU_IBUF(2),
      O => D(2)
    );
\max_calc[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_41__9\,
      I1 => ofmap_RELU_IBUF(3),
      O => \max_calc_reg[3]\(3)
    );
\max_calc[3]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_31__8\,
      I1 => ofmap_RELU_IBUF(3),
      O => \max_calc_reg[3]_0\(3)
    );
\max_calc[3]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_21__5\,
      I1 => ofmap_RELU_IBUF(3),
      O => \max_calc_reg[3]_1\(3)
    );
\max_calc[3]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^comp_11__5\,
      I1 => ofmap_RELU_IBUF(3),
      O => D(3)
    );
\max_calc[3]_i_4__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0444444444444444"
    )
        port map (
      I0 => count_col(4),
      I1 => \max_calc[3]_i_7_n_0\,
      I2 => count_col(0),
      I3 => count_col(2),
      I4 => count_col(3),
      I5 => count_col(1),
      O => \^comp_11__5\
    );
\max_calc[3]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00007FFF"
    )
        port map (
      I0 => count_row(2),
      I1 => count_row(3),
      I2 => count_row(5),
      I3 => count_row(4),
      I4 => count_col(5),
      O => \max_calc[3]_i_7_n_0\
    );
valid_max_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2A00800000000000"
    )
        port map (
      I0 => \count_row[5]_i_3_n_0\,
      I1 => count_col(3),
      I2 => count_col(2),
      I3 => count_col(5),
      I4 => count_col(4),
      I5 => \comp_12__2\,
      O => \^comp_41__9\
    );
\valid_max_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00CD000022000000"
    )
        port map (
      I0 => count_col(1),
      I1 => valid_max_i_4_n_0,
      I2 => count_col(0),
      I3 => count_col(4),
      I4 => \comp_12__2\,
      I5 => count_col(5),
      O => \^comp_31__8\
    );
\valid_max_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F7F000080000000"
    )
        port map (
      I0 => count_col(1),
      I1 => count_col(3),
      I2 => count_col(2),
      I3 => count_col(0),
      I4 => \max_calc[3]_i_7_n_0\,
      I5 => count_col(4),
      O => \^comp_21__5\
    );
valid_max_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => count_col(3),
      I1 => count_col(2),
      O => valid_max_i_4_n_0
    );
\valid_max_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => count_row(4),
      I1 => count_row(5),
      I2 => count_row(3),
      I3 => count_row(2),
      O => \comp_12__2\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity PC_TOP is
  port (
    valid_pooling_OBUF : out STD_LOGIC;
    pooling_out_OBUF : out STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    ofmap_RELU_IBUF : in STD_LOGIC_VECTOR ( 3 downto 0 );
    valid_data_IBUF : in STD_LOGIC;
    \comp_41__9\ : in STD_LOGIC;
    \comp_31__8\ : in STD_LOGIC;
    \comp_21__5\ : in STD_LOGIC;
    \comp_11__5\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 3 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    \count_col_reg[1]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \count_col_reg[1]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \count_col_reg[1]_1\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \count_col_reg[1]_2\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \count_col_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \count_col_reg[3]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end PC_TOP;

architecture STRUCTURE of PC_TOP is
  signal PC2_inst_n_1 : STD_LOGIC;
  signal PC2_inst_n_2 : STD_LOGIC;
  signal PC2_inst_n_3 : STD_LOGIC;
  signal PC2_inst_n_4 : STD_LOGIC;
  signal PC3_inst_n_1 : STD_LOGIC;
  signal PC3_inst_n_2 : STD_LOGIC;
  signal PC3_inst_n_3 : STD_LOGIC;
  signal PC3_inst_n_4 : STD_LOGIC;
  signal PC4_inst_n_1 : STD_LOGIC;
  signal PC4_inst_n_2 : STD_LOGIC;
  signal PC4_inst_n_3 : STD_LOGIC;
  signal PC4_inst_n_4 : STD_LOGIC;
  signal valid_comp_1_out : STD_LOGIC;
  signal valid_comp_2_out : STD_LOGIC;
  signal valid_comp_3_out : STD_LOGIC;
  signal valid_comp_4_out : STD_LOGIC;
begin
PC1_inst: entity work.PC
     port map (
      AR(0) => AR(0),
      CLK => CLK,
      D(3 downto 0) => D(3 downto 0),
      E(0) => E(0),
      Q(3) => PC2_inst_n_1,
      Q(2) => PC2_inst_n_2,
      Q(1) => PC2_inst_n_3,
      Q(0) => PC2_inst_n_4,
      \comp_11__5\ => \comp_11__5\,
      \max_calc_reg[0]_0\ => PC3_inst_n_1,
      \max_calc_reg[1]_0\ => PC3_inst_n_2,
      \max_calc_reg[2]_0\ => PC3_inst_n_3,
      \max_calc_reg[3]_0\ => PC3_inst_n_4,
      ofmap_RELU_IBUF(3 downto 0) => ofmap_RELU_IBUF(3 downto 0),
      pooling_out_OBUF(3 downto 0) => pooling_out_OBUF(3 downto 0),
      valid_comp_1_out => valid_comp_1_out,
      valid_comp_2_out => valid_comp_2_out,
      valid_data_IBUF => valid_data_IBUF
    );
PC2_inst: entity work.PC_0
     port map (
      AR(0) => AR(0),
      CLK => CLK,
      Q(3) => PC2_inst_n_1,
      Q(2) => PC2_inst_n_2,
      Q(1) => PC2_inst_n_3,
      Q(0) => PC2_inst_n_4,
      \comp_21__5\ => \comp_21__5\,
      \count_col_reg[1]\(3 downto 0) => \count_col_reg[1]\(3 downto 0),
      \count_col_reg[1]_0\(0) => \count_col_reg[1]_0\(0),
      ofmap_RELU_IBUF(3 downto 0) => ofmap_RELU_IBUF(3 downto 0),
      valid_comp_2_out => valid_comp_2_out,
      valid_data_IBUF => valid_data_IBUF
    );
PC3_inst: entity work.PC_1
     port map (
      AR(0) => AR(0),
      CLK => CLK,
      Q(3) => PC4_inst_n_1,
      Q(2) => PC4_inst_n_2,
      Q(1) => PC4_inst_n_3,
      Q(0) => PC4_inst_n_4,
      \comp_31__8\ => \comp_31__8\,
      \count_col_reg[1]\(3 downto 0) => \count_col_reg[1]_1\(3 downto 0),
      \count_col_reg[1]_0\(0) => \count_col_reg[1]_2\(0),
      ofmap_RELU_IBUF(3 downto 0) => ofmap_RELU_IBUF(3 downto 0),
      \pooling_out[0]\ => PC3_inst_n_1,
      \pooling_out[1]\ => PC3_inst_n_2,
      \pooling_out[2]\ => PC3_inst_n_3,
      \pooling_out[3]\ => PC3_inst_n_4,
      valid_comp_1_out => valid_comp_1_out,
      valid_comp_2_out => valid_comp_2_out,
      valid_comp_3_out => valid_comp_3_out,
      valid_comp_4_out => valid_comp_4_out,
      valid_data_IBUF => valid_data_IBUF
    );
PC4_inst: entity work.PC_2
     port map (
      AR(0) => AR(0),
      CLK => CLK,
      Q(3) => PC4_inst_n_1,
      Q(2) => PC4_inst_n_2,
      Q(1) => PC4_inst_n_3,
      Q(0) => PC4_inst_n_4,
      \comp_41__9\ => \comp_41__9\,
      \count_col_reg[3]\(3 downto 0) => \count_col_reg[3]\(3 downto 0),
      \count_col_reg[3]_0\(0) => \count_col_reg[3]_0\(0),
      ofmap_RELU_IBUF(3 downto 0) => ofmap_RELU_IBUF(3 downto 0),
      valid_comp_1_out => valid_comp_1_out,
      valid_comp_2_out => valid_comp_2_out,
      valid_comp_3_out => valid_comp_3_out,
      valid_comp_4_out => valid_comp_4_out,
      valid_data_IBUF => valid_data_IBUF,
      valid_pooling_OBUF => valid_pooling_OBUF
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Pooling_TOP is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    ofmap_RELU : in STD_LOGIC_VECTOR ( 3 downto 0 );
    valid_data : in STD_LOGIC;
    pooling_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    valid_pooling : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Pooling_TOP : entity is true;
end Pooling_TOP;

architecture STRUCTURE of Pooling_TOP is
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal \comp_11__5\ : STD_LOGIC;
  signal comp_1_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \comp_21__5\ : STD_LOGIC;
  signal comp_2_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \comp_31__8\ : STD_LOGIC;
  signal comp_3_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \comp_41__9\ : STD_LOGIC;
  signal comp_4_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ofmap_RELU_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal pooling_out_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rst_IBUF : STD_LOGIC;
  signal valid_comp_1_in : STD_LOGIC;
  signal valid_comp_2_in : STD_LOGIC;
  signal valid_comp_3_in : STD_LOGIC;
  signal valid_comp_4_in : STD_LOGIC;
  signal valid_data_IBUF : STD_LOGIC;
  signal valid_pooling_OBUF : STD_LOGIC;
begin
Comparator_TOP_inst: entity work.PC_TOP
     port map (
      AR(0) => rst_IBUF,
      CLK => clk_IBUF_BUFG,
      D(3 downto 0) => comp_1_in(3 downto 0),
      E(0) => valid_comp_1_in,
      \comp_11__5\ => \comp_11__5\,
      \comp_21__5\ => \comp_21__5\,
      \comp_31__8\ => \comp_31__8\,
      \comp_41__9\ => \comp_41__9\,
      \count_col_reg[1]\(3 downto 0) => comp_2_in(3 downto 0),
      \count_col_reg[1]_0\(0) => valid_comp_2_in,
      \count_col_reg[1]_1\(3 downto 0) => comp_3_in(3 downto 0),
      \count_col_reg[1]_2\(0) => valid_comp_3_in,
      \count_col_reg[3]\(3 downto 0) => comp_4_in(3 downto 0),
      \count_col_reg[3]_0\(0) => valid_comp_4_in,
      ofmap_RELU_IBUF(3 downto 0) => ofmap_RELU_IBUF(3 downto 0),
      pooling_out_OBUF(3 downto 0) => pooling_out_OBUF(3 downto 0),
      valid_data_IBUF => valid_data_IBUF,
      valid_pooling_OBUF => valid_pooling_OBUF
    );
Controller_inst: entity work.Pooling_Controller
     port map (
      AR(0) => rst_IBUF,
      CLK => clk_IBUF_BUFG,
      D(3 downto 0) => comp_1_in(3 downto 0),
      E(0) => valid_comp_1_in,
      \comp_11__5\ => \comp_11__5\,
      \comp_21__5\ => \comp_21__5\,
      \comp_31__8\ => \comp_31__8\,
      \comp_41__9\ => \comp_41__9\,
      \count_reg[0]\(0) => valid_comp_4_in,
      \count_reg[0]_0\(0) => valid_comp_3_in,
      \count_reg[0]_1\(0) => valid_comp_2_in,
      \max_calc_reg[3]\(3 downto 0) => comp_4_in(3 downto 0),
      \max_calc_reg[3]_0\(3 downto 0) => comp_3_in(3 downto 0),
      \max_calc_reg[3]_1\(3 downto 0) => comp_2_in(3 downto 0),
      ofmap_RELU_IBUF(3 downto 0) => ofmap_RELU_IBUF(3 downto 0),
      valid_data_IBUF => valid_data_IBUF
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
\ofmap_RELU_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ofmap_RELU(0),
      O => ofmap_RELU_IBUF(0)
    );
\ofmap_RELU_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ofmap_RELU(1),
      O => ofmap_RELU_IBUF(1)
    );
\ofmap_RELU_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ofmap_RELU(2),
      O => ofmap_RELU_IBUF(2)
    );
\ofmap_RELU_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ofmap_RELU(3),
      O => ofmap_RELU_IBUF(3)
    );
\pooling_out_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => pooling_out_OBUF(0),
      O => pooling_out(0)
    );
\pooling_out_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => pooling_out_OBUF(1),
      O => pooling_out(1)
    );
\pooling_out_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => pooling_out_OBUF(2),
      O => pooling_out(2)
    );
\pooling_out_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => pooling_out_OBUF(3),
      O => pooling_out(3)
    );
rst_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => rst,
      O => rst_IBUF
    );
valid_data_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => valid_data,
      O => valid_data_IBUF
    );
valid_pooling_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => valid_pooling_OBUF,
      O => valid_pooling
    );
end STRUCTURE;
