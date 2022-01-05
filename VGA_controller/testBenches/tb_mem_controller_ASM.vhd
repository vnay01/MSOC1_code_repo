----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.01.2022 11:11:37
-- Design Name: 
-- Module Name: tb_mem_controller_ASM - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_mem_controller_ASM is
--  Port ( );
end tb_mem_controller_ASM;


architecture Behavioral of tb_mem_controller_ASM is

component mem_controller_ASM is
    port (  
            clk             : in std_logic;
	        reset           : in std_logic;
			enter_key       : in std_logic;          -- start performing "POP3" operation    -- comes from KeyBoard
			data_latch_key  : in std_logic;          -- write data_in to memory / "PUSH1"    -- connected to BTNC of FPGA board
			mem_control     : out std_logic_vector(1 downto 0)      -- used to generate control signals for 3 states.	
          );
end component;

signal tb_clk : std_logic;
signal tb_reset : std_logic := '0';
signal tb_enter_key : std_logic;
signal tb_data_latch_key : std_logic;
signal tb_mem_control : std_logic_vector(1 downto 0);


constant period : time := 10 ns;

begin

-- clock simulation
clock :process
    begin
        tb_clk <= '0';
      wait for period/2;
        tb_clk <= '1';
      wait for period/2;
   end process;
  
    
    -- DUT 
    DUT_mem_controller_ASM : mem_controller_ASM
    port map(
                clk => tb_clk,
                reset => tb_reset,
                enter_key => tb_enter_key,
                data_latch_key => tb_data_latch_key,
                mem_control => tb_mem_control
                );
-- stimulus
tb_enter_key <= '1',
                '0' after 1*period,
                '1' after 5*period,
                '0' after 6*period,
                '1' after 10*period,
                '0' after 11*period;
                
tb_data_latch_key <= '0',
                     '1' after 15*period,
                     '0' after 16*period,
                     '1' after 20*period,
                     '0' after 21*period,
                     '1' after 25*period,
                     '1' after 26*period,
                     '0' after 27*period;
                
                
                
tb_reset <= '1' after 100*period;    
         

end Behavioral;
