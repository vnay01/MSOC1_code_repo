----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.11.2021 17:40:33
-- Design Name: 
-- Module Name: tb_modulo_3 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity tb_modulo_3 is

end tb_modulo_3;

architecture beh of tb_modulo_3 is

--component definitions

component mod3 is
	port ( 
			input_data : in std_logic_vector(7 downto 0);
			output_data :out std_logic_vector(1 downto 0)
				);
	end component;

signal tb_x : std_logic_vector(7 downto 0) := (others => '0');
signal tb_output : std_logic_vector(1 downto 0);
--constant i : integer := 8 ;
constant period : time := 1000 ns;


begin
--variable : y : integer;
DUT_modulo : mod3
     port map (
                input_data => tb_x,
                output_data => tb_output
                );
  -- test data
--  for i in 0 to 8 loop
      tb_x <=   "10011011",                         -- pass 155
                "01111001" after 2*period ,              -- pass 121
                "11110100" after 3*period,            -- pass 244
                "01111001" after 4*period;          -- pass 121

end beh;
