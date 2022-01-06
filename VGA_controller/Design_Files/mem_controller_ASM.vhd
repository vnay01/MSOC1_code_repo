----------------------------------------------------------------------------------
-- Engineer: Vinay Singh
-- 
-- Create Date: 02.01.2022 08:10:39
-- Module Name: mem_controller_ASM - Behavioral

-- Revision: V0.1
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity mem_controller_ASM is
  port (  
	        clk             : in std_logic;
	        reset           : in std_logic;
			enter_key       : in std_logic;          -- start performing "POP3" operation    -- comes from KeyBoard
			data_latch_key  : in std_logic;          -- write data_in to memory / "PUSH1"    -- connected to BTNC of FPGA board
--			data_in 		: in std_logic_vector(7 downto 0);
			mem_control     : out std_logic_vector(1 downto 0)      -- used to generate control signals for 3 states.	
--			data_out        : out std_logic_vector(7 downto 0)       -- 
				);
end mem_controller_ASM;

architecture Behavioral of mem_controller_ASM is


-- components 


type STATES is (
                ready, write, read
                );
signal current_state, next_state : STATES;

signal address : std_logic_vector(12 downto 0);         -- connects with addra of RAM
signal enter_key_buff , data_latch_key_buff : std_logic ; 
signal current_mem_addr, next_mem_addr : unsigned(address'range); -- used to implement a counter for memory address
signal current_mem_control: std_logic_vector(1 downto 0);           -- used to sample mem_control signals

begin
    
--enter_key_buff <= enter_key;
--data_latch_key_buff <= data_latch_key;
 
      
--Process to implement state change on rising edge of clock
   state_transition:process(clk,reset)
        begin
        if rising_edge(clk) then
            if reset = '1' then
            current_state <= ready;
            enter_key_buff <= '0';
            data_latch_key_buff <= '0';
            else
            current_state <= next_state;
            enter_key_buff <= enter_key;
            data_latch_key_buff <= data_latch_key;
            end if;
        end if;
        end process;
      
      
--      State Transition logic starts here

state_transition_logic : process(current_state, enter_key_buff, data_latch_key_buff)
        begin
            next_state <= ready;        --     -- return control 
            
            case current_state is

                when ready =>
                current_mem_control <= "00";
                
                    if enter_key_buff = '1' then
                        next_state <= read;             
                    else
                        if data_latch_key_buff ='1' then
                        next_state <= write;
                        end if;
                    end if;
                    
                when write =>
                current_mem_control <= "01";

                when read =>
                current_mem_control <= "10";

                when others =>
                current_mem_control <= "00";
                
                end case;
            end process;     
        

 mem_control <= current_mem_control;

end Behavioral;