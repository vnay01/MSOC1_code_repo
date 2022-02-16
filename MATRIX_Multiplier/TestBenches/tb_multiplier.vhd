----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.02.2022 19:23:36
-- Design Name: 
-- Module Name: tb_multiplier - Behavioral
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
library work;
use work.components_pkg.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_multiplier is
--  Port ( );
end tb_multiplier;

architecture Behavioral of tb_multiplier is

-- components

component multiplier is
  port (
        in_X : in std_logic_vector(7 downto 0);
        in_A : in std_logic_vector(6 downto 0);
        mult_en : in std_logic; -- may be redundant
        out_P : out std_logic_vector(14 downto 0)
  );
end component;


-- signal definitions

signal tb_clk: std_logic;
signal tb_reset : std_logic;
signal tb_mult_en : std_logic;
signal tb_in_X : std_logic_vector(7 downto 0);
signal tb_in_A : std_logic_vector(6 downto 0);
signal tb_out_P: std_logic_vector(14 downto 0);
signal tb_done : std_logic;

constant period : time := 10 ns;


begin

-- Clock Process
clock: process           
        begin
        tb_clk <= '0';
        wait for period/2;
        tb_clk <= '1';
        wait for period/2;
        end process;

UUT2: multiplier
port map(
          reset => tb_reset,
          in_X => tb_in_X,
          in_A => tb_in_A,
          mult_en =>tb_mult_en,
          out_P => tb_out_P,
          mult_done => tb_done
          );


-- STIMULUS


tb_reset <= '1' after 1*period,
            '0' after 2*period;
 

 tb_in_X <= x"02" after 1* period,
            x"ff" after 6*period;
            
 tb_in_A <= "000" & x"3" after 1* period,
            "000" & x"f" after 7*period;
 
 tb_mult_en <= '0' after 1*period,--                '0' after 4*period,
             '1' after 2*period,
             '0' after 3*period,
             '1' after 4*period,
             '0' after 5*period,
             '1' after 7*period,
             '0' after 10*period;

end Behavioral;
