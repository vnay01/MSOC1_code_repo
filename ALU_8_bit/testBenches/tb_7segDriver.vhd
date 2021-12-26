
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity tb_7segDriver is
--  Port ( );
end tb_7segDriver;

architecture Behavioral of tb_7segDriver is

component x7seg is
    port (
    input : in std_logic_vector(15 downto 0);
    clk: in std_logic ;
    clr : in std_logic;
    seven_seg : out std_logic_vector(6 downto 0);
    anode : out std_logic_vector(3 downto 0);
    dp : out std_logic
             );
end component;

signal tb_clk: std_logic := ('0');          -- connect to clk
signal tb_reset: std_logic := ( '0');       -- connect to clr
--signal tb_sign : std_logic := ('0');
--signal tb_overflow : std_logic := ( '0');
signal tb_BCD_digit : std_logic_vector(15 downto 0) := (others => '0');     -- will be used as input
signal tb_DIGIT_ANODE : std_logic_vector(3 downto 0 ):= (others => '0');      -- connect to an
signal tb_SEGMENT : std_logic_vector(6 downto 0) := (others => '0');        -- connect to a_to_g
signal tb_dp : std_logic ;

constant period : time := 1000 ns ;



begin

DUT: x7seg
port map (
            input => tb_BCD_digit,
            clk => tb_clk,
            clr => tb_reset,
            seven_seg => tb_SEGMENT,
            anode => tb_DIGIT_ANODE,
            dp => tb_dp
            );
-- clock 

process(tb_clk)
begin
    tb_clk <= '0' after period/2;
    tb_clk <= not tb_clk after period/2;
    end process;
    
-- test data patterns:

process(tb_clk, tb_reset, tb_BCD_digit )
begin
  tb_reset <= '1' after period;
  tb_reset <= '0' after period;
--  tb_sign <= '0' after 2*period;
--  tb_overflow <= '0' after 2*period;
  tb_BCD_digit  <= "0000000000000010" after 2*period;
  end process;
  
    


end Behavioral;
