-- testbench for ALU controller
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_ALU_ctrl_ALU is
end tb_ALU_ctrl_ALU;

architecture beh of tb_ALU_ctrl_ALU is

-- component declarations

component ALU_ctrl is
	port ( 
		  clk     : in  std_logic;
          reset   : in  std_logic;  -- connected to CPU reset button on FPGA board
          enter   : in  std_logic;  -- connected to BTNC on FPGA board
          sign    : in  std_logic;  -- connected to BTNL button on FPGA board
          FN      : out std_logic_vector (3 downto 0);   -- ALU functions
          RegCtrl : out std_logic_vector (1 downto 0)   -- Register update control bits
        );
	end component;
	
component ALU is
  port (  A          : in  std_logic_vector(7 downto 0);
          B          : in  std_logic_vector(7 downto 0);
          FN         : in  std_logic_vector(3 downto 0);
          result     : out std_logic_vector(7 downto 0);
          overflow   : out std_logic;
          sign       : out std_logic
        );
   end component;
	
-- signals

signal tb_A          : std_logic_vector(7 downto 0);
signal tb_B          : std_logic_vector(7 downto 0);
signal tb_clk: std_logic :='0';
signal tb_reset, tb_enter, tb_sign  : std_logic := '0' ;
signal tb_FN : std_logic_vector(3 downto 0) ;
signal tb_RegCtrl : std_logic_vector(1 downto 0);
signal tb_result : std_logic_vector( 7 downto 0);

constant period : time :=1000 ns;

begin
-- component instantiations:
DUT_ALU_ctrl:ALU_ctrl
	port map (
				clk => tb_clk,
				reset => tb_reset,
				enter => tb_enter,
				sign => tb_sign,
				FN => tb_FN,
				RegCtrl => tb_RegCtrl
				);

DUT_ALU: ALU
 port map (
			  A         => tb_A,
              B         => tb_B,
              FN        => tb_FN,
              result    => tb_result,
              sign      => tb_sign,
              overflow  => tb_overflow
            );
				
-- clock simulation
clock_process: process
	begin
		tb_clk <= '0';
		wait for period/2 ;
		tb_clk <='1';
		wait for period/2;
		end process;

-- stimulus
ALU_stimulus : process
	begin
		tb_reset <= '0';
		tb_sign <= '0';
		tb_enter <= '0';
		wait for period;
		tb_reset <= '1';
		tb_sign <= '0';
		tb_enter <= '0';
		wait for period;
		tb_reset <= '0';
		tb_sign <= '0';
		tb_enter <= '1';
		wait for period;
		tb_reset <= '0';
		tb_sign <= '1';
		tb_enter <= '0';
		wait for period;
		tb_reset <= '0';
		tb_sign <= '1';
		tb_enter <= '1';
		wait for 3*period;
		tb_reset <= '1';
	end process;

   -- *************************
   -- User test data pattern
   -- *************************
   
   tb_A <= "00000101",                    -- A = 5
        "00001001" after 1 * period,   -- A = 9
        "00010001" after 2 * period,   -- A = 17
        "10010001" after 3 * period,   -- A = 145
        "10010100" after 4 * period,   -- A = 148
        "11010101" after 5 * period,   -- A = 213
        "00100011" after 6 * period,   -- A = 35
        "11110010" after 7 * period,   -- A = 242
        "00110001" after 8 * period,   -- A = 49
        "01010101" after 9 * period;   -- A = 85
  
   tb_B <= "00000011",                    -- B = 3
        "00000011" after 1 * period,   -- B = 3
        "10010001" after 2 * period,   -- B = 145
        "01111100" after 3 * period,   -- B = 124
        "11111001" after 4 * period,   -- B = 249
        "01101001" after 5 * period,   -- B = 105
        "01100011" after 6 * period,   -- B = 35
        "01101000" after 7 * period,   -- B = 104
        "00101101" after 8 * period,   -- B = 45
        "00100100" after 9 * period;   -- B = 36
     
  tb_FN <= "0000",                              -- Pass A
         "0001" after 1 * period,             -- Pass B
         "0000" after 2 * period,             -- Pass A
         "0001" after 3 * period,             -- Pass B
         "0010" after 4 * period,             -- Pass unsigned A + B
         "0011" after 5 * period,             -- Pass unsigned A - B  
         "0011" after 6 * period,             -- Pass unsigned A - B
         "0010" after 7 * period,             -- Pass unsigned A + B
         "0011" after 8 * period,             -- Pass unsigned A - B
         "0100" after 9 * period,             -- Pass unsigned max(A, B)
         "1010" after 10 * period,            -- Pass signed A + B
         "1011" after 11 * period,            -- Pass signed A - B
         "0100" after 12 * period,            -- Pass signed max(A, B)
         "1111" after 13 * period;            -- Invalid input command
		 
end beh;

