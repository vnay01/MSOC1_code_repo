library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;


entity MEMORY_CONTROLLER is
    Port (
           clk : in std_logic;
           reset : in std_logic;
           enable : in std_logic;       -- enable signal from CONTROLLER connects to CSN
           read_enable : in std_logic;  -- when active, place contents of address into buffer and display
	   write_enable : in std_logic;
           ack : in std_logic;  -- Each RAM block ( RY signal is read and then connected to ack )
           ram_bank_select : out std_logic_vector( 1 downto 0 );  -- Since we have 4 separate RAM block, each block can be selected exclusively.
           address : out std_logic_vector( 9 downto 0 );
           memory_full : out std_logic;
           write_en : out std_logic           
           );
end MEMORY_CONTROLLER;

architecture Behavioral of MEMORY_CONTROLLER is


-- FSM 
type state is ( IDLE, READ, WRITE );

signal current_state, next_state : state;


-- Signals
signal w_clk : std_logic;
signal w_reset : std_logic;
signal w_enable : std_logic;
signal w_ram_bank_select,w_ram_bank_select_next  : unsigned( 1 downto 0 ) ;
signal w_address, w_address_next : unsigned( 9 downto 0 );
signal w_write_en : std_logic;
signal w_ack : std_logic;
signal w_read_enable : std_logic;
signal w_write_enable : std_logic;
-- Memory Full signals
signal w_memory_full, w_memory_full_next : std_logic;
-- Internal Counters -- MAY NOT BE REQUIRED
signal count_up, count_up_next : unsigned( 10 downto 0 );
signal count_down, count_down_next : unsigned( 10 downto 0 );        -- To match address bus
signal internal_counter, internal_counter_next : unsigned(1 downto 0);	-- Using it to avoid RYxSO !!!

begin

-- GLOBAL Connections
w_clk <= clk;
w_reset <= reset;
w_enable <= enable;
--w_data_in <= data_in;
w_read_enable <= read_enable ;
w_write_enable <= write_enable;
w_ack <= ack; 
address <= std_logic_vector( w_address );
ram_bank_select <= std_logic_vector(w_ram_bank_select);
write_en <= w_write_en;		-- Enables writing to RAM
memory_full <= w_memory_full;

-- Registers:
process( clk, reset )
begin
    if reset = '1' then
    current_state <= IDLE;
    count_up <= ( others => '0' );
    count_down <= "10011100000" ; 
    w_address <= ( others => '0' );
    w_ram_bank_select <= "11" ;
    w_memory_full <= '0';
    internal_counter <= (others => '0');
    elsif rising_edge( clk ) then
        if w_enable = '1' then
    w_address <= w_address_next;
    current_state <= next_state;
    count_up <= count_up_next;
    count_down <= count_down_next;
    w_ram_bank_select <= w_ram_bank_select_next;
    w_memory_full <= w_memory_full_next;
    internal_counter <= internal_counter_next;
    end if;
    end if;
end process; 

STATE_CHANGE_LOGIC : process(  	current_state, w_read_enable, w_write_enable,
				w_address, count_up, count_down, w_ram_bank_select,
				w_memory_full, internal_counter )
 begin
        -- Default cases
        next_state <= current_state;
        w_address_next <= w_address;
        count_up_next <= count_up;
        count_down_next <= count_down;              
	w_ram_bank_select_next <= "00";
        w_memory_full_next <= w_memory_full;
   	internal_counter_next <= internal_counter;

        
      case current_state is
        
        when IDLE =>

            
            
	    w_write_en <= '1';      
--          if w_memory_full = '0' then
            if w_read_enable = '1' then             -- Condition for STATE change
               next_state <= READ ;
            end if;
		
	    if w_write_enable = '1' then
               next_state <= WRITE;
            end if;
--          end if;
	
            
-- Use case block below to set internal flags and RAM block selection            
            if w_address = "1001000000" then		-- Sets mem full flag at 576
		w_memory_full_next <= '1';
--		next_state <= READ;
		end if;	



         when READ =>
        
         
         w_write_en <= '1';
          
         internal_counter_next <= internal_counter + 1;

         if internal_counter = "01" then
              w_address_next <= w_address - 1;
              internal_counter_next <= "00";
	      next_state <= IDLE;
              end if;

--	if w_address = "0000000000" then
--		next_state <= IDLE;
--	end if;
--
                
        when WRITE =>
        
            count_up_next <= count_up + 1; -- Increase counter when in WRITE state
            
            w_write_en<= '0';
	
  	    internal_counter_next <= internal_counter + 1;
	
  	    if internal_counter = "01" then
              next_state <= IDLE;
              w_address_next <= w_address + 1;
	      internal_counter_next <= "00";
            end if;
            

                        
        when others =>
        next_state <= IDLE;
        w_write_en <= '1';
        
        end case;  
            
        
 end process;

end Behavioral;
