----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vinay Singh
-- 
-- Create Date: 07.02.2022 21:34:12
-- Design Name: Multiplier Unit
-- Module Name: tb_MU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies:
--              1) CL_adder
--              2) multiplier
-- Revision: V0.1
-- Revision 0.01 - File Created
-- Additional Comments:
--                  Unoptimized design for initial synthesis flow
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.components_pkg.all;


entity tb_MU is
--  Port ( );
end tb_MU;

architecture Behavioral of tb_MU is



--component Multiplier_Unit is
--  Port (
--        clk : in std_logic;
--        in_mult_en : in std_logic;
--        in_X : in std_logic_vector(7 downto 0);
--        in_A : in std_logic_vector(6 downto 0);
--        prod_elem: out std_logic_vector(15 downto 0) );
--end component;

signal tb_in_mult_en: std_logic; 
signal tb_in_X: std_logic_vector(7 downto 0);
signal tb_in_A : std_logic_vector(6 downto 0);
signal tb_prod_elem : std_logic_vector(15 downto 0);
signal tb_clk: std_logic;
signal tb_reset : std_logic;

constant period : time := 10 ns;
constant i : integer := 0 ;

begin

UUT4 : Multiplier_Unit
port map (
            reset => tb_reset,
            clk => tb_clk,
            in_mult_en => tb_in_mult_en,
            in_X => tb_in_X,
            in_A => tb_in_A,
            prod_elem => tb_prod_elem
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
tb_in_mult_en <= '1' after 1*period;
--                 '0' after 4*period,
--                 '1' after 10*period;
tb_reset <= '1' after 1*period,
            '0' after 2*period;
process
begin
for i in 1 to 5 loop
tb_in_A <= std_logic_vector(to_unsigned(i,7)) ;
tb_in_X <= std_logic_vector(to_unsigned(i-1,8));
wait for period;
end loop;

end process;
           
end Behavioral;
