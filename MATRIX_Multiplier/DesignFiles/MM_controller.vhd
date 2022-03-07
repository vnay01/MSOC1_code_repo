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
        done : in  std_logic_vector(5 downto 0);
        load_count : out unsigned( 1 downto 0);    -- used to select the element to load
        ready: out std_logic;                                   -- Shows status of the system
        datapath_ctrl : out std_logic_vector( 5 downto 0)       -- this signal will activate section of datapath     
        );
end MM_controller;

architecture Behavioral of MM_controller is

type STATE is ( 
                START,READ,LOAD,MACC,
                RAM_STORE, PERF_CAL
                );

signal current_state, next_state : STATE;
signal done_next : std_logic_vector(5 downto 0);
signal datapath_ctrl_next : std_logic_vector(5 downto 0);           -- ENABLES SECTIONS OF DATAPATH
signal ready_status, next_ready_status: std_logic;      
signal status_count, next_status_count : unsigned ( 3 downto 0) ; -- will be used to count the number of RAM store operations
signal load_counter, load_counter_next : unsigned( 1 downto 0);  -- Counter to load input registers   
signal MACC_COUNT, MACC_COUNT_next : unsigned(2 downto 0);  

begin

-- State update process
process(clk, reset)
begin
if reset = '1' then
    current_state <=START;
    datapath_ctrl <= (others => '0');
    ready <= '0';
    status_count <= (others =>'0');
    load_counter <= ( others =>'0');
    MACC_COUNT <= (others =>'0');
elsif rising_edge(clk) then
    current_state <= next_state;
    datapath_ctrl <= datapath_ctrl_next; 
    ready <= next_ready_status;
    status_count <= next_status_count;
    load_counter <= load_counter_next;
    MACC_COUNT <= MACC_COUNT_next;
    end if;
end process;

-- Output of the counter
load_count <= load_counter;


input_stimulus: process( clk, done )
begin
    if rising_edge(clk) then
    done_next <= (others =>'0');
    case done is 
        when "000001" =>                -- START
        done_next <= "000001";
        when "000010" =>                -- READ
        done_next <= "000010";
        when "000100" =>                -- LOAD
        done_next <= "000100";
        when "001000" =>                -- MACC 
        done_next <= "001000";
        when "010000" =>                -- RAM_STORE
        done_next <= "010000";
        when "100000" =>                --will activate Perf_cal block, if implemented
        done_next <= "100000";
        
        when others =>
        NULL;
        end case;
    end if;        

end process;




-- Next_state determination process
registers: process(current_state, done_next, clk,status_count, load_counter, MACC_COUNT )
begin   

--    if rising_edge(clk) then 
     
     datapath_ctrl_next <= (others =>'0');
     
     next_state <= current_state; 
     next_status_count <= status_count;   
     load_counter_next <= load_counter;
     MACC_COUNT_next <=MACC_COUNT;
     next_ready_status <= '0';
      
      case current_state is
        
        when START =>                    -- reads input matrix "Done by LOAD_MODULE"
         datapath_ctrl_next <= "000001";
            if done_next = "000001" then      -- Where does this signal come from ??
            next_state <= READ;
            end if;
        
        when READ =>
        datapath_ctrl_next <="000010";
            if done_next = "000010" then
            next_state <= LOAD;
            end if;
        
        when LOAD =>
            datapath_ctrl_next <= "000100";            -- CONTROL signal to load unit for data reuse ( from ROM !! )
            load_counter_next <= load_counter + 1;
            if done_next = "000100" then
            next_state <= MACC;
            end if;
        
       when MACC =>
       datapath_ctrl_next <= "001000";  -- tells the system that MACC module is active
       
      
       if done_next = "001000" then       -- Must come from MAC units
       
          if MACC_COUNT = 7 then
            next_state <= RAM_STORE;
            MACC_COUNT_next <=(others =>'0');
            else
            next_state <= LOAD;             -- LOAD stage may be required.. for data re-use.
            MACC_COUNT_next <=MACC_COUNT + 1;
         end if;  
      end if;
       
       when RAM_STORE =>
            
            datapath_ctrl_next <= "010000";       -- Enables RAM store module
      
            if done_next = "010000" then
                                   
            if status_count = 15 then
            next_state <= PERF_CAL;
            next_status_count <= (others =>'0');
            else
            next_status_count <= status_count + 1;
            next_state <= START;
            end if;
        end if;
       
       when PERF_CAL =>
            datapath_ctrl_next <= "100000";       -- enables PERFORMANCE block
           
            if done_next = "100000" then
            next_ready_status <= '1';
            next_state <= START;
            end if;         
            
      when others =>
      NULL;
                
      end case;
--   end if;
end process;
end Behavioral;
