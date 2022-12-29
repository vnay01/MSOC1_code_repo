library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;

entity CONTROLLER is
  Port ( 
        clk : in std_logic;
        reset : in std_logic;
        init : in std_logic;       -- initialize signal the controller. Connects to START of MATRIx_MULTIPLIER
        ram_read : in std_logic;
        busy: out std_logic;       -- busy signal . Active when computation is being done
        data_holder_en: out std_logic;
        reg_block_select : out std_logic_vector( 3 downto 0 );          -- selects Register bank which hold input Matrix elements
        reg_bank_select: out std_logic_vector( 2 downto 0 );         -- enables 1 register from register bank to hold one element of input matrix
        rom_bank_sel: out std_logic_vector( 2 downto 0 );           -- selects the register bank which hold ROM coefficients
        rom_enable: out std_logic;
        rom_block_sel: out std_logic_vector(2 downto 0);             -- Selects register bank to store ROM data.
        rom_address: out std_logic_vector( 6 downto 0 );
        loader_enable : out std_logic;
        col_count: out unsigned( 3 downto 0 );
        row_count: out unsigned( 3 downto 0 );
        compute_en: out std_logic;
        compute_clear: out std_logic;
	    ram_write_enable : out std_logic;
        ram_enable : out std_logic; 
        ram_read_enable : out std_logic              
        );
end CONTROLLER;

architecture Behavioral of CONTROLLER is

-- STATES
type state is ( START, IDLE, READ_IN, LOAD,
                MUL, ADD1, ADD2, READ_RAM, WRITE_RAM );

signal current_state, next_state : state;                

-- "REGISTER BANK" control signals
signal w_busy, w_busy_next : std_logic;
signal w_data_holder_en, w_data_holder_en_next : std_logic;
signal w_reg_block_select, w_reg_block_select_next: unsigned( 3 downto 0 );  -- used to ACTIVATE DATA REGISTERS
signal w_reg_bank_select, w_reg_bank_select_next : unsigned( 2 downto 0 );
signal w_rom_element_sel, w_rom_element_sel_next : unsigned( 2 downto 0 );
signal w_rom_enable, w_rom_enable_next : std_logic;
signal w_rom_address, w_rom_address_next : unsigned( 6 downto 0 );
signal w_rom_block_sel, w_rom_block_sel_next : unsigned( 2 downto 0 );

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
signal w_ram_write_enable, w_ram_write_enable_next: std_logic;


-- Internal counters
signal count_down , count_down_next : unsigned(2 downto 0);
signal count_up, count_up_next : unsigned(11 downto 0);
signal idle_counter , idle_counter_next : unsigned( 3 downto 0 ) ;
-- signal load_count, load_count_next : unsigned( 11 downto 0 );           -- Just for the sake of it!!!

-------------- STATE COUNTER ----------------------
---------- USE THIS ONLY FOR TESTING---------------
--signal state_counter, state_counter_next: integer;                  -- Do you really need to spend any time on this!!!?
---------------------------------------------------
begin
-- GLOBAL connections
busy <= w_busy;
data_holder_en <= w_data_holder_en ;
reg_block_select <= std_logic_vector( w_reg_block_select(3 downto 0) );
reg_bank_select <= std_logic_vector( w_reg_bank_select );
rom_bank_sel <= std_logic_vector(w_rom_element_sel);
rom_enable <= w_rom_enable ;
rom_address <= std_logic_vector( w_rom_address );
rom_block_sel <= std_logic_vector( w_rom_block_sel);
loader_enable <= w_loader_enable ;
col_count <= w_col_count ;
row_count <= w_row_count ;
compute_en <= w_compute_en ;
compute_clear <= w_compute_clear ;
ram_enable <= w_ram_enable;
ram_read_enable <= w_ram_read_enable;
ram_write_enable <= w_ram_write_enable;


-- Sequential Block
reg_update:process(clk, reset)
    begin
        if reset = '1' then
        current_state <= START;
        count_up <= (others => '0') ;
        count_down <= (others => '1');      -- reset to max. value
        w_busy <= '0';
        w_reg_block_select <= ( others => '1' );
        w_data_holder_en <= '0' ;
        w_rom_enable <= '0';
        w_rom_address <= (others => '0');   -- reset address to "1111111"
        w_reg_bank_select <= ( others => '0' );
        w_loader_enable <= '0';
        w_col_count <= ( others => '0' );
        w_row_count <= ( others => '0' );
        w_rom_element_sel <= (others => '0');
        w_rom_block_sel <= (others => '0');
        w_compute_en <= '0';
        w_compute_clear <= '0';
        w_ram_enable <= '0';
        w_ram_read_enable <= '0';
	    w_ram_write_enable <= '0';		-- Diable write signal to RAM CONTROL
        idle_counter <= ( others => '1' ) ;
--        state_counter <= 0;
      
       elsif rising_edge( clk ) then
        current_state <= next_state;
        count_up <= count_up_next;
        count_down <= count_down_next;
        w_busy <= w_busy_next ;
        w_data_holder_en <= w_data_holder_en_next ;
        w_reg_block_select <= w_reg_block_select_next;
        w_rom_enable <= w_rom_enable_next;
        w_rom_address <= w_rom_address_next;
        w_reg_bank_select <= w_reg_bank_select_next;
        w_loader_enable <= w_loader_enable_next;
        w_col_count <= w_col_count_next ;
        w_row_count <=  w_row_count_next ;
        w_rom_element_sel <= w_rom_element_sel_next;
        w_rom_block_sel <= w_rom_block_sel_next;
        w_compute_en <= w_compute_en_next;
        w_compute_clear <= w_compute_clear_next;
        w_ram_enable <= w_ram_enable_next;
        w_ram_read_enable <= w_ram_read_enable_next;
	    w_ram_write_enable <= w_ram_write_enable_next;
        idle_counter <= idle_counter_next;
--        state_counter <= state_counter_next;

        end if;
        
    end process;

-- Combinational Block
state_change: process( current_state, init, ram_read, w_data_holder_en, w_reg_block_select, w_reg_bank_select, 	  			       
                       w_rom_enable, w_rom_address, w_rom_element_sel, idle_counter, w_loader_enable,
                       w_col_count, w_row_count,w_ram_enable, w_ram_read_enable,w_ram_write_enable, w_rom_block_sel,
                       count_up, count_down, w_busy, w_compute_clear
                        )
                       
-- Not using Variables because a "signal" works better as a counter, even though it will be synthesized as a combinational ckt!! Ended up being the critical path!!!

    begin
    -- default
    count_up_next <= count_up;          -- Maintain current value 
    count_down_next <= count_down;      -- Maintain current value
    idle_counter_next <= idle_counter;
    next_state <= current_state;
    ------------- CHECK and Fix before synthesis -------------------
    --------------- w_busy is not being updated for some reason -----------------
    w_busy_next <= w_busy;
    --------------- w_busy is not being updated for some reason -----------------
    
    w_data_holder_en_next <= w_data_holder_en ;
    w_reg_block_select_next <= w_reg_block_select;          -- maintains same Register Block selection
    w_reg_bank_select_next <= w_reg_bank_select;
    
    w_rom_element_sel_next <= w_rom_element_sel ;
    w_rom_enable_next <= w_rom_enable ;
    w_rom_address_next <= w_rom_address ;
    w_rom_block_sel_next <= w_rom_block_sel;
    
    w_compute_en_next <= '0' ;
    w_compute_clear_next <= w_compute_clear;
    
    w_loader_enable_next <= w_loader_enable ;
    w_col_count_next <= w_col_count ;
    w_row_count_next <=  w_row_count;
    
    w_ram_enable_next <= w_ram_enable ;              -- Disable RAM module when not required
    w_ram_read_enable_next <= w_ram_read_enable ;
    w_ram_write_enable_next <= w_ram_write_enable;

--        -- Disable RAM r/w operations
--        w_ram_write_enable_next <= '0';
--        w_ram_read_enable_next <= '0';
    
    count_up_next <= count_up;
    count_down_next <= count_down;
    

    case current_state is 
	
    
    
        when START =>
            
            w_reg_block_select_next <= (others =>'0');
            w_reg_bank_select_next <= (others => '0');
            w_rom_element_sel_next <= (others => '0');
            w_rom_enable_next <= '0';
            w_ram_write_enable_next <= '0';
            w_ram_read_enable_next <= '0';

            count_down_next <= o"1";
            idle_counter_next <= (others => '1');
            w_busy_next <= '0';
-- State change condition
            if init = '1' then 
            next_state <= READ_IN;
            
            w_busy_next <= '1';        
            end if;                 

            if ram_read = '1' then
            next_state <= READ_RAM;
            
            w_rom_enable_next <= '0';
            w_ram_enable_next <= '1';       -- if READ is HIGH, set RAM enable to '1' and jump to READ state
            w_busy_next <= '1';
            count_up_next <= (others => '0');       -- RESET counters

            end if;          
            
    ----- Enables DATA HOLDER Block on state transition
           w_data_holder_en_next <= '1' ;
            
    ---------------------------------------------------
    
    
        when READ_IN =>
        
            
            w_rom_enable_next <= '1';
--            w_reg_bank_select_next <= w_reg_bank_select ;  -- selects next register within the register bank 
            w_rom_element_sel_next <= w_rom_element_sel;    -- maintains current registers within ROM register bank
--            w_reg_bank_select_next <= w_reg_bank_select + 1;  
            count_down_next <= count_down - 1;           -- counts down every rising clock 
            
            w_reg_bank_select_next <= w_reg_bank_select + 1;        -- Changes made here
            
            if count_down = 0 then 
            count_down_next <= o"1";                         -- reset the counter to 1 -- Assuming 2 clock cycles for each read operation
                        
            w_rom_address_next <= w_rom_address + 1;         -- generate next address every 2 clock cycles
            w_rom_element_sel_next <= w_rom_element_sel + 1; -- selects next register to update -- Needs a delay of 2 clock cycles
            end if;
   ------------------------------------------------------
   -- ROM load operation
            case w_rom_address is
                when ("0000000")|("0000001") |("0000010") | ("0000011") | ("0000100") | ("0000101") | ("0000110") | ("0000111") =>                 -- 00
                    w_rom_block_sel_next <= "001" ;
                when ("0001000") | ("0001001") | ("0001010") | ("0001011") | ("0001100") | ("0001101") | ("0001110") | ("0001111") =>                    -- 08
                    w_rom_block_sel_next <= "010" ;
                when ("0010000") | ("0010001") | ("0010010") | ("0010011") | ("0010100") | ("0010101") | ("0010110") | ("0010111") =>                     -- 16
                    w_rom_block_sel_next <= "100" ; 
                when others =>
                    w_rom_block_sel_next <= (others => '0');
                    
                end case;        
    ------------------------------------------------------
      ------------------------------------------------------
            --w_rom_enable_next <= '1';
            if w_rom_address = ("0011000") then         -- Disable ROM block
            w_rom_enable_next <= '0';                    -- enables ROM block
            end if;
            
            -- Register bank selection 
            if w_reg_bank_select = 7 then
            w_reg_block_select_next <= w_reg_block_select + 1;
            w_reg_bank_select_next <= (others => '0');     
            end if;
            
            -- state change condition
            if w_reg_block_select /= 7 then
                    if w_reg_bank_select = 7 then
                    w_reg_block_select_next <= w_reg_block_select + 1;
                    w_reg_bank_select_next <= (others => '0');     
                    end if;
                elsif w_reg_bank_select = 7 then
                    next_state <= IDLE;
                 end if;
       
        
        w_compute_clear_next <= '1';    -- Clear Multiplier Units of any previous values!
        
        when IDLE =>
   
            w_data_holder_en_next <= '0' ;
            idle_counter_next <= idle_counter - 1;
            
            if idle_counter = x"0" then
            next_state <= LOAD;
            
            w_compute_en_next <= '1' ;           
            w_compute_clear_next <= '0';
            end if; 
            if idle_counter = x"8" then
            w_loader_enable_next <= '1';
            end if;
        
        when LOAD =>
            
            next_state <= MUL;
            w_row_count_next <=  w_row_count + 1;

            if w_row_count = 15 then
            w_col_count_next <= w_col_count + 1;
            end if;
                        
----------- How would you stop when all columns have been calculated ?
----------- Use col_count :  There is a problem here.... 
            if w_col_count = 12 then
                next_state <= START;
                w_col_count_next <= (others => '0'); 
--                end if;
                end if; 
            
             
--  -------------------- TESTING BLOCK---------------------
--                   state_counter_next <= state_counter + 1;
--  -------------------------------------------------------         
        
        
        when MUL =>
               
        next_state <= ADD1;
        
        
        when ADD1 =>
        w_compute_en_next <= '1' ;
        next_state <= ADD2;
       
       
        when ADD2 =>
        
        w_compute_en_next <= '1' ;
        next_state <= WRITE_RAM ;
        
        w_ram_enable_next <= '1' ;
        w_ram_write_enable_next <= '1';
        
        
        when WRITE_RAM =>
        
        
        
        count_up_next <= count_up + 1;     -- dummy counter
    
        if count_up = x"0C1" then        
        next_state <= START;
--        w_busy_next <= '0';
        else 
        next_state <= LOAD ;
        end if; 
  ------------------ TESTING BLOCK---------------------
--  state_counter_next <= state_counter + 1;
  ----------------------------------------------------- 
        
        when READ_RAM =>
        -- RAM write remains active for 192 elements
        w_ram_read_enable_next <= '1';
        count_up_next <= count_up + 1;     -- dummy counter
        w_data_holder_en_next <= '0' ;

---------- EACH READ OPERATION IS 3 CLOCK CYCLES LONG
----------- Ensure that a complete READ operation should produce 192 address i.e 192 * 3 = 576 clock cycles
------------- Address Change happens within the STATE (READ) in this case.
    
        if count_up = x"243" then
        count_up_next <= (others => '0');
        next_state <= START;      
        w_busy_next <= '0';
        end if; 
--  -------------------- TESTING BLOCK---------------------
--         state_counter_next <= state_counter + 1;
--  ------------------------------------------------------- 
        
        
        when others =>
        NULL;
    
    end case;
    
    end process;

end Behavioral;
