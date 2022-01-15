
--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use ieee.numeric_std.all;
----use std_logic_unsigned.all;
--library work;
--use work.ALU_components_pack.all; 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity tb_ALU_top is
--  Port ( );
end tb_ALU_top;

architecture Behavioral of tb_ALU_top is

-- components

component ALU_top_for_test is
   port ( clk        : in  std_logic;
          reset      : in  std_logic;
          b_Enter    : in  std_logic;
          b_Sign     : in  std_logic;
          input      : in  std_logic_vector(7 downto 0);
          seven_seg  : out std_logic_vector(6 downto 0);
          anode      : out std_logic_vector(3 downto 0)
        );
end component;

signal tb_clk, tb_Enter, tb_Sign : std_logic;
signal tb_reset_1 : std_logic;
signal tb_input : std_logic_vector(7 downto 0);
signal tb_seven_seg : std_logic_vector(6 downto 0);
signal tb_anode : std_logic_vector(3 downto 0);

constant period : time := 10 ns;

begin

DUT: ALU_top_for_test
    port map(
                clk => tb_clk,
                reset => tb_reset_1,
                b_Enter => tb_Enter,
                b_Sign => tb_Sign,
                input => tb_input,
                seven_seg => tb_seven_seg,
                anode => tb_anode
                );
                
process
begin
    tb_clk <= '0';
    wait for period/2;
    tb_clk <= '1';
    wait for period/2;
   end process;
   
 
-- tb_reset_1 <= '0' ;

   -- *************************
   -- User test data pattern
   -- *************************
 
  tb_input <= "00000101",                    -- A = 5
        "00000111" after 1 * period,   -- A = 7
        "00010001" after 2 * period,   -- A = 17
        "10010001" after 3 * period,   -- A = 145
        "10010100" after 4 * period,   -- A = 148
        "11010101" after 5 * period,   -- A = 213
        "00100011" after 6 * period,   -- A = 35
        "11110010" after 7 * period,   -- A = 242
        "00110001" after 8 * period,   -- A = 49
        "01010101" after 9 * period,  -- A = 85
        "11011011" after 10*period,  -- A = - 91
        "11111111" after 11*period,
        "10011101" after 12*period,
        "11011010" after 13*period,
        "11100011" after 14*period;
--   tb_B <= "00000011",                    -- B = 3
--        "00000011" after 1 * period,   -- B = 3
--        "10010001" after 2 * period,   -- B = 145
--        "01111100" after 3 * period,   -- B = 124
--        "11111001" after 4 * period,   -- B = 249
--        "01101001" after 5 * period,   -- B = 105
--        "01100011" after 6 * period,   -- B = 35
--        "01101000" after 7 * period,   -- B = 104
--        "00101101" after 8 * period,   -- B = 45
--        "00100100" after 9 * period;   -- B = 36
     
     --process to simulate pressing of enter
--   process
--   begin
--   if rising_edge(tb_clk) then
--   tb_Enter <='1'after 100 ns;
--   wait for 200 ns;
--   tb_Enter <= '0';
--   wait for 200 ns;
--   tb_Enter <='1';
--   wait for 200 ns;
--   tb_Enter <= '0';
--   wait on tb_reset;
   
--   end if;
   
--   end process;tb_reset <= '0';
tb_Enter <= '1',                        -- 1st button press
            '0' after 2 * period,
            '1' after 4 * period,       -- 2nd press
            '0' after 6 * period,
            '1' after 8 * period,       -- 3rd press
            '0' after 10 * period,
            '1' after 12 * period,       -- 4th press
            '0' after 14 * period,
            '1' after 16 * period,       -- 5th press
            '0' after 18 * period,
            '1' after 20 * period,      -- 6th press
            '0' after 22 * period,
            '1' after 24 * period,      -- 7th press
            '0' after 26 * period,
            '1' after 28 * period,
            '0' after 30 * period,
            '1' after 32* period,       -- 2nd press
            '0' after 34 * period,
            '1' after 36 * period,       -- 3rd press
            '0' after 38* period,
            '1' after 40* period,       -- 4th press
            '0' after 42* period,
            '1' after 44* period,       -- 5th press
            '0' after 46* period,
            '1' after 48 * period,      -- 6th press
            '0' after 50 * period,
            '1' after 52 * period,      -- 7th press
            '0' after 54 * period,
            '1' after 56 * period,
            '0' after 58 *period;
            
tb_sign <=  '0',
            '1' after 15 * period,
            '0' after 17 *period,
            '1' after 19 * period,
            '0' after 21 *period,
            '1' after 23 * period,
            '0' after 25 *period,
            '1' after 27 * period,
            '0' after 29 *period,
            '1' after 31 * period,
            '0' after 33 *period,
            '1' after 35 * period,
            '0' after 37 *period,
            '1' after 39 * period,
            '0' after 41 *period,
            '1' after 43 * period,
            '0' after 45 *period;
            


tb_reset_1 <= '0','1' after 60*period;


   




end Behavioral;
