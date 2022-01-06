----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2021 10:19:07
-- Design Name: 
-- Module Name: synchronizer - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity synchronizer is
  port (
         clk     : in std_logic;   
         data_in_sync : in std_logic;
         data_out_sync : out std_logic
          
             );
end synchronizer;

architecture Behavioral of synchronizer is

--- Uses 2 D ff for synchronizing 
signal stage1_out, stage2_out: std_logic;

begin

stage1:process(clk, data_in_sync)
    begin
        if rising_edge(clk) then
        stage1_out <= data_in_sync;
        stage2_out <= stage1_out;
        end if;
    end process;
    data_out_sync <= stage2_out;
    
end Behavioral;