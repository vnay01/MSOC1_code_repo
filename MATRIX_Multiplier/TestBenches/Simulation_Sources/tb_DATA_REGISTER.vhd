
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;
use work.test_pkg.all;


entity tb_Top_Design is
--  Port ( );
end tb_Top_Design;

architecture Behavioral of tb_Top_Design is


component Top_Design is
 Port ( 
        clk : in std_logic;
        rst : in std_logic;
        address: in std_logic_vector( 6 downto 0 );                -- address generated from controller
        rom_en : in std_logic;
        rom_element_sel : in std_logic_vector( 3 downto 0 );        -- counts from 0 to 7
        input_data : in std_logic_vector(7 downto 0);
        block_select: in std_logic_vector( 1 downto 0);            -- comes from Controller
        element_select: in std_logic_vector( 3 downto 0);
        out_data_block_1 :out  out_port;   --- output data          -- OBVIOUSLY ALL BLOCKS CAN BE MERGED TO FORM A SINGLE PORT
        out_data_block_2 : out out_port;
        out_data_block_3: out out_port;
        out_data_block_4: out out_port;
        out_data_block_6 : out rom_out;
        out_data_block_7: out rom_out;
        out_data_block_8: out rom_out;
        out_data_block_9: out rom_out;
        out_data_block_10: out rom_out;
        out_data_block_11: out rom_out       
  );
end component;

-- Signals
signal tb_clk : std_logic;
signal tb_rst : std_logic;
signal tb_address : std_logic_vector( 6 downto 0 );
signal tb_input_data: std_logic_vector( 7 downto 0);
signal tb_block_select: std_logic_vector( 1 downto 0);
signal tb_element_select: std_logic_vector( 3 downto 0);
signal tb_out_data_block_1 , tb_out_data_block_2, tb_out_data_block_3 , tb_out_data_block_4 : out_port;
signal tb_out_data_block_6 ,tb_out_data_block_7, tb_out_data_block_8, tb_out_data_block_9, tb_out_data_block_10, tb_out_data_block_11 : rom_out;
signal tb_rom_en : std_logic;
signal tb_rom_element_sel : std_logic_vector( 3 downto 0 );


signal period :time := 20 ns;

begin


--clock: CLOCKGENERATOR 
--  generic map ( clkhalfperiod => 10 ns )
--  port map( clk => tb_clk);

-- clock process
process
begin
    tb_clk <= '0';
    wait for period/2;
    tb_clk <= '1';
    wait for period/2;
    end process;

----- File Read 
-- VIVADO SHUTS DOWN FOR SOME REASON
-- BACK TO BASIC INPUT GENERATION

--Read: FILE_READ
--  generic map (file_name => "testvectors.txt",  width => 8 , datadelay => 0 ns)
--  port map (
--            CLK => tb_clk,
--            RESET => tb_rst,
--            Q => tb_input_data
--            );
tb_input_data <= x"00" after 2*period,
                 x"01" after 3*period,
                 x"02" after 4*period,
                 x"03" after 5*period,
                 x"04" after 6*period,
                 x"05" after 7*period,
                 x"06" after 8*period,
                 x"07" after 9*period,
                 x"08" after 10*period,
                 x"09" after 11*period,
                 x"0a" after 12*period,
                 x"0b" after 13*period,
                 x"0c" after 14*period,
                 x"0d" after 15*period,
                 x"0e" after 16*period,
                 x"0f" after 17*period,
                 x"10" after 18*period,
                 x"11" after 19*period,
                 x"12" after 20*period,
                 x"13" after 21*period,
                 x"14" after 22*period,
                 x"15" after 23*period,
                 x"16" after 24*period,
                 x"17" after 25*period,
                 x"18" after 26*period,
                 x"19" after 27*period,
                 x"1a" after 28*period,
                 x"1b" after 29*period,
                 x"1c" after 30*period,
                 x"1d" after 31*period,
                 x"1e" after 32*period,
                 x"1f" after 33*period,                 
                 x"20" after 34*period,
                 x"21" after 35*period,
                 x"22" after 36*period,
                 x"23" after 37*period,
                 x"24" after 38*period,
                 x"25" after 39*period,
                 x"26" after 40*period,
                 x"27" after 41*period,
                 x"28" after 42*period,
                 x"29" after 43*period,
                 x"2a" after 44*period,
                 x"2b" after 45*period;                 

----- DUT
DUT_1: Top_Design
 Port map ( 
        clk => tb_clk,
        rst => tb_rst,
        address => tb_address,
        rom_en => tb_rom_en,
        rom_element_sel => tb_rom_element_sel,
        input_data => tb_input_data,
        block_select => tb_block_select,
        element_select => tb_element_select,
        out_data_block_1 => tb_out_data_block_1,
        out_data_block_2 => tb_out_data_block_2,
        out_data_block_3 => tb_out_data_block_3,
        out_data_block_4 => tb_out_data_block_4,
        out_data_block_6 => tb_out_data_block_6,
        out_data_block_7 => tb_out_data_block_7,
        out_data_block_8 => tb_out_data_block_8,
        out_data_block_9 => tb_out_data_block_9,
        out_data_block_10 => tb_out_data_block_10,
        out_data_block_11 => tb_out_data_block_11              
  );

-- Test Stimulus
-- Simulate Global reset
tb_rst <= '1' after 1*period,
            '0' after 2*period,
            '1' after 100*period;
 
-- Simulate Block selection 
-- Each Block has to remain selected for at least 16 input cycles ( i.e time + 16 )

tb_block_select <= "00" after 2*period,         
                    "01" after 18*period,
                    "10" after 34*period,
                    "11" after 50*period;
             
-- Simulate control signal for generating the address of elements
-- Use a for loop for generating signals
tb_element_select <= x"0" after 2*period,
                     x"1" after 3*period,
                     x"2" after 4*period,
                     x"3" after 5*period,
                     x"4" after 6*period,
                     x"5" after 7*period,
                     x"6" after 8*period,
                     x"7" after 9*period,
                     x"8" after 10*period,
                     x"9" after 11*period,
                     x"a" after 12*period,
                     x"b" after 13*period,
                     x"c" after 14*period,
                     x"d" after 15*period,
                     x"e" after 16*period,
                     x"f" after 17*period,
                      x"0" after 18*period,
                     x"1" after 19*period,
                     x"2" after 20*period,
                     x"3" after 21*period,
                     x"4" after 22*period,
                     x"5" after 23*period,
                     x"6" after 24*period,
                     x"7" after 25*period,
                     x"8" after 26*period,
                     x"9" after 27*period,
                     x"a" after 28*period,
                     x"b" after 29*period,
                     x"c" after 30*period,
                     x"d" after 31*period,
                     x"e" after 32*period,
                     x"f" after 33*period,
                      x"0" after 34*period,
                     x"1" after 35*period,
                     x"2" after 36*period,
                     x"3" after 37*period,
                     x"4" after 38*period,
                     x"5" after 39*period,
                     x"6" after 40*period,
                     x"7" after 41*period,
                     x"8" after 42*period,
                     x"9" after 43*period,
                     x"a" after 44*period,
                     x"b" after 45*period,
                     x"c" after 46*period,
                     x"d" after 47*period,
                     x"e" after 48*period,
                     x"f" after 49*period,
                      x"0" after 50*period,
                     x"1" after 51*period,
                     x"2" after 52*period,
                     x"3" after 53*period,
                     x"4" after 54*period,
                     x"5" after 55*period,
                     x"6" after 56*period,
                     x"7" after 57*period,
                     x"8" after 58*period,
                     x"9" after 59*period,
                     x"a" after 60*period,
                     x"b" after 61*period,
                     x"c" after 62*period,
                     x"d" after 63*period,
                     x"e" after 64*period,
                     x"f" after 65*period;

-- Simulate ROM address generation 
-- address for 24 locations required
tb_address <= "0000000" after 2*period,
              "0000001" after 3*period,
              "0000010" after 4*period,
              "0000011" after 5*period,
              "0000100" after 6*period,
              "0000101" after 7*period,
              "0000110" after 8*period,
              "0000111" after 9*period,
              
              "0001000" after 18*period,
              "0001001" after 19*period,
              "0001010" after 20*period,
              "0001011" after 21*period,
              "0001100" after 22*period,
              "0001101" after 23*period,
              "0001110" after 24*period,
              "0001111" after 25*period,
              
              "0010000" after 34*period,
              "0010001" after 35*period,
              "0010010" after 36*period,
              "0010011" after 37*period,
              "0010100" after 38*period,
              "0010101" after 39*period,
              "0010110" after 40*period;

-- ROM enable
tb_rom_en <= '0' after 1*period,
             '1' after 2*period,
             '0' after 48*period;

tb_rom_element_sel <= x"0" after 2*period,
                     x"1" after 3*period,
                     x"2" after 4*period,
                     x"3" after 5*period,
                     x"4" after 6*period,
                     x"5" after 7*period,
                     x"6" after 8*period,
                     x"7" after 9*period,
                     x"0" after 18*period,
                     x"1" after 19*period,
                     x"2" after 20*period,
                     x"3" after 21*period,
                     x"4" after 22*period,
                     x"5" after 23*period,
                     x"6" after 24*period,
                     x"7" after 25*period,
                      x"0" after 34*period,
                     x"1" after 35*period,
                     x"2" after 36*period,
                     x"3" after 37*period,
                     x"4" after 38*period,
                     x"5" after 39*period,
                     x"6" after 40*period,
                     x"7" after 41*period,
                      x"0" after 50*period,
                     x"1" after 51*period,
                     x"2" after 52*period,
                     x"3" after 53*period,
                     x"4" after 54*period,
                     x"5" after 55*period,
                     x"6" after 56*period,
                     x"7" after 57*period;
--process
--begin
--    for I in 0 to 15 loop
--  --  if tb_rst = '0' then
--        tb_element_select <= std_logic_vector(to_unsigned(I, tb_element_select'length));   
--        wait for 1*period/2;
--    --    end if;     
--        end loop;
--    end process;

end Behavioral;
