----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.11.2021 10:20:56
-- Design Name: 
-- Module Name: tb_scan_code_validity - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_arith.all;

entity tb_scan_code_validity is
--  Port ( );
end tb_scan_code_validity;

architecture Behavioral of tb_scan_code_validity is


component scan_code_validity is
	port (
			clk : in std_logic;
			data_in : in std_logic_vector(9 downto 0);
			data_available: in std_logic;                    
			valid_data: out std_logic;
			valid_data_out : out std_logic_vector(7 downto 0)
			);
	end component;
----- signals

signal tb_clk: std_logic;
signal tb_data_in : std_logic_vector(9 downto 0);
signal tb_data_out : std_logic_vector(7 downto 0);
signal tb_data_available : std_logic ;
signal tb_valid_data : std_logic;
constant period :time := 10 ns;
constant data_period :time := 3 ns;
constant N : integer := 1;



begin

DUT: scan_code_validity
port map(
           clk => tb_clk,
           data_in => tb_data_in,
           data_available => tb_data_available,
           valid_data => tb_valid_data,
           valid_data_out => tb_data_out
            );

clock_process : process
    begin
    tb_clk <= '0';
    wait for period;
    tb_clk <= '1';
    wait for period;
    end process;

------ User data generation ----

tb_data_in <= ("00")& x"00" ,                       
              ("00")& x"01" after 2*period,             
              ("00")& x"f0" after 3*period,                 -- break code
              ("00")& x"16" after 4*period,                 -- make code 1
              ("00")& x"1e" after 5*period,                 -- make code 2
              ("00")& x"11" after 6*period,                 
              ("00")& x"f0" after 7*period,                 -- break code
              ("00")& x"1a" after 8*period,                 -- make code Z
              ("00")& x"36" after 9*period,                 -- make code 6
              ("00")& x"26" after 10*period,                -- make code 3
              ("00")& x"25" after 11*period,                -- make code 4
              ("00")& x"2e" after 12*period,                -- make code 5
              ("00")& x"3d" after 13*period,                -- make code 7
              ("00")& x"f0" after 14*period,                -- break code
              ("00")& x"3e" after 15*period,                -- make code 8
              ("00")& x"46" after 16*period,                -- make code 9
              ("00")& x"45" after 17*period;                 -- make code 0
              
         
tb_data_available <= '1' after 2*period;          
              

end Behavioral;
