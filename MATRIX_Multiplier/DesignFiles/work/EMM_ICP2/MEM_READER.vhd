
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MEM_READER is
  Port ( 
         clk :in std_logic;
         reset : in std_logic;
         enable : std_logic;
         address : out std_logic_vector(5 downto 0)   
           );
end MEM_READER;

architecture Behavioral of MEM_READER is

signal current_address, next_address : unsigned(5 downto 0);

--type state is ( IDLE, READ );
--signal current_state, next_state : state;
 
begin

address <= std_logic_vector(current_address);

address_update: process(clk, reset)
    begin
    if reset = '1' then
--    current_state <= IDLE;
    current_address <= (others =>'0');
    elsif rising_edge(clk) then
--    current_state <= next_state;
    current_address <= current_address - 1;
    end if;
    end process;

--address_gen_logic: process(enable, current_state)
--        begin
--        next_state <= current_state;
        
--        next_address <= current_address;
--        case current_state is
        
--        when IDLE =>
--        if enable = '1' then
--        next_state <= READ;
--        end if;
        
--        when READ =>
        
--        next_address <= current_address - 1;
----        if enable = '0' then
----        next_state <= IDLE;
----        else
        
----        end if;
        
--        when others =>
--        NULL;
--        end case;
        
        
--        end process;
    

end Behavioral;
