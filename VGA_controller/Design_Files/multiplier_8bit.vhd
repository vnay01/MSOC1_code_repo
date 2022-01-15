----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.01.2022 15:28:39
-- Design Name: 
-- Module Name: multiplier_8bit - Behavioral
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


entity multiplier_8bit is
port (
        input_A : in std_logic_vector(7 downto 0);
        input_B : in std_logic_vector(7 downto 0);
        result : out std_logic_vector(15 downto 0);  -- not effective at all
        overflow : out std_logic
        );

end multiplier_8bit;

architecture Behavioral of multiplier_8bit is

constant WIDTH : integer := 8;
signal au, bv0, bv1, bv2, bv3, bv4, bv5, bv6, bv7 : unsigned(WIDTH-1 downto 0);
signal pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7: unsigned(WIDTH downto 0);
signal prod : unsigned( 2*WIDTH-1 downto 0);

begin

au <= unsigned(input_A);
bv0 <= (others => input_B(0));
bv1 <= (others => input_B(1));
bv2 <= (others => input_B(2));
bv3 <= (others => input_B(3));
bv4 <= (others => input_B(4));
bv5 <= (others => input_B(5));
bv6 <= (others => input_B(6));
bv7 <= (others => input_B(7));

pp0 <="0" & (bv0 and au);
pp1 <= ("0" & pp0(7 downto 1)) + ("0" & (bv1 and au));
pp2 <= ("0" & pp1(7 downto 1)) + ("0" & (bv2 and au));
pp3 <= ("0" & pp2(7 downto 1)) + ("0" & (bv3 and au));
pp4 <= ("0" & pp3(7 downto 1)) + ("0" & (bv4 and au));
pp5 <= ("0" & pp4(7 downto 1)) + ("0" & (bv5 and au));
pp6 <= ("0" & pp5(7 downto 1)) + ("0" & (bv6 and au));
pp7 <= ("0" & pp6(7 downto 1)) + ("0" & (bv7 and au));

prod <= pp7 & pp6(0) & pp5(0) & pp4(0) & pp3(0) & pp2(0) & pp1(0) & pp0(0);

process
begin
if ( prod > 255 ) then
    overflow <= '1';
    result <="0000000011111111";                        -- brute force unsigned 255
    else
    overflow <= '0';
    result <= std_logic_vector( prod);
    end if;
end process;    




end Behavioral;
