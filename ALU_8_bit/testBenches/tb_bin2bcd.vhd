-- trstbench to check bin2bcd

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity tb_bin2bcd is
--  Port ( );
end tb_bin2bcd;

architecture Behavioral of tb_bin2bcd is

component binary2BCD is
   generic ( WIDTH : integer := 8   -- 8 bit binary to BCD
           );
   port ( 
            binary_in : in  std_logic_vector(WIDTH-1 downto 0);  -- binary input width
            BCD_out   : out std_logic_vector(9 downto 0)        -- BCD output, 10 bits [2|4|4] to display a 3 digit BCD value when input has length 8
        );
end component;

signal tb_binary_in : std_logic_vector(7 downto 0) := (others => '0');
signal tb_BCD_out : std_logic_vector(9 downto 0) := (others => '0');
constant period : time := 10 ns;

begin

DUT : binary2BCD
generic map ( WIDTH => 8 )
    port map (
                binary_in => tb_binary_in,
                BCD_out => tb_BCD_out
                );

-- user patterns
tb_binary_in <="00000101",                    -- A = 5
        "00001001" after 1 * period,   -- A = 9
        "00010001" after 2 * period,   -- A = 17
        "10010001" after 3 * period,   -- A = 145
        "10010100" after 4 * period,   -- A = 148
        "11010101" after 5 * period,   -- A = 213
        "00100011" after 6 * period,   -- A = 35
        "11110010" after 7 * period,   -- A = 242
        "00110001" after 8 * period,   -- A = 49
        "01010101" after 9 * period,   -- A = 85
        "00001101" after 10* period,    -- A = 13 
        "00001100" after 11* period;


end Behavioral;
