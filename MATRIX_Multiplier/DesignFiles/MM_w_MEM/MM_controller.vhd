
------------------MM_controller BEGINS HERE -----------------------
----------------------------------------------------------------
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
        colum : out unsigned( 1 downto 0);    -- used to select the element to load
        row : out unsigned(1 downto 0);
        SWITCH : out unsigned( 1 downto 0);             -- Used for switching positions of ROM coefficient
        MAC_clear : out std_logic;
        ready: out std_logic;                                   -- Shows status of the system
        ram_addr : out std_logic_vector(7 downto 0);        -- addresses external RAM 
        datapath_ctrl : out std_logic_vector( 5 downto 0);       -- this signal will activate section of datapath     
        write_enable : out std_logic;
        store_address : out std_logic_vector(7 downto 0)
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
signal col_counter, col_counter_next : unsigned( 1 downto 0);  -- Counter to load input registers   
signal row_counter, row_counter_next : unsigned ( 1 downto 0); 
signal MACC_COUNT, MACC_COUNT_next : unsigned(2 downto 0);  
signal MAC_clear_reg : std_logic;
signal SWITCH_reg, SWITCH_reg_next : unsigned( 1 downto 0) ;

signal READ_COUNTER, READ_COUNTER_next : unsigned(3 downto 0);

signal ram_addr_counter, next_ram_addr_counter: unsigned(7 downto 0);

signal write_enable_next : std_logic;
signal store_address_counter, store_address_counter_next : unsigned(7 downto 0);


begin

-- State update process
process(clk, reset)
begin
if reset = '1' then
    current_state <=START;
    datapath_ctrl <= (others => '0');
    ready <= '0';
    status_count <= (others =>'0');
    col_counter <= ( others =>'0');
    row_counter <= (others =>'0');
    MACC_COUNT <= (others =>'0');
    MAC_clear <= '0';
    ram_addr <= (others =>'0');
    ram_addr_counter <=( others =>'0');
    SWITCH_reg <= (others => '0'); 
    READ_COUNTER <= (others => '0');
	write_enable <= '0';
	store_address_counter <= (others =>'0');
elsif rising_edge(clk) then
    current_state <= next_state;
    datapath_ctrl <= datapath_ctrl_next; 
    ready <= next_ready_status;
    status_count <= next_status_count;
    col_counter <= col_counter_next;
    row_counter <= row_counter_next;
    MACC_COUNT <= MACC_COUNT_next;
    MAC_clear <= MAC_clear_reg;
    ram_addr <= std_logic_vector(ram_addr_counter);
    ram_addr_counter <= next_ram_addr_counter;
    SWITCH_reg <= SWITCH_reg_next;
    write_enable <= write_enable_next;
    READ_COUNTER <=  READ_COUNTER_next;
    store_address_counter <= store_address_counter_next ;
    end if;
end process;

-- Output of the counter
colum <= col_counter;
row <= row_counter ;
SWITCH <= SWITCH_reg;
store_address <= std_logic_vector(store_address_counter);

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
registers: process(current_state, done_next, clk,status_count, col_counter, row_counter, MACC_COUNT, ram_addr_counter, READ_COUNTER, store_address_counter )
begin   

--    if rising_edge(clk) then 
     
     datapath_ctrl_next <= (others =>'0');
     MAC_clear_reg <= '0';            -- May need to be rechecked
     next_state <= current_state; 
     next_status_count <= status_count;   
     col_counter_next <= col_counter;
     row_counter_next  <= row_counter ;
     MACC_COUNT_next <=MACC_COUNT;
     SWITCH_reg_next <= SWITCH_reg;
     next_ready_status <= '0';
     next_ram_addr_counter <= ram_addr_counter;
	 write_enable_next <= '0';
     store_address_counter_next <= store_address_counter; 
     READ_COUNTER_next <=  READ_COUNTER  ;  
    
    case current_state is
        
        when START =>                    -- reads input matrix "Done by LOAD_MODULE"
         datapath_ctrl_next <= "000011";        -- datapath_ctrl(0)
         MAC_clear_reg <= '1';
         next_ready_status <= '1';
            if done_next = "000001" then      -- Where does this signal come from ??
            next_state <= READ;
            end if;
        
        when READ =>
        datapath_ctrl_next <="000010";                  -- datapath_ctrl(1)  -- enables external RAM
--            if done_next = "000010" then
           next_ram_addr_counter <= ram_addr_counter + 1;
           READ_COUNTER_next <= READ_COUNTER + 1;
           case ram_addr_counter is
           when x"07" =>                    --8
           next_state <= LOAD;
           when x"10" =>                        --16
           next_state <= LOAD;
           when x"18" =>                    -- 24
           next_state <= LOAD;  
           when x"20" =>                    --32
           next_state <= LOAD;
           when x"28" =>                    --40
           next_state <= LOAD;
           when x"30" =>                    --48
           next_state <= LOAD;
           when x"38" =>                    -- 56
           next_state <= LOAD;
           when x"40" =>                        -- 64
           next_state <= LOAD;
           when x"48" =>                    -- 72
           next_state <= LOAD;
           when x"50" =>                    -- 80
           next_state <= LOAD;
           when x"58" =>                    --88
           next_state <= LOAD;
           when x"60" =>                    -- 96
           next_state <= LOAD;  
           when x"68" =>                    -- 104
           next_state <= LOAD;
           when x"70" =>                    -- 112
           next_state <= LOAD;
           when x"78" =>                -- 120
           next_state <= LOAD;
           when x"80" =>                -- 128
           next_state <= LOAD;
           when x"88" =>                -- 136
           next_state <= LOAD;
           when x"90" =>                -- 144
           next_state <= LOAD;
           when x"98" =>                -- 152
           next_state <= LOAD;
           when x"a0" =>                -- 160
           next_state <= LOAD;
           when x"a8" =>                -- 168
           next_state <= LOAD;
           when x"b0" =>                -- 176
           next_state <= LOAD;
           when x"b8" =>                -- 184
           next_state <= LOAD;
           when x"c0" =>                -- 192
           next_state <= LOAD;
           when x"c8" =>                -- 200
           next_state <= LOAD;
           when x"d0" =>                -- 208
           next_state <= LOAD;
           when x"d8" =>                -- 216
           next_state <= LOAD;
           when x"e0" =>                -- 224
           next_state <= LOAD;      
           when x"e8" =>                -- 232
           next_state <= LOAD;
           when x"f0" =>                -- 240
           next_state <= LOAD;
           when x"f8" =>                -- 248
           next_state <= LOAD;
           when x"ff" =>                -- 256          --- This is not going to occur because the counter will roll-over to 0
           next_state <= LOAD;               
--         
        when others =>
        next_state <= READ;
        end case;
        
        when LOAD =>
            datapath_ctrl_next <= "001100";            -- CONTROL signal to load unit for data reuse ( from ROM !! )
            
          -------- SOMETHING HAS TO BE DONE ABOUT SWITCH signal-----------
            SWITCH_reg_next <= SWITCH_reg + 1;
            
            if SWITCH_reg = 3 then
               row_counter_next <= row_counter +1;
               end if;
                
            if row_counter = 3 then                                          -- datapath_ctrl(2)
            col_counter_next <= col_counter +1;
            row_counter_next <= (others =>'0');
            end if;
            if col_counter = 4 then
            col_counter_next <= (others =>'0');
             end if;
           
--            if done_next = "000100" then                        --- Dependency on 000100 has to be removed.
            next_state <= MACC;
        
       when MACC => 
       datapath_ctrl_next <= "001000";  -- tells the system that MACC module is active
                                            -- datapath_ctrl(3)
      
--       if done_next = "001000" then       -- Must come from MAC units
          if MACC_COUNT = 7 then
          MAC_clear_reg <= '1';
          end if;
        case MACC_COUNT is ------ CAN CAUSE A POSSIBLE BUG...!!!!!
            when o"0" =>
            SWITCH_reg_next <= "00";
            
            when o"1" =>
            SWITCH_reg_next <= "01";
            
            when o"3" =>
            SWITCH_reg_next <= "10";
            
            when o"5" =>
            SWITCH_reg_next <= "11";
            
            when others =>
            NULL;
            end case;
            
          if MACC_COUNT = 7 then
            next_state <= RAM_STORE;
            MACC_COUNT_next <=(others =>'0');
            else
            next_state <= LOAD;             -- LOAD stage may be required.. for data re-use.
            MACC_COUNT_next <=MACC_COUNT + 1;
         end if;  
--      end if;
       
       when RAM_STORE =>
            
            datapath_ctrl_next <= "010000";       -- Enables RAM store module
            store_address_counter_next <= store_address_counter + 1;                                         -- datapath_ctrl(4)
			write_enable_next <= '1';
			if store_address_counter = 15 then
			next_state <= PERF_CAL;
--			store_address_counter_next <= (others => '0');
			end if;
      
       
       when PERF_CAL =>
            datapath_ctrl_next <= "100000";       -- enables PERFORMANCE block
                                                  -- datapath_ctrl(5)
          store_address_counter_next <= store_address_counter - 1;                             
        
        if store_address_counter = 0 then
			next_state <= START;
			end if;    
			        
      when others =>
      NULL;
                
      end case;
--   end if;
end process;
end Behavioral;

-------------------------MM_controller ENDS HERE -------------------
------------------------------------------------------