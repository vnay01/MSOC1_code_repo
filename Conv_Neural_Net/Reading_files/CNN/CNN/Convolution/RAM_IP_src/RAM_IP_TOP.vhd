----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/09/2018 03:11:15 PM
-- Design Name: 
-- Module Name: RAM_IP_TOP - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created Shenbagaraman Ramakrishnan
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.STD_LOGIC_unsigned.ALL;
use std.textio.all;
use std.standard.all;

entity RAM_IP_TOP is
    Port (
            clk         : in std_logic;
            data_1      : in std_logic_vector(63 downto 0);
            data_2      : in std_logic_vector(63 downto 0);
            data_3      : in std_logic_vector(63 downto 0);
            data_4      : in std_logic_vector(63 downto 0);
            address_1   : in std_logic_vector(3 downto 0);
            address_2   : in std_logic_vector(3 downto 0);
            address_3   : in std_logic_vector(3 downto 0);
            address_4   : in std_logic_vector(3 downto 0);
            csn_1       : in std_logic;
            csn_2       : in std_logic;
            csn_3       : in std_logic;
            csn_4       : in std_logic;        
            wen_1       : in std_logic;
            wen_2       : in std_logic;
            wen_3       : in std_logic;
            wen_4       : in std_logic;
            count_def   : in unsigned(1 downto 0);
            data_out_1  : out std_logic_vector(63 downto 0);
            data_out_2  : out std_logic_vector(63 downto 0);
            data_out_3  : out std_logic_vector(63 downto 0);
            data_out_4  : out std_logic_vector(63 downto 0)
                );
end RAM_IP_TOP;

architecture RAM_IP_TOP_arch of RAM_IP_TOP is

component dist_mem_gen_0 is 
port (
      a   : in std_logic_vector(3 DOWNTO 0);
      d   : in std_logic_vector(63 DOWNTO 0);
      clk : in std_logic;
      we  : in std_logic;
      spo : out std_logic_vector(63 DOWNTO 0)
      );
end component;

component dist_mem_gen_1 is 
port (
      a   : in std_logic_vector(3 DOWNTO 0);
      d   : in std_logic_vector(63 DOWNTO 0);
      clk : in std_logic;
      we  : in std_logic;
      spo : out std_logic_vector(63 DOWNTO 0)
      );
end component;

component dist_mem_gen_2 is 
port (
      a   : in std_logic_vector(3 DOWNTO 0);
      d   : in std_logic_vector(63 DOWNTO 0);
      clk : in std_logic;
      we  : in std_logic;
      spo : out std_logic_vector(63 DOWNTO 0)
      );
end component;

component dist_mem_gen_3 is 
port (
      a   : in std_logic_vector(3 DOWNTO 0);
      d   : in std_logic_vector(63 DOWNTO 0);
      clk : in std_logic;
      we  : in std_logic;
      spo : out std_logic_vector(63 DOWNTO 0)
      );
end component;

signal data_out_1_top,data_out_2_top,data_out_3_top,data_out_4_top : std_logic_vector (63 downto 0);

begin

RAM_1_inst: dist_mem_gen_0
port map (
      a   => address_1,
      d   => data_1,
      clk => clk,
      we  => wen_1,
      spo => data_out_1_top
      );

RAM_2_inst: dist_mem_gen_1
port map (
      a   => address_2,
      d   => data_2,
      clk => clk,
      we  => wen_2,
      spo => data_out_2_top
      );

RAM_3_inst: dist_mem_gen_2
port map (
      a   => address_3,
      d   => data_3,
      clk => clk,
      we  => wen_3,
      spo => data_out_3_top
      );

RAM_4_inst: dist_mem_gen_3
port map (
      a   => address_4,
      d   => data_4,
      clk => clk,
      we  => wen_4,
      spo => data_out_4_top
      );
 
 data: process(count_def,data_out_1_top,data_out_2_top,data_out_3_top,data_out_4_top)
          begin
          
              if(count_def = 0) then
                  data_out_1 <= data_out_1_top;
                  data_out_2 <= data_out_2_top;
                  data_out_3 <= data_out_3_top;
                  data_out_4 <= data_out_4_top;
              elsif(count_def = 1) then
                  data_out_1 <= data_out_2_top;
                  data_out_2 <= data_out_3_top;
                  data_out_3 <= data_out_4_top;
                  data_out_4 <= data_out_1_top;
              elsif(count_def = 2) then
                  data_out_1 <= data_out_3_top;
                  data_out_2 <= data_out_4_top;
                  data_out_3 <= data_out_1_top;
                  data_out_4 <= data_out_2_top;
              else
                  data_out_1 <= data_out_4_top;
                  data_out_2 <= data_out_1_top;
                  data_out_3 <= data_out_2_top;
                  data_out_4 <= data_out_3_top;
              end if;
     end process data; 

end RAM_IP_TOP_arch;
