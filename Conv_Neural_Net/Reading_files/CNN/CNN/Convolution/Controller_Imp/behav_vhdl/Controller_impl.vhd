-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
-- Date        : Mon Oct 15 23:38:24 2018
-- Host        : pax-15 running 64-bit major release  (build 9200)
-- Command     : write_vhdl Controller_impl.vhd
-- Design      : CONV_Controller
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity CONV_Controller is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    start_in : in STD_LOGIC;
    data_1 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    data_2 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    data_3 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    data_4 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    address_1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    address_2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    address_3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    address_4 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    csn_1 : out STD_LOGIC;
    csn_2 : out STD_LOGIC;
    csn_3 : out STD_LOGIC;
    csn_4 : out STD_LOGIC;
    wen_1 : out STD_LOGIC;
    wen_2 : out STD_LOGIC;
    wen_3 : out STD_LOGIC;
    wen_4 : out STD_LOGIC;
    finish : out STD_LOGIC;
    count_def : out STD_LOGIC_VECTOR ( 1 downto 0 );
    count_PE : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of CONV_Controller : entity is true;
end CONV_Controller;

architecture STRUCTURE of CONV_Controller is
  signal address_1_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal address_2_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal address_3_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal address_4_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal count_PE_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal count_def_OBUF : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \count_read_RAM[0]_i_1_n_0\ : STD_LOGIC;
  signal \count_read_RAM[1]_i_1_n_0\ : STD_LOGIC;
  signal \count_row[0]_i_1_n_0\ : STD_LOGIC;
  signal \count_row[1]_i_1_n_0\ : STD_LOGIC;
  signal \count_row[2]_i_1_n_0\ : STD_LOGIC;
  signal \count_row[3]_i_1_n_0\ : STD_LOGIC;
  signal \count_row[4]_i_1_n_0\ : STD_LOGIC;
  signal \count_row[5]_i_1_n_0\ : STD_LOGIC;
  signal \count_row[6]_i_1_n_0\ : STD_LOGIC;
  signal \count_row[6]_i_2_n_0\ : STD_LOGIC;
  signal \count_row[7]_i_1_n_0\ : STD_LOGIC;
  signal \count_row[7]_i_2_n_0\ : STD_LOGIC;
  signal curr_state_out : STD_LOGIC;
  signal curr_state_out_i_2_n_0 : STD_LOGIC;
  signal curr_state_out_i_3_n_0 : STD_LOGIC;
  signal curr_state_out_i_4_n_0 : STD_LOGIC;
  signal curr_state_out_i_5_n_0 : STD_LOGIC;
  signal curr_state_out_i_6_n_0 : STD_LOGIC;
  signal curr_state_out_i_7_n_0 : STD_LOGIC;
  signal curr_state_out_i_8_n_0 : STD_LOGIC;
  signal finish_OBUF : STD_LOGIC;
  signal finish_del : STD_LOGIC;
  signal finish_del_2 : STD_LOGIC;
  signal finish_write : STD_LOGIC;
  signal next_state_out : STD_LOGIC;
  signal \reg_1_read[1]_i_1_n_0\ : STD_LOGIC;
  signal \reg_1_read[3]_i_1_n_0\ : STD_LOGIC;
  signal \reg_1_read[3]_i_2_n_0\ : STD_LOGIC;
  signal reg_1_read_next : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \reg_2_read[1]_i_1_n_0\ : STD_LOGIC;
  signal \reg_2_read[3]_i_1_n_0\ : STD_LOGIC;
  signal \reg_2_read[3]_i_2_n_0\ : STD_LOGIC;
  signal reg_2_read_next : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \reg_3_read[1]_i_1_n_0\ : STD_LOGIC;
  signal \reg_3_read[3]_i_1_n_0\ : STD_LOGIC;
  signal \reg_3_read[3]_i_2_n_0\ : STD_LOGIC;
  signal reg_3_read_next : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \reg_4_read[1]_i_1_n_0\ : STD_LOGIC;
  signal \reg_4_read[3]_i_1_n_0\ : STD_LOGIC;
  signal \reg_4_read[3]_i_2_n_0\ : STD_LOGIC;
  signal reg_4_read_next : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal rst_IBUF : STD_LOGIC;
  signal start_in_IBUF : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_read_RAM[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \count_read_RAM[1]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \count_row[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count_row[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count_row[4]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \count_row[5]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \count_row[6]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of curr_state_out_i_1 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of curr_state_out_i_6 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of curr_state_out_i_8 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of finish_del_2_i_1 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \reg_1_read[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \reg_1_read[1]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \reg_1_read[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \reg_1_read[3]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \reg_2_read[1]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \reg_2_read[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \reg_2_read[3]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \reg_3_read[0]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \reg_3_read[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \reg_3_read[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \reg_3_read[3]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \reg_4_read[0]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \reg_4_read[1]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \reg_4_read[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \reg_4_read[3]_i_2\ : label is "soft_lutpair0";
begin
\address_1_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(0),
      O => address_1(0)
    );
\address_1_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(1),
      O => address_1(1)
    );
\address_1_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(2),
      O => address_1(2)
    );
\address_1_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(3),
      O => address_1(3)
    );
\address_2_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_2_OBUF(0),
      O => address_2(0)
    );
\address_2_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_2_OBUF(1),
      O => address_2(1)
    );
\address_2_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_2_OBUF(2),
      O => address_2(2)
    );
\address_2_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_2_OBUF(3),
      O => address_2(3)
    );
\address_3_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_3_OBUF(0),
      O => address_3(0)
    );
\address_3_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_3_OBUF(1),
      O => address_3(1)
    );
\address_3_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_3_OBUF(2),
      O => address_3(2)
    );
\address_3_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_3_OBUF(3),
      O => address_3(3)
    );
\address_4_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_4_OBUF(0),
      O => address_4(0)
    );
\address_4_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_4_OBUF(1),
      O => address_4(1)
    );
\address_4_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_4_OBUF(2),
      O => address_4(2)
    );
\address_4_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_4_OBUF(3),
      O => address_4(3)
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
\count_PE_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_PE_OBUF(0),
      O => count_PE(0)
    );
\count_PE_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_PE_OBUF(1),
      O => count_PE(1)
    );
\count_PE_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_PE_OBUF(2),
      O => count_PE(2)
    );
\count_PE_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_PE_OBUF(3),
      O => count_PE(3)
    );
\count_PE_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_PE_OBUF(4),
      O => count_PE(4)
    );
\count_PE_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_PE_OBUF(5),
      O => count_PE(5)
    );
\count_PE_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_PE_OBUF(6),
      O => count_PE(6)
    );
\count_PE_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_PE_OBUF(7),
      O => count_PE(7)
    );
\count_def_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_def_OBUF(0),
      O => count_def(0)
    );
\count_def_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => count_def_OBUF(1),
      O => count_def(1)
    );
\count_read_RAM[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => curr_state_out_i_2_n_0,
      I1 => curr_state_out_i_3_n_0,
      I2 => count_def_OBUF(0),
      O => \count_read_RAM[0]_i_1_n_0\
    );
\count_read_RAM[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => count_def_OBUF(0),
      I1 => curr_state_out_i_3_n_0,
      I2 => curr_state_out_i_2_n_0,
      I3 => count_def_OBUF(1),
      O => \count_read_RAM[1]_i_1_n_0\
    );
\count_read_RAM_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => \count_read_RAM[0]_i_1_n_0\,
      Q => count_def_OBUF(0)
    );
\count_read_RAM_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => \count_read_RAM[1]_i_1_n_0\,
      Q => count_def_OBUF(1)
    );
\count_row[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state_out,
      I1 => count_PE_OBUF(0),
      O => \count_row[0]_i_1_n_0\
    );
\count_row[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0440"
    )
        port map (
      I0 => curr_state_out_i_3_n_0,
      I1 => curr_state_out,
      I2 => count_PE_OBUF(0),
      I3 => count_PE_OBUF(1),
      O => \count_row[1]_i_1_n_0\
    );
\count_row[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04444000"
    )
        port map (
      I0 => curr_state_out_i_3_n_0,
      I1 => curr_state_out,
      I2 => count_PE_OBUF(1),
      I3 => count_PE_OBUF(0),
      I4 => count_PE_OBUF(2),
      O => \count_row[2]_i_1_n_0\
    );
\count_row[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0444444440000000"
    )
        port map (
      I0 => curr_state_out_i_3_n_0,
      I1 => curr_state_out,
      I2 => count_PE_OBUF(2),
      I3 => count_PE_OBUF(0),
      I4 => count_PE_OBUF(1),
      I5 => count_PE_OBUF(3),
      O => \count_row[3]_i_1_n_0\
    );
\count_row[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4004"
    )
        port map (
      I0 => curr_state_out_i_3_n_0,
      I1 => curr_state_out,
      I2 => \count_row[6]_i_2_n_0\,
      I3 => count_PE_OBUF(4),
      O => \count_row[4]_i_1_n_0\
    );
\count_row[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40440400"
    )
        port map (
      I0 => curr_state_out_i_3_n_0,
      I1 => curr_state_out,
      I2 => \count_row[6]_i_2_n_0\,
      I3 => count_PE_OBUF(4),
      I4 => count_PE_OBUF(5),
      O => \count_row[5]_i_1_n_0\
    );
\count_row[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000F70800000000"
    )
        port map (
      I0 => count_PE_OBUF(5),
      I1 => count_PE_OBUF(4),
      I2 => \count_row[6]_i_2_n_0\,
      I3 => count_PE_OBUF(6),
      I4 => curr_state_out_i_3_n_0,
      I5 => curr_state_out,
      O => \count_row[6]_i_1_n_0\
    );
\count_row[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => count_PE_OBUF(3),
      I1 => count_PE_OBUF(1),
      I2 => count_PE_OBUF(0),
      I3 => count_PE_OBUF(2),
      O => \count_row[6]_i_2_n_0\
    );
\count_row[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04444000"
    )
        port map (
      I0 => curr_state_out_i_3_n_0,
      I1 => curr_state_out,
      I2 => count_PE_OBUF(6),
      I3 => \count_row[7]_i_2_n_0\,
      I4 => count_PE_OBUF(7),
      O => \count_row[7]_i_1_n_0\
    );
\count_row[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => count_PE_OBUF(5),
      I1 => count_PE_OBUF(4),
      I2 => count_PE_OBUF(2),
      I3 => count_PE_OBUF(0),
      I4 => count_PE_OBUF(1),
      I5 => count_PE_OBUF(3),
      O => \count_row[7]_i_2_n_0\
    );
\count_row_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => \count_row[0]_i_1_n_0\,
      Q => count_PE_OBUF(0)
    );
\count_row_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => \count_row[1]_i_1_n_0\,
      Q => count_PE_OBUF(1)
    );
\count_row_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => \count_row[2]_i_1_n_0\,
      Q => count_PE_OBUF(2)
    );
\count_row_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => \count_row[3]_i_1_n_0\,
      Q => count_PE_OBUF(3)
    );
\count_row_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => \count_row[4]_i_1_n_0\,
      Q => count_PE_OBUF(4)
    );
\count_row_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => \count_row[5]_i_1_n_0\,
      Q => count_PE_OBUF(5)
    );
\count_row_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => \count_row[6]_i_1_n_0\,
      Q => count_PE_OBUF(6)
    );
\count_row_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => \count_row[7]_i_1_n_0\,
      Q => count_PE_OBUF(7)
    );
csn_1_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => csn_1
    );
csn_2_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => csn_2
    );
csn_3_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => csn_3
    );
csn_4_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => csn_4
    );
curr_state_out_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0EE"
    )
        port map (
      I0 => start_in_IBUF,
      I1 => curr_state_out,
      I2 => curr_state_out_i_2_n_0,
      I3 => curr_state_out_i_3_n_0,
      O => next_state_out
    );
curr_state_out_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFFFFFFFFFFFFF"
    )
        port map (
      I0 => curr_state_out_i_4_n_0,
      I1 => curr_state_out_i_5_n_0,
      I2 => address_4_OBUF(1),
      I3 => address_4_OBUF(0),
      I4 => address_4_OBUF(2),
      I5 => curr_state_out_i_6_n_0,
      O => curr_state_out_i_2_n_0
    );
curr_state_out_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000001000"
    )
        port map (
      I0 => curr_state_out_i_7_n_0,
      I1 => curr_state_out_i_8_n_0,
      I2 => count_PE_OBUF(6),
      I3 => count_PE_OBUF(7),
      I4 => count_PE_OBUF(3),
      I5 => count_PE_OBUF(2),
      O => curr_state_out_i_3_n_0
    );
curr_state_out_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => address_1_OBUF(3),
      I1 => address_4_OBUF(3),
      I2 => curr_state_out,
      I3 => address_2_OBUF(3),
      I4 => address_3_OBUF(3),
      O => curr_state_out_i_4_n_0
    );
curr_state_out_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => address_3_OBUF(1),
      I1 => address_3_OBUF(0),
      I2 => address_3_OBUF(2),
      I3 => address_1_OBUF(1),
      I4 => address_1_OBUF(0),
      I5 => address_1_OBUF(2),
      O => curr_state_out_i_5_n_0
    );
curr_state_out_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => address_2_OBUF(2),
      I1 => address_2_OBUF(0),
      I2 => address_2_OBUF(1),
      O => curr_state_out_i_6_n_0
    );
curr_state_out_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => count_PE_OBUF(4),
      I1 => count_PE_OBUF(5),
      O => curr_state_out_i_7_n_0
    );
curr_state_out_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => count_PE_OBUF(1),
      I1 => count_PE_OBUF(0),
      O => curr_state_out_i_8_n_0
    );
curr_state_out_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => next_state_out,
      Q => curr_state_out
    );
\data_1_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(0)
    );
\data_1_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(10)
    );
\data_1_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(11)
    );
\data_1_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(12)
    );
\data_1_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(13)
    );
\data_1_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(14)
    );
\data_1_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(15)
    );
\data_1_OBUF[16]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(16)
    );
\data_1_OBUF[17]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(17)
    );
\data_1_OBUF[18]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(18)
    );
\data_1_OBUF[19]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(19)
    );
\data_1_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(1)
    );
\data_1_OBUF[20]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(20)
    );
\data_1_OBUF[21]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(21)
    );
\data_1_OBUF[22]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(22)
    );
\data_1_OBUF[23]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(23)
    );
\data_1_OBUF[24]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(24)
    );
\data_1_OBUF[25]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(25)
    );
\data_1_OBUF[26]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(26)
    );
\data_1_OBUF[27]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(27)
    );
\data_1_OBUF[28]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(28)
    );
\data_1_OBUF[29]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(29)
    );
\data_1_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(2)
    );
\data_1_OBUF[30]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(30)
    );
\data_1_OBUF[31]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(31)
    );
\data_1_OBUF[32]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(32)
    );
\data_1_OBUF[33]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(33)
    );
\data_1_OBUF[34]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(34)
    );
\data_1_OBUF[35]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(35)
    );
\data_1_OBUF[36]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(36)
    );
\data_1_OBUF[37]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(37)
    );
\data_1_OBUF[38]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(38)
    );
\data_1_OBUF[39]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(39)
    );
\data_1_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(3)
    );
\data_1_OBUF[40]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(40)
    );
\data_1_OBUF[41]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(41)
    );
\data_1_OBUF[42]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(42)
    );
\data_1_OBUF[43]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(43)
    );
\data_1_OBUF[44]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(44)
    );
\data_1_OBUF[45]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(45)
    );
\data_1_OBUF[46]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(46)
    );
\data_1_OBUF[47]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(47)
    );
\data_1_OBUF[48]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(48)
    );
\data_1_OBUF[49]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(49)
    );
\data_1_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(4)
    );
\data_1_OBUF[50]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(50)
    );
\data_1_OBUF[51]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(51)
    );
\data_1_OBUF[52]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(52)
    );
\data_1_OBUF[53]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(53)
    );
\data_1_OBUF[54]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(54)
    );
\data_1_OBUF[55]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(55)
    );
\data_1_OBUF[56]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(56)
    );
\data_1_OBUF[57]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(57)
    );
\data_1_OBUF[58]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(58)
    );
\data_1_OBUF[59]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(59)
    );
\data_1_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(5)
    );
\data_1_OBUF[60]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(60)
    );
\data_1_OBUF[61]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(61)
    );
\data_1_OBUF[62]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(62)
    );
\data_1_OBUF[63]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(63)
    );
\data_1_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(6)
    );
\data_1_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(7)
    );
\data_1_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(8)
    );
\data_1_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_1(9)
    );
\data_2_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(0)
    );
\data_2_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(10)
    );
\data_2_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(11)
    );
\data_2_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(12)
    );
\data_2_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(13)
    );
\data_2_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(14)
    );
\data_2_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(15)
    );
\data_2_OBUF[16]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(16)
    );
\data_2_OBUF[17]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(17)
    );
\data_2_OBUF[18]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(18)
    );
\data_2_OBUF[19]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(19)
    );
\data_2_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(1)
    );
\data_2_OBUF[20]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(20)
    );
\data_2_OBUF[21]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(21)
    );
\data_2_OBUF[22]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(22)
    );
\data_2_OBUF[23]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(23)
    );
\data_2_OBUF[24]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(24)
    );
\data_2_OBUF[25]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(25)
    );
\data_2_OBUF[26]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(26)
    );
\data_2_OBUF[27]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(27)
    );
\data_2_OBUF[28]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(28)
    );
\data_2_OBUF[29]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(29)
    );
\data_2_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(2)
    );
\data_2_OBUF[30]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(30)
    );
\data_2_OBUF[31]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(31)
    );
\data_2_OBUF[32]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(32)
    );
\data_2_OBUF[33]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(33)
    );
\data_2_OBUF[34]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(34)
    );
\data_2_OBUF[35]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(35)
    );
\data_2_OBUF[36]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(36)
    );
\data_2_OBUF[37]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(37)
    );
\data_2_OBUF[38]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(38)
    );
\data_2_OBUF[39]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(39)
    );
\data_2_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(3)
    );
\data_2_OBUF[40]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(40)
    );
\data_2_OBUF[41]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(41)
    );
\data_2_OBUF[42]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(42)
    );
\data_2_OBUF[43]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(43)
    );
\data_2_OBUF[44]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(44)
    );
\data_2_OBUF[45]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(45)
    );
\data_2_OBUF[46]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(46)
    );
\data_2_OBUF[47]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(47)
    );
\data_2_OBUF[48]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(48)
    );
\data_2_OBUF[49]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(49)
    );
\data_2_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(4)
    );
\data_2_OBUF[50]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(50)
    );
\data_2_OBUF[51]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(51)
    );
\data_2_OBUF[52]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(52)
    );
\data_2_OBUF[53]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(53)
    );
\data_2_OBUF[54]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(54)
    );
\data_2_OBUF[55]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(55)
    );
\data_2_OBUF[56]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(56)
    );
\data_2_OBUF[57]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(57)
    );
\data_2_OBUF[58]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(58)
    );
\data_2_OBUF[59]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(59)
    );
\data_2_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(5)
    );
\data_2_OBUF[60]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(60)
    );
\data_2_OBUF[61]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(61)
    );
\data_2_OBUF[62]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(62)
    );
\data_2_OBUF[63]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(63)
    );
\data_2_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(6)
    );
\data_2_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(7)
    );
\data_2_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(8)
    );
\data_2_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_2(9)
    );
\data_3_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(0)
    );
\data_3_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(10)
    );
\data_3_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(11)
    );
\data_3_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(12)
    );
\data_3_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(13)
    );
\data_3_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(14)
    );
\data_3_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(15)
    );
\data_3_OBUF[16]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(16)
    );
\data_3_OBUF[17]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(17)
    );
\data_3_OBUF[18]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(18)
    );
\data_3_OBUF[19]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(19)
    );
\data_3_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(1)
    );
\data_3_OBUF[20]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(20)
    );
\data_3_OBUF[21]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(21)
    );
\data_3_OBUF[22]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(22)
    );
\data_3_OBUF[23]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(23)
    );
\data_3_OBUF[24]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(24)
    );
\data_3_OBUF[25]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(25)
    );
\data_3_OBUF[26]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(26)
    );
\data_3_OBUF[27]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(27)
    );
\data_3_OBUF[28]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(28)
    );
\data_3_OBUF[29]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(29)
    );
\data_3_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(2)
    );
\data_3_OBUF[30]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(30)
    );
\data_3_OBUF[31]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(31)
    );
\data_3_OBUF[32]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(32)
    );
\data_3_OBUF[33]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(33)
    );
\data_3_OBUF[34]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(34)
    );
\data_3_OBUF[35]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(35)
    );
\data_3_OBUF[36]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(36)
    );
\data_3_OBUF[37]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(37)
    );
\data_3_OBUF[38]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(38)
    );
\data_3_OBUF[39]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(39)
    );
\data_3_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(3)
    );
\data_3_OBUF[40]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(40)
    );
\data_3_OBUF[41]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(41)
    );
\data_3_OBUF[42]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(42)
    );
\data_3_OBUF[43]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(43)
    );
\data_3_OBUF[44]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(44)
    );
\data_3_OBUF[45]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(45)
    );
\data_3_OBUF[46]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(46)
    );
\data_3_OBUF[47]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(47)
    );
\data_3_OBUF[48]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(48)
    );
\data_3_OBUF[49]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(49)
    );
\data_3_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(4)
    );
\data_3_OBUF[50]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(50)
    );
\data_3_OBUF[51]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(51)
    );
\data_3_OBUF[52]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(52)
    );
\data_3_OBUF[53]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(53)
    );
\data_3_OBUF[54]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(54)
    );
\data_3_OBUF[55]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(55)
    );
\data_3_OBUF[56]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(56)
    );
\data_3_OBUF[57]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(57)
    );
\data_3_OBUF[58]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(58)
    );
\data_3_OBUF[59]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(59)
    );
\data_3_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(5)
    );
\data_3_OBUF[60]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(60)
    );
\data_3_OBUF[61]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(61)
    );
\data_3_OBUF[62]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(62)
    );
\data_3_OBUF[63]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(63)
    );
\data_3_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(6)
    );
\data_3_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(7)
    );
\data_3_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(8)
    );
\data_3_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_3(9)
    );
\data_4_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(0)
    );
\data_4_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(10)
    );
\data_4_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(11)
    );
\data_4_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(12)
    );
\data_4_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(13)
    );
\data_4_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(14)
    );
\data_4_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(15)
    );
\data_4_OBUF[16]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(16)
    );
\data_4_OBUF[17]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(17)
    );
\data_4_OBUF[18]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(18)
    );
\data_4_OBUF[19]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(19)
    );
\data_4_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(1)
    );
\data_4_OBUF[20]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(20)
    );
\data_4_OBUF[21]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(21)
    );
\data_4_OBUF[22]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(22)
    );
\data_4_OBUF[23]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(23)
    );
\data_4_OBUF[24]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(24)
    );
\data_4_OBUF[25]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(25)
    );
\data_4_OBUF[26]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(26)
    );
\data_4_OBUF[27]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(27)
    );
\data_4_OBUF[28]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(28)
    );
\data_4_OBUF[29]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(29)
    );
\data_4_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(2)
    );
\data_4_OBUF[30]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(30)
    );
\data_4_OBUF[31]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(31)
    );
\data_4_OBUF[32]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(32)
    );
\data_4_OBUF[33]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(33)
    );
\data_4_OBUF[34]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(34)
    );
\data_4_OBUF[35]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(35)
    );
\data_4_OBUF[36]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(36)
    );
\data_4_OBUF[37]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(37)
    );
\data_4_OBUF[38]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(38)
    );
\data_4_OBUF[39]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(39)
    );
\data_4_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(3)
    );
\data_4_OBUF[40]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(40)
    );
\data_4_OBUF[41]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(41)
    );
\data_4_OBUF[42]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(42)
    );
\data_4_OBUF[43]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(43)
    );
\data_4_OBUF[44]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(44)
    );
\data_4_OBUF[45]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(45)
    );
\data_4_OBUF[46]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(46)
    );
\data_4_OBUF[47]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(47)
    );
\data_4_OBUF[48]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(48)
    );
\data_4_OBUF[49]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(49)
    );
\data_4_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(4)
    );
\data_4_OBUF[50]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(50)
    );
\data_4_OBUF[51]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(51)
    );
\data_4_OBUF[52]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(52)
    );
\data_4_OBUF[53]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(53)
    );
\data_4_OBUF[54]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(54)
    );
\data_4_OBUF[55]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(55)
    );
\data_4_OBUF[56]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(56)
    );
\data_4_OBUF[57]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(57)
    );
\data_4_OBUF[58]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(58)
    );
\data_4_OBUF[59]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(59)
    );
\data_4_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(5)
    );
\data_4_OBUF[60]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(60)
    );
\data_4_OBUF[61]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(61)
    );
\data_4_OBUF[62]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(62)
    );
\data_4_OBUF[63]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(63)
    );
\data_4_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(6)
    );
\data_4_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(7)
    );
\data_4_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(8)
    );
\data_4_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => data_4(9)
    );
finish_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => finish_OBUF,
      O => finish
    );
finish_del_2_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state_out_i_3_n_0,
      I1 => curr_state_out_i_2_n_0,
      O => finish_write
    );
finish_del_2_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => finish_write,
      Q => finish_del_2
    );
finish_del_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => finish_del_2,
      Q => finish_del
    );
finish_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      CLR => rst_IBUF,
      D => finish_del,
      Q => finish_OBUF
    );
\reg_1_read[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state_out,
      I1 => address_1_OBUF(0),
      O => reg_1_read_next(0)
    );
\reg_1_read[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => address_1_OBUF(0),
      I1 => address_1_OBUF(1),
      I2 => curr_state_out,
      O => \reg_1_read[1]_i_1_n_0\
    );
\reg_1_read[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => curr_state_out,
      I1 => address_1_OBUF(1),
      I2 => address_1_OBUF(0),
      I3 => address_1_OBUF(2),
      O => reg_1_read_next(2)
    );
\reg_1_read[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"10FF"
    )
        port map (
      I0 => count_def_OBUF(1),
      I1 => count_def_OBUF(0),
      I2 => curr_state_out_i_3_n_0,
      I3 => curr_state_out,
      O => \reg_1_read[3]_i_1_n_0\
    );
\reg_1_read[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F800000"
    )
        port map (
      I0 => address_1_OBUF(2),
      I1 => address_1_OBUF(0),
      I2 => address_1_OBUF(1),
      I3 => address_1_OBUF(3),
      I4 => curr_state_out,
      O => \reg_1_read[3]_i_2_n_0\
    );
\reg_1_read_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \reg_1_read[3]_i_1_n_0\,
      CLR => rst_IBUF,
      D => reg_1_read_next(0),
      Q => address_1_OBUF(0)
    );
\reg_1_read_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \reg_1_read[3]_i_1_n_0\,
      CLR => rst_IBUF,
      D => \reg_1_read[1]_i_1_n_0\,
      Q => address_1_OBUF(1)
    );
\reg_1_read_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \reg_1_read[3]_i_1_n_0\,
      CLR => rst_IBUF,
      D => reg_1_read_next(2),
      Q => address_1_OBUF(2)
    );
\reg_1_read_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \reg_1_read[3]_i_1_n_0\,
      CLR => rst_IBUF,
      D => \reg_1_read[3]_i_2_n_0\,
      Q => address_1_OBUF(3)
    );
\reg_2_read[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state_out,
      I1 => address_2_OBUF(0),
      O => reg_2_read_next(0)
    );
\reg_2_read[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => address_2_OBUF(0),
      I1 => address_2_OBUF(1),
      I2 => curr_state_out,
      O => \reg_2_read[1]_i_1_n_0\
    );
\reg_2_read[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => curr_state_out,
      I1 => address_2_OBUF(1),
      I2 => address_2_OBUF(0),
      I3 => address_2_OBUF(2),
      O => reg_2_read_next(2)
    );
\reg_2_read[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"20FF"
    )
        port map (
      I0 => count_def_OBUF(0),
      I1 => count_def_OBUF(1),
      I2 => curr_state_out_i_3_n_0,
      I3 => curr_state_out,
      O => \reg_2_read[3]_i_1_n_0\
    );
\reg_2_read[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F800000"
    )
        port map (
      I0 => address_2_OBUF(2),
      I1 => address_2_OBUF(0),
      I2 => address_2_OBUF(1),
      I3 => address_2_OBUF(3),
      I4 => curr_state_out,
      O => \reg_2_read[3]_i_2_n_0\
    );
\reg_2_read_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \reg_2_read[3]_i_1_n_0\,
      CLR => rst_IBUF,
      D => reg_2_read_next(0),
      Q => address_2_OBUF(0)
    );
\reg_2_read_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \reg_2_read[3]_i_1_n_0\,
      CLR => rst_IBUF,
      D => \reg_2_read[1]_i_1_n_0\,
      Q => address_2_OBUF(1)
    );
\reg_2_read_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \reg_2_read[3]_i_1_n_0\,
      CLR => rst_IBUF,
      D => reg_2_read_next(2),
      Q => address_2_OBUF(2)
    );
\reg_2_read_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \reg_2_read[3]_i_1_n_0\,
      CLR => rst_IBUF,
      D => \reg_2_read[3]_i_2_n_0\,
      Q => address_2_OBUF(3)
    );
\reg_3_read[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state_out,
      I1 => address_3_OBUF(0),
      O => reg_3_read_next(0)
    );
\reg_3_read[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => address_3_OBUF(0),
      I1 => address_3_OBUF(1),
      I2 => curr_state_out,
      O => \reg_3_read[1]_i_1_n_0\
    );
\reg_3_read[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => curr_state_out,
      I1 => address_3_OBUF(1),
      I2 => address_3_OBUF(0),
      I3 => address_3_OBUF(2),
      O => reg_3_read_next(2)
    );
\reg_3_read[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"20FF"
    )
        port map (
      I0 => count_def_OBUF(1),
      I1 => count_def_OBUF(0),
      I2 => curr_state_out_i_3_n_0,
      I3 => curr_state_out,
      O => \reg_3_read[3]_i_1_n_0\
    );
\reg_3_read[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F800000"
    )
        port map (
      I0 => address_3_OBUF(2),
      I1 => address_3_OBUF(0),
      I2 => address_3_OBUF(1),
      I3 => address_3_OBUF(3),
      I4 => curr_state_out,
      O => \reg_3_read[3]_i_2_n_0\
    );
\reg_3_read_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \reg_3_read[3]_i_1_n_0\,
      CLR => rst_IBUF,
      D => reg_3_read_next(0),
      Q => address_3_OBUF(0)
    );
\reg_3_read_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \reg_3_read[3]_i_1_n_0\,
      CLR => rst_IBUF,
      D => \reg_3_read[1]_i_1_n_0\,
      Q => address_3_OBUF(1)
    );
\reg_3_read_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \reg_3_read[3]_i_1_n_0\,
      CLR => rst_IBUF,
      D => reg_3_read_next(2),
      Q => address_3_OBUF(2)
    );
\reg_3_read_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \reg_3_read[3]_i_1_n_0\,
      CLR => rst_IBUF,
      D => \reg_3_read[3]_i_2_n_0\,
      Q => address_3_OBUF(3)
    );
\reg_4_read[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => curr_state_out,
      I1 => address_4_OBUF(0),
      O => reg_4_read_next(0)
    );
\reg_4_read[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => address_4_OBUF(0),
      I1 => address_4_OBUF(1),
      I2 => curr_state_out,
      O => \reg_4_read[1]_i_1_n_0\
    );
\reg_4_read[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => curr_state_out,
      I1 => address_4_OBUF(1),
      I2 => address_4_OBUF(0),
      I3 => address_4_OBUF(2),
      O => reg_4_read_next(2)
    );
\reg_4_read[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"80FF"
    )
        port map (
      I0 => count_def_OBUF(1),
      I1 => count_def_OBUF(0),
      I2 => curr_state_out_i_3_n_0,
      I3 => curr_state_out,
      O => \reg_4_read[3]_i_1_n_0\
    );
\reg_4_read[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F800000"
    )
        port map (
      I0 => address_4_OBUF(2),
      I1 => address_4_OBUF(0),
      I2 => address_4_OBUF(1),
      I3 => address_4_OBUF(3),
      I4 => curr_state_out,
      O => \reg_4_read[3]_i_2_n_0\
    );
\reg_4_read_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \reg_4_read[3]_i_1_n_0\,
      CLR => rst_IBUF,
      D => reg_4_read_next(0),
      Q => address_4_OBUF(0)
    );
\reg_4_read_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \reg_4_read[3]_i_1_n_0\,
      CLR => rst_IBUF,
      D => \reg_4_read[1]_i_1_n_0\,
      Q => address_4_OBUF(1)
    );
\reg_4_read_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \reg_4_read[3]_i_1_n_0\,
      CLR => rst_IBUF,
      D => reg_4_read_next(2),
      Q => address_4_OBUF(2)
    );
\reg_4_read_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \reg_4_read[3]_i_1_n_0\,
      CLR => rst_IBUF,
      D => \reg_4_read[3]_i_2_n_0\,
      Q => address_4_OBUF(3)
    );
rst_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => rst,
      O => rst_IBUF
    );
start_in_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => start_in,
      O => start_in_IBUF
    );
wen_1_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => wen_1
    );
wen_2_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => wen_2
    );
wen_3_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => wen_3
    );
wen_4_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => wen_4
    );
end STRUCTURE;
