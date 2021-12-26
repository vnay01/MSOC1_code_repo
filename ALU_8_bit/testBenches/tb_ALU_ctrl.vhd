----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.11.2021 08:46:07
-- Design Name: 
-- Module Name: tb_ALU_ctrl - Behavioral
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

entity tb_ALU_ctrl is
--  Port ( );
end tb_ALU_ctrl;

architecture Behavioral of tb_ALU_ctrl is

component ALU_ctrl is
   port ( clk     : in  std_logic;
          reset   : in  std_logic;  -- connected to CPU reset button on FPGA board
          enter   : in  std_logic;  -- connected to BTNC on FPGA board
          sign    : in  std_logic;  -- connected to BTNL button on FPGA board
          FN      : out std_logic_vector (3 downto 0);   -- ALU functions
          RegCtrl : out std_logic_vector (1 downto 0)   -- Register update control bits
        );
end component;

signal tb_clk : std_logic := '0';
signal tb_reset, tb_enter, tb_sign : std_logic ;
signal tb_FN : std_logic_vector(3 downto 0);
signal tb_RegCtrl : std_logic_vector(1 downto 0);

constant period : time := 100 ns;

begin

DUT: ALU_ctrl
port map(   
        clk => tb_clk,
        reset => tb_reset,
        enter => tb_enter,
        sign => tb_sign,
        FN => tb_FN,
        RegCtrl => tb_RegCtrl
        );
        
process
begin
    tb_clk <= '0';
    wait for period/2;
    tb_clk <= '1';
    wait for period/2;
   end process;
   
tb_reset <= '0';
tb_Enter <= '1',
            '0' after 1 * period,
            '1' after 2 * period,
            '0' after 3 * period,
            '1' after 4 * period,
            '0' after 5 * period,
            '1' after 6 * period;
tb_sign <= '0',
            '1' after 6 * period;

tb_reset <= '1' after 1000 ns;


end Behavioral;
