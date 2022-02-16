library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity demo_ram_store is
    port (
        clk: in std_logic;
        reset: in std_logic;
        data_in : in std_logic_vector(16 downto 0);
        ram_write: in std_logic;
        data_out : out std_logic_vector(16 downto 0);
        ram_en : in std_logic;              -- comes from control Unit - datapath_ctrl enable(7)
        ram_mat_done : out std_logic;       -- goes to HIGH when product matrix if filled
        ram_full : out std_logic  
    );
end demo_ram_store;


architecture behavioral of demo_ram_store is
    
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

    signal write_enable: std_logic_vector(0 downto 0);
    signal address: std_logic_vector(7 downto 0);
    signal data_read: std_logic_vector(17 downto 0);
    signal data_write: std_logic_vector(17 downto 0);
    signal ram_en_buff : std_logic;
    
    type memory_state_type is (init, write_operands, read_operands, finish);
    signal memory_state, memory_state_next: memory_state_type;
    signal address_counter, address_counter_next: unsigned(address'range);
    
begin

    registers: process (clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                memory_state <= init;
                address_counter <= (others => '0');
            else
                memory_state <= memory_state_next;
                address_counter <= address_counter_next;
            end if;
        end if;
    end process;
    
    counting: process (memory_state, address_counter)
    begin
        memory_state_next <= memory_state;
        address_counter_next <= address_counter;
        write_enable(0) <= '0';
        data_write <= (others => '0');
        data_out <= (others=>'0');
        
        case memory_state is
            when init =>
                memory_state_next <= write_operands;
                
            when write_operands =>
                write_enable(0) <= '1';                
                address_counter_next <= address_counter + 1;
--                data_write <= x"00" & std_logic_vector(address_counter) & "00";
                data_write <= "0" & data_in ;
                if (address_counter = 5) then
                    memory_state_next <= read_operands;
                end if;
                    
            when read_operands =>
                address_counter_next <= address_counter -1;
                data_out <=  data_read(16 downto 0);
                if (address_counter = 0) then
                    memory_state_next <= finish;
                end if;
                    
            when finish =>
                null;
        end case;
    end process;
        
    address <= std_logic_vector(address_counter);    -- current address 
    
    
    your_instance_name : ram_block
      PORT MAP (
        clka => clk,
        ena => '1', 
        wea => write_enable,
        addra => address,
        dina => data_write,
        douta => data_read
      );  

end behavioral;
