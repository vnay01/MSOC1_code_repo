library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;


entity MEMORY_CONTROLLER is
    Port (
           clk : in std_logic;
           reset : in std_logic;
           enable : in std_logic;       -- enable signal from CONTROLLER
           read_enable : in std_logic;  -- when active, place contents of address into buffer and display
           ack : in std_logic;  -- Each RAM block ( RY signal is ORed and then connected to ack )
           ram_bank_select : out std_logic_vector( 1 downto 0 );        -- Since we have 4 separate RAM block, each block can be selected exclusively.
           address : out std_logic_vector( 9 downto 0 );
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
-- signal w_data_in : std_logic_vector( 15 downto 0 );
signal buffer_data_in : std_logic_vector( 31 downto 0 );
--signal w_data_out : std_logic_vector( 31 downto 0 );
signal w_ram_bank_select,w_ram_bank_select_next  : unsigned( 1 downto 0 ) ;
signal w_address, w_address_next : unsigned( 9 downto 0 );
signal w_write_en : std_logic;
signal w_ack : std_logic;
signal w_read_enable : std_logic;
signal w_write_enable : std_logic;

-- Internal Counters 
signal count_up, count_up_next : unsigned( 11 downto 0 );
signal count_down, count_down_next : integer;

begin

-- GLOBAL Connections
w_clk <= clk;
w_reset <= reset;
w_enable <= enable;
--w_data_in <= data_in;
w_read_enable <= read_enable ;
w_ack <= ack; 
address <= std_logic_vector( w_address );

ram_bank_select <= std_logic_vector(w_ram_bank_select);

-- NEEDS TO BE FIGURED OUT HERE
--data_out <= w_data_out( 7 downto 0 );

write_en <= w_write_enable;

-- Registers:
process( clk, reset )
begin
    if reset = '1' then
    current_state <= IDLE;
    count_up <= ( others => '0' );
    count_down <= 0 ;
    w_address <= ( others => '0' );
    w_ram_bank_select <= "00" ;
    elsif rising_edge( clk ) then
        if w_enable = '1' then
    w_address <= w_address_next;
    current_state <= next_state;
    count_up <= count_up_next;
    count_down <= count_down_next;
    w_ram_bank_select <= w_ram_bank_select_next;
    end if;
    end if;
end process; 

STATE_CHANGE_LOGIC : process(  w_read_enable )
 begin
        -- Default cases
        next_state <= current_state;
        w_address_next <= w_address;
        count_up_next <= count_up;
        count_down_next <= count_down;  
        w_ram_bank_select_next <= w_ram_bank_select ;      
        
        w_write_enable <= '0';
        
      case current_state is
        
        when IDLE =>
        count_down_next <= 192 ;       --- Initialize to 192
        count_up_next <= x"000";         
        
        if w_ack = '1' then 
            if w_read_enable = '1' then
            next_state <= READ ;
            else
            next_state <= WRITE;
            end if;
        end if;
        
        when READ =>
            if w_ack = '1' then
              w_address_next <= w_address - 1;
              count_down_next <= count_down - 1;
              next_state <= IDLE;
              end if;
            if count_down = 0 then
                next_state <= IDLE;
                end if;
                
        when WRITE =>
        w_write_enable <= '1';
            if w_ack = '1' then
                count_up_next <= count_up + 1;
                w_address_next <= w_address + 1;
                next_state <= IDLE;
                end if;
        if count_up < x"280" then
            w_ram_bank_select_next <= "01";
         else
            w_ram_bank_select_next <= "10";
         end if;     
                        
        when others =>
        NULL;
        
          end case;  
            
        
 end process;

end Behavioral;
