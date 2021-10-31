-- testbench for ALU controller
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_ALU_ctrl is
end tb_ALU_ctrl;

architecture beh of tb_ALU_ctrl is

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
	
-- signals
signal tb_clk: std_logic :='0';
signal tb_reset, tb_enter, tb_sign  : std_logic := '0' ;
signal tb_FN : std_logic_vector(3 downto 0) ;
signal tb_RegCtrl : std_logic_vector(1 downto 0);

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
				
-- clock simulation
clock_process: process
	begin
		tb_clk <= '0';
		wait for period/2 ;
		tb_clk <='1';
		wait for period/2;
		end process;

-- stimulus
ALU_stimulus : process( clk, reset, enter, sign)
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
end;

