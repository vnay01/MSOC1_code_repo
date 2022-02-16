----------------------------------------------------------------------------------
-- Engineer: Vinay Singh
-- 
-- Create Date: 02.02.2022 07:15:01
-- Module Name: MM_controller - Behavioral
-- Project Name: IC Project
-- Target Devices: ASIC Synthesis
-- Tool Versions: 
-- Description: Behavioral Model of Matrix Multiplier controller
-- 
-- Dependencies: Sub- module for Top Design.
-- 
-- Revision: V0.1
-- Revision 0.01 - File Created
-- Additional Comments:
-- May change down the line
-- Sequence of operation is correct.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity MM_controller is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        done : in std_logic;
        datapath_ctrl : out std_logic_vector( 2 downto 0)       -- this signal will activate section of datapath     
        );
end MM_controller;

architecture Behavioral of MM_controller is

type STATE is ( 
                READ, IDLE, LOAD, MULT, 
                ADD, ADD_2, RAM_STORE
                );

signal current_state, next_state : STATE;

signal datapath_ctrl_next : std_logic_vector(2 downto 0);


begin

-- State update process
process(clk, reset)
begin
if reset = '1' then
    current_state <=READ;
    datapath_ctrl <= (others => '0');
    
    elsif rising_edge(clk) then
    current_state <= next_state;
    datapath_ctrl <= datapath_ctrl_next; 
    end if;
end process;

-- Next_state determination process
registers: process(current_state, done)
begin    
     next_state <= current_state;    
        
        case current_state is
        
        when READ =>
         datapath_ctrl_next <= "000";
            if done = '1' then
            next_state <= IDLE;
            end if;
        
        when IDLE =>
        datapath_ctrl_next <="001";
            if done = '1' then
            next_state <= LOAD;
            end if;
            
        when LOAD =>
        datapath_ctrl_next <= "010";
            if done ='1' then
            next_state <= MULT;
            end if;
            
       when MULT =>
       datapath_ctrl_next <= "011";
           if done = '1' then
           next_state <= ADD;
           end if; 
       
       when ADD =>
       datapath_ctrl_next <= "100";
            if done = '1' then
            next_state <= ADD_2;
            end if;
            
       when ADD_2 =>
       datapath_ctrl_next <= "101";
            if done = '1' then
            next_state <= RAM_STORE;
            end if;
       
       when RAM_STORE =>
       datapath_ctrl_next <= "110";
            if done = '1' then
            next_state <= READ;
            end if;
            
      when others =>
      datapath_ctrl_next <= "111";
          
      end case;
end process;

end Behavioral;
