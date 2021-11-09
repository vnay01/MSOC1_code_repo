-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.1 (win64) Build 1538259 Fri Apr  8 15:45:27 MDT 2016
-- Date        : Mon Oct 15 15:22:43 2018
-- Host        : pax-15 running 64-bit major release  (build 9200)
-- Command     : write_vhdl RELU.vhdl
-- Design      : RELU
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity RELU_v1 is
  port (
    ofmap_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    valid_ofmap : in STD_LOGIC;
    ofmap_relu : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of RELU_v1 : entity is true;
end RELU_v1;

architecture STRUCTURE of RELU_v1 is
  signal ofmap_in_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal ofmap_relu_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal valid_ofmap_IBUF : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ofmap_relu_OBUF[0]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ofmap_relu_OBUF[1]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ofmap_relu_OBUF[2]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ofmap_relu_OBUF[3]_inst_i_1\ : label is "soft_lutpair1";
begin
\ofmap_in_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ofmap_in(0),
      O => ofmap_in_IBUF(0)
    );
\ofmap_in_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ofmap_in(1),
      O => ofmap_in_IBUF(1)
    );
\ofmap_in_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ofmap_in(2),
      O => ofmap_in_IBUF(2)
    );
\ofmap_in_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => ofmap_in(3),
      O => ofmap_in_IBUF(3)
    );
\ofmap_relu_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ofmap_relu_OBUF(0),
      O => ofmap_relu(0)
    );
\ofmap_relu_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => ofmap_in_IBUF(0),
      I1 => valid_ofmap_IBUF,
      I2 => ofmap_in_IBUF(3),
      O => ofmap_relu_OBUF(0)
    );
\ofmap_relu_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ofmap_relu_OBUF(1),
      O => ofmap_relu(1)
    );
\ofmap_relu_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => ofmap_in_IBUF(1),
      I1 => valid_ofmap_IBUF,
      I2 => ofmap_in_IBUF(3),
      O => ofmap_relu_OBUF(1)
    );
\ofmap_relu_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ofmap_relu_OBUF(2),
      O => ofmap_relu(2)
    );
\ofmap_relu_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2A"
    )
        port map (
      I0 => ofmap_in_IBUF(2),
      I1 => valid_ofmap_IBUF,
      I2 => ofmap_in_IBUF(3),
      O => ofmap_relu_OBUF(2)
    );
\ofmap_relu_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => ofmap_relu_OBUF(3),
      O => ofmap_relu(3)
    );
\ofmap_relu_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => ofmap_in_IBUF(3),
      I1 => valid_ofmap_IBUF,
      O => ofmap_relu_OBUF(3)
    );
valid_ofmap_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => valid_ofmap,
      O => valid_ofmap_IBUF
    );
end STRUCTURE;
