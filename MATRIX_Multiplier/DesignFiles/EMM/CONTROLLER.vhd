library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;
use work.reg_pkg.all;

entity CONTROLLER is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        init : in std_logic;       -- initialize signal the controller. Connects to START of MATRIx_MULTIPLIER
        ram_read : in std_logic;
        busy: out std_logic;       -- busy signal . Active when computation is being done
        block_select : out std_logic_vector( 2 downto 0 );          -- selects Register bank which hold input Matrix elements
        element_select: out std_logic_vector( 2 downto 0 );         -- enables 1 register from register bank to hold one element of input matrix
        rom_bank_sel: out std_logic_vector( 2 downto 0 );           -- selects the register bank which hold ROM coefficients
        rom_enable: out std_logic;
        rom_address: out std_logic_vector( 6 downto 0 );
        loader_enable : out std_logic;
        col_count: out unsigned( 3 downto 0 );
        row_count: out unsigned( 3 downto 0 );
        compute_en: out std_logic;
        compute_clear: out std_logic;
        ram_enable : out std_logic; 
        ram_read_enable : out std_logic              
        );
end CONTROLLER;

architecture Behavioral of CONTROLLER is

-- STATES
type state is ( START, IDLE, READ_IN, LOAD,
                MUL, ADD1, ADD2, RAM_CTRL );

signal current_state, next_state : state;                

-- "REGISTER BANK" control signals
signal w_busy, w_busy_next : std_logic;
signal w_block_select, w_block_select_next: unsigned( 2 downto 0 );  -- used to ACTIVATE DATA REGISTERS
signal w_element_select, w_element_select_next : unsigned( 2 downto 0 );
signal w_rom_element_sel, w_rom_element_sel_next : unsigned( 2 downto 0 );
signal w_rom_enable, w_rom_enable_next : std_logic;
signal w_rom_address, w_rom_address_next : unsigned( 6 downto 0 );

-- "LOADER UNIT" control signals
signal w_loader_enable, w_loader_enable_next :std_logic;
signal w_col_count, w_col_count_next : unsigned( 3 downto 0 ); 
signal w_row_count,  w_row_count_next : unsigned( 3 downto 0 );

-- "COMPUTE UNIT" control signals
signal w_compute_en, w_compute_en_next : std_logic;
signal w_compute_clear, w_compute_clear_next: std_logic;

-- "MEMORY CONTROLLER " control signal
signal w_ram_enable, w_ram_enable_next: std_logic;
signal w_ram_read_enable, w_ram_read_enable_next : std_logic;


-- Internal counters
signal count_down , count_down_next : unsigned(2 downto 0);
signal count_up, count_up_next : integer;
signal idle_counter , idle_counter_next : unsigned( 3 downto 0 ) ;
-- signal load_count, load_count_next : unsigned( 11 downto 0 );           -- Just for the sake of it!!!
signal state_counter, state_counter_next: integer;                  -- Do you really need to spend any time on this!!!?

begin
-- GLOBAL connections
busy <= w_busy;
block_select <= std_logic_vector( w_block_select );
element_select <= std_logic_vector( w_element_select );
rom_bank_sel <= std_logic_vector(w_rom_element_sel);
rom_enable <= w_rom_enable ;
rom_address <= std_logic_vector( w_rom_address );
loader_enable <= w_loader_enable ;
col_count <= w_col_count ;
row_count <= w_row_count ;
compute_en <= w_compute_en ;
compute_clear <= w_compute_clear ;
ram_enable <= w_ram_enable;
ram_read_enable <= w_ram_read_enable;

-- Register update
reg_update:process(clk, reset)
    begin
        if reset = '1' then
        current_state <= START;
        count_up <= 0 ;
        count_down <= (others => '0');      -- reset to max. value
        w_busy <= '0';
        w_block_select <= ( others => '0' );
        w_rom_enable <= '0';
        w_rom_address <= (others => '0');   -- reset address to "0000000"
        w_element_select <= ( others => '0' );
        w_loader_enable <= '0';
        w_col_count <= ( others => '0' );
        w_row_count <= ( others => '0' );
        w_rom_element_sel <= (others => '0');
        w_compute_en <= '0';
        w_compute_clear <= '0';
        w_ram_enable <= '0';
        w_ram_read_enable <= '0';
        idle_counter <= ( others => '0' ) ;
        state_counter <= 0 ;            -- Do you really need to spend any time on this!!!?

        
        elsif rising_edge( clk ) then
        current_state <= next_state;
        count_up <= count_up_next;
        count_down <= count_down_next;
        w_busy <= w_busy_next ;
        w_block_select <= w_block_select_next;
        w_rom_enable <= w_rom_enable_next;
        w_rom_address <= w_rom_address_next;
        w_element_select <= w_element_select_next;
        w_loader_enable <= w_loader_enable_next;
        w_col_count <= w_col_count_next ;
        w_row_count <=  w_row_count_next ;
        w_rom_element_sel <= w_rom_element_sel_next;
        w_compute_en <= w_compute_en_next;
        w_compute_clear <= w_compute_clear_next;
        w_ram_enable <= w_ram_enable_next;
        w_ram_read_enable <= w_ram_read_enable_next;
        idle_counter <= idle_counter_next;
        state_counter <= state_counter_next ;       -- Do you really need to spend any time on this!!!?

        end if;
        
    end process;

state_change: process( current_state, init, ram_read, w_block_select, w_element_select, w_rom_enable,
                       w_rom_address, w_rom_element_sel, idle_counter, state_counter, w_loader_enable, w_col_count, w_row_count, w_ram_read_enable )
 -- state_change: process( all ) -- only works for VHDL 2008
-- Not using Variables because a "signal" works better as a counter, even though it will be synthesized as a combinational ckt.

-- variable load_count: integer := 0;     -- WTF ... variables are NOT SHOWN IN WAVE!!!

    begin
    -- default
    count_up_next <= count_up;          -- Maintain current value 
    count_down_next <= count_down;      -- Maintain current value
    idle_counter_next <= idle_counter;
    state_counter_next <= state_counter;
    next_state <= current_state;
    w_busy_next <= w_busy;
    
    w_block_select_next <= w_block_select;          -- maintains same Register Block selection
    w_element_select_next <= w_element_select;
    w_rom_element_sel_next <= w_rom_element_sel ;
    w_rom_enable_next <= w_rom_enable ;
    w_rom_address_next <= w_rom_address ;
    w_compute_en_next <= '0' ;
    w_compute_clear_next <= w_compute_clear;
    
    w_loader_enable_next <= '0' ;
    w_col_count_next <= w_col_count ;
    w_row_count_next <=  w_row_count;
    
    w_ram_enable_next <= '0' ;
    w_ram_read_enable_next <= w_ram_read_enable ;
    
        
    case current_state is 
    
    when START =>
    w_busy_next <= '1';
    
    w_block_select_next <= (others => '0');
    w_element_select_next <= (others => '0');
    w_rom_element_sel_next <= (others => '0');
    w_rom_enable_next <= '0';
    w_rom_address_next <= (others => '0');
    
    count_up_next <= count_up;
    count_down_next <= o"1";
    idle_counter_next <= (others => '1');
    -- state_counter_next <= state_counter;
    
    if init = '1' then                  -- State change condition
        next_state <= READ_IN;          
    end if;
    
    if ram_read = '1' then
    next_state <= RAM_CTRL;
    end if;
    

    when READ_IN =>
    
        
        w_element_select_next <= w_element_select + 1;  -- selects next register within the register bank 
        w_rom_element_sel_next <= w_rom_element_sel;    -- maintains current registers within ROM register bank
            
    -- reading ROM data
        w_rom_enable_next <= '1';                    -- enables ROM block
        count_down_next <= count_down - 1;           -- counts down every rising clock 
        w_rom_address_next <= w_rom_address;         -- hold current address
        
        if count_down = 0 then 
        w_rom_address_next <= w_rom_address + 1;         -- generate next address every 2 clock cycles
        count_down_next <= o"1";                         -- reset the counter to 1 -- Assuming 2 clock cycles for each read operation
        w_rom_element_sel_next <= w_rom_element_sel + 1; -- selects next register to update
        end if;
        
        -- Register bank selection 
        if w_element_select = 7 then
        w_block_select_next <= w_block_select + 1;
        w_element_select_next <= (others => '0');     
        end if;
        
        -- state change condition
        if w_block_select = 7 then
        next_state <= IDLE;
        end if;
 
    w_compute_clear_next <= '1';
    
    when IDLE =>
    
    idle_counter_next <= idle_counter - 1;
    
    if idle_counter = x"0" then
    next_state <= LOAD;
    end if; 
    
    
    when LOAD =>

    state_counter_next <= state_counter + 1;   --  USED only for testing
    if state_counter = 10 then
        state_counter_next <= 0 ;
        end if;
        
    w_loader_enable_next <= '1'; 
    next_state <= MUL;
    w_row_count_next <=  w_row_count + 1;
     
     
    if w_row_count = 15 then
    w_col_count_next <= w_col_count + 1;
    end if;
    
    
    
    when MUL =>
    w_compute_en_next <= '1' ;
    
     
    next_state <= ADD1;
    w_compute_clear_next <= '0';
    when ADD1 =>
    w_compute_en_next <= '1' ;
    next_state <= ADD2;
    
    
    when ADD2 =>
    
    w_compute_en_next <= '1' ;
    next_state <= RAM_CTRL ;
    
    when RAM_CTRL =>
    -- RAM write remains active for 192 elements
    
    -- There must be another signal which when active READS from RAM
    w_ram_enable_next <= '1';
    if ram_read = '1' then
    w_ram_read_enable_next <= '1';
    end if;
    
     -- A counter is needed to count 16 x 12 elements
    count_up_next <= count_up + 1;     -- dummy counter
    if count_up = 192 then
    count_up_next <= 0;
    next_state <= START;
    w_busy_next <= '0';
    else 
    next_state <= LOAD ;
    end if; 
    
    when others =>
    NULL;
    
    end case;
    
    end process;

end Behavioral;
