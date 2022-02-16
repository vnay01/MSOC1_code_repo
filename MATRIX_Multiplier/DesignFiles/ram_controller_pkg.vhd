library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package ram_control_pkg is

 
component ram_store is
Port ( 
        clk : in std_logic;
        reset : in std_logic;
        data_in : in std_logic_vector(16 downto 0);
        ram_en : in std_logic;              -- comes from control Unit - datapath_ctrl enable(7)
        write_done: out std_logic;            -- goes HIGH when one write is done . Control Path will use it
        data_out : out std_logic_vector(16 downto 0);
        ram_mat_done : out std_logic;       -- goes to HIGH when product matrix if filled
        ram_full : out std_logic            -- goes to HIGH when RAM is full
        );
end component;

end ram_control_pkg;

package body ram_control_pkg is

end ram_control_pkg;




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ram_store is
Port ( 
        clk : in std_logic;
        reset : in std_logic;
        data_in : in std_logic_vector(16 downto 0);
        ram_en : in std_logic;              -- comes from control Unit - datapath_ctrl enable(7)
        write_done: out std_logic;            -- goes HIGH when one write is done . Control Path will use it
        data_out : out std_logic_vector(16 downto 0);
        ram_mat_done : out std_logic;       -- goes to HIGH when product matrix if filled
        ram_full : out std_logic            -- goes to HIGH when RAM is full
        );
end ram_store;


architecture Behavioral of ram_store is

-- Component RAM Block ---- Will be changed while simulating with provided model
component ram_block IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
  );
END component;

-- SIGNALS
    signal write_enable: std_logic_vector(0 downto 0);
    signal address: std_logic_vector(7 downto 0);
    signal data_read: std_logic_vector(17 downto 0);
    signal data_write: std_logic_vector(17 downto 0);
--    signal ram_en_buff : std_logic;
    
    type memory_state_type is (idle, write_operands, read_operands, full);
    signal memory_state, memory_state_next: memory_state_type;
    signal address_counter, address_counter_next: unsigned(address'range);
    signal ram_mat_done_next : std_logic;
    signal mem_change : std_logic;              -- used to check for elements location being filled up.
    signal write_done_next : std_logic;
    
begin

RAM_IP: ram_block
      PORT MAP (
        clka => clk,
        ena => ram_en, 
        wea => write_enable,
        addra => address,
        dina => data_write,
        douta => data_read
      );  


registers: process (clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                memory_state <= idle;
                address_counter <= (others => '0');
                ram_mat_done <= '0';
                write_done <= '0';
            else
                memory_state <= memory_state_next;
                address_counter <= address_counter_next;
                ram_mat_done <= ram_mat_done_next;
                write_done <= write_done_next;
            end if;
        end if;
    end process;
process(address_counter)
begin
if (address_counter = 15) or (address_counter = 31) or (address_counter = 47) or (address_counter = 63) or (address_counter = 79) or (address_counter = 95)
                or (address_counter = 111) or (address_counter = 127) or (address_counter = 143) or (address_counter = 159) or (address_counter = 175) or (address_counter = 191)
                or (address_counter = 207) or (address_counter = 223) or (address_counter = 239) or (address_counter = 255) then
                mem_change <= '1' ;
                else
                mem_change <= '0';
                end if;
    end process;        

counting: process (ram_en, memory_state, address_counter, mem_change )
    begin
        memory_state_next <= memory_state;
        address_counter_next <= address_counter;
        write_enable(0) <= '1';
        data_write <= (others => '0');
        data_out <= (others=>'0');
        ram_mat_done_next <= '0';
        ram_full<= '0';
        write_done_next <= '0';

         case memory_state is
            when idle =>
            if ram_en = '1' then
                memory_state_next <= write_operands;
            end if;
            
            when write_operands =>
            
                write_done_next <= '1';
                data_write <= "0"&data_in;
                address_counter_next <= address_counter + 1;
                
                if address_counter = 255 then
                memory_state_next <= full;
                
                elsif mem_change = '1'  then
                ram_mat_done_next <= '1';
                write_enable(0) <= '0';             -- haven't figured out how to switch to read operation.... will look into it later!
                else
                memory_state_next <= idle;
                end if;
                

            when read_operands =>
                
                data_out <=  data_read(16 downto 0);
                address_counter_next <= address_counter - 1;
                
                if (address_counter = 0 ) then  
                  
                memory_state_next <= idle;
                end if;
                
                    
            when full =>
                ram_full<= '1';
                memory_state_next <= idle;
 
        end case;

       
    end process;
        
    address <= std_logic_vector(address_counter);    -- current address 
    
    

end behavioral;
