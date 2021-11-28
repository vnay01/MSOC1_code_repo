----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2021 10:32:12
-- Design Name: 
-- Module Name: tb_synchronizer - Behavioral
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

entity tb_synchronizer is
--  Port ( );
end tb_synchronizer;

architecture Behavioral of tb_synchronizer is

 
component synchronizer is
  port (
         clk     : in std_logic;   
         in_data : in std_logic;
         out_data : out std_logic
          
             );
end component;

signal tb_clk, tb_in_data, tb_out_data: std_logic;
constant period :time := 10 ns;
constant N : integer := 1;



begin

---- component connections ---
DUT_synchronizer: synchronizer
        port map(
                    clk => tb_clk,
                    in_data => tb_in_data,
                    out_data => tb_out_data   
                    );


clock_process : process
    begin
    tb_clk <= '0';
    wait for period;
    tb_clk <= '1';
    wait for period;
    end process;
    
----- user data pattern ----
   
   tb_in_data <= '0',
                 '1' after 2*N*period,
                 '0' after 3*N*period,
                 '1' after 4*N*period,
                 '0' after 6*N*period,
                 '1' after 7*N*period,
                 '0' after 10*N*period;

end Behavioral;
