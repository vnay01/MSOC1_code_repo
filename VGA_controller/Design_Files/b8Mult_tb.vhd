----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.01.2022 13:30:09
-- Design Name: 
-- Module Name: b8Mult_tb - Behavioral
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
use work.b8Multiplication_pkg.all;
use work.multiplication_stage_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity b8Mult_tb is
--  Port ( );
end b8Mult_tb;



architecture Behavioral of b8Mult_tb is


    signal res : std_logic_vector(7 downto 0);
    signal overflow : std_logic;

    signal A, B : std_logic_vector(7 downto 0);

    constant period   : time := 2500 ns;
begin
    DUT : b8Mult
    port map( 
        input_A     => A,--"00000010",--: in std_logic_vector(7 downto 0);
        input_B     => B,--"00111100",--: in std_logic_vector(7 downto 0);	
        result      => res,--: out std_logic_vector(7 downto 0);
        overflow    =>overflow --: out std_logic
    );

    -- **************************
    --  Testing result
    -- **************************

    A <= --"00000001";
    "00000001" after 0 * period,
    "00000010" after 1 * period,
    "00000100" after 2 * period,
    "00001000" after 3 * period,
    "00010000" after 4 * period,
    "00100000" after 5 * period,
    "01000000" after 6 * period,
    "10000000" after 7 * period,
    "00000011" after 8 * period,
    "00001010" after 9 * period,
    "00001001" after 10 * period,
    "00010010" after 11 * period;


    B <= "00010101";

end Behavioral;
