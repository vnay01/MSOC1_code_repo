
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package controller_pkg is

component MM_controller is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        done : in std_logic;
        datapath_ctrl : out std_logic_vector( 6 downto 0)       -- this signal will activate section of datapath     
        );
end component;


end controller_pkg;


package body controller_pkg is

end controller_pkg;

---- Controller Description below

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MM_controller is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        done : in std_logic;
        datapath_ctrl : out std_logic_vector( 6 downto 0)       -- this signal will activate section of datapath     
        );
end MM_controller;

architecture Behavioral of MM_controller is

type STATE is ( 
                READ, IDLE, LOAD, MULT, 
                ADD, ADD_2, RAM_STORE
                );

signal current_state, next_state : STATE;

signal datapath_ctrl_next : std_logic_vector(6 downto 0);       -- can be changed furhter to include performance blocks


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
         datapath_ctrl_next <= "0000001";
            if done = '1' then
            next_state <= IDLE;
            end if;
        
        when IDLE =>
        datapath_ctrl_next <="0000010";
            if done = '1' then
            next_state <= LOAD;
            end if;
            
        when LOAD =>
        datapath_ctrl_next <= "0000100";
            if done ='1' then
            next_state <= MULT;
            end if;
            
       when MULT =>
       datapath_ctrl_next <= "0001000";
           if done = '1' then
           next_state <= ADD;
           end if; 
       
       when ADD =>
       datapath_ctrl_next <= "0010000";
            if done = '1' then
            next_state <= ADD_2;
            end if;
            
       when ADD_2 =>
       datapath_ctrl_next <= "0100000";
            if done = '1' then
            next_state <= RAM_STORE;
            end if;
       
       when RAM_STORE =>
       datapath_ctrl_next <= "1000000";
            if done = '1' then
            next_state <= READ;
            end if;
            
      when others =>
      datapath_ctrl_next <=(others => '0');
          
      end case;
end process;

end Behavioral;