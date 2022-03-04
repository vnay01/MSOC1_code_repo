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
        done : in  std_logic_vector(7 downto 0);
        load_count : out unsigned( 1 downto 0);    -- used to select the element to load
        ready: out std_logic;                                   -- Shows status of the system
        datapath_ctrl : out std_logic_vector( 7 downto 0)       -- this signal will activate section of datapath     
        );
end MM_controller;

architecture Behavioral of MM_controller is

type STATE is ( 
                READ, IDLE, LOAD, MULT, 
                ADD, ADD_2, RAM_STORE
                );

signal current_state, next_state : STATE;
signal done_next : std_logic_vector(7 downto 0);
signal datapath_ctrl_next : std_logic_vector(7 downto 0);
signal ready_status, next_ready_status: std_logic;      
signal status_count, next_status_count : unsigned ( 3 downto 0) ;           -- will be used to count the number of RAM store operations
signal load_counter, load_counter_next : unsigned( 1 downto 0);  -- Counter to load input registers   


begin

-- State update process
process(clk, reset)
begin
if reset = '1' then
    current_state <=READ;
    datapath_ctrl <= (others => '0');
    ready <= '0';
    status_count <= (others =>'0');
    load_counter <= ( others =>'0');
    
    elsif rising_edge(clk) then
    current_state <= next_state;
    datapath_ctrl <= datapath_ctrl_next; 
    ready <= next_ready_status;
    status_count <= next_status_count;
    load_counter <= load_counter_next;
    end if;
end process;

-- Output of the counter
load_count <= load_counter;


input_stimulus: process( done )
begin
--    if rising_edge(clk) then
    case done is 
        when x"01" =>
        done_next <= x"01";
        when x"02" =>
        done_next <= x"02";
        when x"04" =>
        done_next <= x"04";
        when x"08"=>
        done_next <= x"08";
        when x"10" =>
        done_next <= x"10";
        when x"20" =>
        done_next <= x"20";
        when x"40"=>
        done_next <= x"40";
        when x"80" =>
        done_next <= x"80";
        when others =>
        done_next <= (others =>'0');
        end case;
--    end if;        

end process;




-- Next_state determination process
registers: process(current_state, done_next, clk,status_count, load_counter )
begin   
    if rising_edge(clk) then 
     next_state <= current_state; 
     next_status_count <= status_count;   
     load_counter_next <= load_counter;
        
        case current_state is
        
        when READ =>                    -- reads input matrix "Done by LOAD_MODULE"
         datapath_ctrl_next <= x"01";
            if done_next = x"01" then
            next_state <= IDLE;
--            else
--            next_state <= current_state; 
            end if;
        
        when IDLE =>
        datapath_ctrl_next <=x"02";
            if done_next = x"02" then
            next_state <= LOAD;
--            else
--            next_state <= current_state; 
            end if;
            
        when LOAD =>                -- Load input registers of DataPath with appropriate data.
        datapath_ctrl_next <= x"04";
        load_counter_next <= load_counter + 1;
            if done_next = x"04" then
            next_state <= MULT;
--            else
--            next_state <= current_state; 
            end if;
            
       when MULT =>
       datapath_ctrl_next <= x"08";
           if done_next = x"08" then
           next_state <= ADD;
--           else
--            next_state <= current_state; 
           end if; 
       
       when ADD =>
       datapath_ctrl_next <= x"10";
            if done_next = x"10" then
            next_state <= ADD_2;
--           else
--            next_state <= current_state; 
            end if;
            
       when ADD_2 =>
       datapath_ctrl_next <= x"20";
            if done_next = x"20" then
            next_state <= RAM_STORE;
--            else
--            next_state <= current_state; 
            end if;
            
       ----- WHAT ABOUT done_next = x"40" ?????
       
       when RAM_STORE =>
       datapath_ctrl_next <= x"80";
            if done_next = x"80" then
            next_state <= READ;
            next_status_count <= status_count + 1;
--            else
--            next_state <= current_state; 
            end if;
            if status_count = 15 then
            next_ready_status <= '1';
            else
            next_ready_status <= '0';
            end if;
            
      when others =>
      datapath_ctrl_next <= x"00";
--      next_state <= current_state; 
          
      end case;
   end if;
end process;
end Behavioral;
