-- Operations corresponding to control signal from mem_controller
    -- 00 -- Ready  - No Operation
    -- 01 -- Write  - Push1 data and increment address counter by 1
    -- 10 -- Read   - POP 1 data and decrement address counter by 1 -- Perform this operation 3 times then return control by waiting for input signal
    -- 11 -- Do nothing!!!!
------------------------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use ieee.std_logic_unsigned.all;
--use IEEE.STD_LOGIC_ARITH.ALL;

--- Additional functionality can be added : Memory full or Memory empty flag -- will add later @05-Jan-2021

entity mem_operations is
	port (  
	       clk : in std_logic;
	       reset : in std_logic;
	       control_signal: in std_logic_vector(1 downto 0); -- comes from memory controller module
	       data_in: in std_logic_vector(7 downto 0);   -- data from keyboard : 8-bits.
	       data_out: out std_logic_vector(7 downto 0)  -- data out from memory : 8-bits
	       
				);
				
end mem_operations;

-- architecture of mem_operations

architecture behavioral of mem_operations is

-- RAM module
component blk_mem_gen_0 is
    port (
          clka : IN STD_LOGIC;
          wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
          addra : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
          dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
          douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
  end component;
  
-- signal definitions
signal address_counter : std_logic_vector(12 downto 0);         -- connects with addra of RAM
signal data_write : std_logic_vector(7 downto 0);    -- holding stage of input data . passed to RAM location only when WRITE control is enabled 
--signal data_read : std_logic_vector(7 downto 0);   -- holding stage of output data -- passed to Output dataline only when READ control is enabled
signal write_enable , read_enable : std_logic ;     -- can be used to check control signal for requested operation
signal current_mem_addr, next_mem_addr : unsigned(address_counter'range); -- used to implement a counter for memory address

--signal mem_empty : std_logic;                           -- flag to show empty memory stack.
--signal mem_full : std_logic;                            -- flag to show full memory stack.

begin

------------------------ RAM module Instantiation ------------------------------
RAM_module : blk_mem_gen_0
    port map(   
                clka => clk,
                wea(0) => write_enable,         -- What about read_enable !!!? Come back to it later.
                addra => address_counter,
                dina => data_write,
                douta => data_out
                );


address_counter <= std_logic_vector(current_mem_addr);


--------------------------------------------------------
-------- Current Memory address synch with clk ---------

 mem_addr_sync: process(clk)
        begin

            if reset = '1' then
             current_mem_addr <= (others => '0'); 
             else
              if rising_edge(clk) then
              
             current_mem_addr <= next_mem_addr; 
             end if;
           end if;
        end process;    

        
   memory_address_counter:process(control_signal, data_in, current_mem_addr, clk)
 
            begin

--                if rising_edge(clk) then

                case control_signal is
                
                when "00" =>
                write_enable <= '0';
                read_enable <= '0';
--                data_write <= (others =>'0');
--                next_mem_addr <= current_mem_addr_buffer;
                next_mem_addr <= current_mem_addr;
                
                when "01" =>                --- write mode
                write_enable <= '1';
                read_enable <= '0';
                data_write <= data_in;
                next_mem_addr <= current_mem_addr + 1;
                
                when "10" =>                --- read mode
                write_enable <= '0';
                read_enable <= '1';
--                data_write <= (others => '0');
                next_mem_addr  <= current_mem_addr - 1;
                
                
                when "11" =>
                write_enable <= '0';
                read_enable <= '0';
--                data_write <= (others => '0');
--                next_mem_addr <= current_mem_addr_buffer;
                next_mem_addr <= current_mem_addr;
                
                when others =>
                write_enable <= '0';
                read_enable <= '0';
--                data_write <= (others => '0');
--                next_mem_addr <= current_mem_addr_buffer;
                next_mem_addr <= current_mem_addr;

                end case;
                    
--            end if;
            end process;



end behavioral;