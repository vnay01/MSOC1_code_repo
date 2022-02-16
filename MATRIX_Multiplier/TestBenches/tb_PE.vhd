----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.02.2022 10:50:14
-- Design Name: 
-- Module Name: tb_PE - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

library work;
use work.components_pkg.all;


entity tb_PE is
--  Port ( );
end tb_PE;

architecture Behavioral of tb_PE is

component PE_module is
Port (
        reset : std_logic;
        clk : in std_logic;
        enable : in std_logic_vector(2 downto 0);       -- comes from controller
        in_X_odd, in_X_even : in std_logic_vector( 7 downto 0);
        in_A_odd, in_A_even : in std_logic_vector(6 downto 0);
        out_elem : out std_logic_vector(16 downto 0);   -- output element
        done : out std_logic         -- goes to control path
         );
end component;


-- Signal 
signal tb_enable : std_logic_vector(2 downto 0);
signal tb_done : std_logic;
signal tb_in_X_odd, tb_in_X_even : std_logic_vector(7 downto 0);
signal tb_in_A_odd, tb_in_A_even : std_logic_vector(6 downto 0);
signal tb_out_elem : std_logic_vector(16 downto 0);
signal tb_reset: std_logic;
signal tb_clk : std_logic;

constant period : time := 10 ns;


begin
-- Unit under test
--UUT_PE : entity work.PE_module(PE_module)
UUT_PE : PE_module
port map (
            reset => tb_reset,
            clk => tb_clk,
            enable => tb_enable,
            in_X_odd => tb_in_X_odd,
            in_X_even => tb_in_X_even,
            in_A_odd => tb_in_A_odd,
            in_A_even => tb_in_A_even,
            out_elem => tb_out_elem,
            done => tb_done          
                );

-- Clock Process
clock: process           
        begin
        tb_clk <= '0';
        wait for period/2;
        tb_clk <= '1';
        wait for period/2;
        end process;


-- Stimulus
tb_enable <= "000" after 1*period,      -- emulates READ state
             "001" after 2*period,      -- emulates IDLE state
             "010" after 3*period,      -- emulates LOAD state
             "000" after 4*period,      -- emulates READ state
             "011" after 5*period,      -- emulates MULT state
             "100" after 6*period,      -- emulates ADD state
             "101" after 7*period,      -- emulates ADD_2 state
             "110" after 8*period,      -- emulates RAM_STORE state 
             "111" after 9*period;      -- emulates default state

-- GLOBAL Reset
tb_reset <= '1' after 1*period,
            '0' after 2*period;

-- input data
process
begin
wait for 1*period;
for i in 1 to 16 loop
tb_in_X_odd <= std_logic_vector(to_unsigned(i,8)) ;
tb_in_X_even <= std_logic_vector(to_unsigned(i,8)); 
tb_in_A_odd <= std_logic_vector(to_unsigned(i-1,7));
tb_in_A_even <= std_logic_vector(to_unsigned(2*i-1,7));
wait for 1*period;
end loop;
end process;

end Behavioral;
