----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vinay Singh
-- 
-- Create Date: 05.02.2022 16:54:50
-- Design Name: 
-- Module Name: tb_MM_controller - Behavioral
-- Project Name: IC Project1
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

entity tb_MM_controller is
--  Port ( );
end tb_MM_controller;

architecture Behavioral of tb_MM_controller is

-- components
component MM_controller is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        done : in std_logic;
        datapath_ctrl : out std_logic_vector( 2 downto 0)      
        );
end component;

-- signal definitions

signal tb_clk: std_logic;
signal tb_reset : std_logic;
signal tb_done : std_logic;
signal tb_datapath_ctrl : std_logic_vector(2 downto 0);

constant period : time := 10 ns;

begin

UUT: MM_controller
    port map (
                clk => tb_clk,
                reset => tb_reset,
                done => tb_done,
                datapath_ctrl => tb_datapath_ctrl 
                );
                
-- Clock Process
clock: process           
        begin
        tb_clk <= '0';
        wait for period/2;
        tb_clk <= '1';
        wait for period/2;
        end process;


-- STIMULUS
-- there are 7 states, so we'll check for all possible transitions

tb_reset <= '1' after 1*period,
            '0' after 2*period;

process
begin
    tb_done <= '1';
    wait for period;
    tb_done <= '0';
    wait for period;
end process;

end Behavioral;
