-------------
----- ROM Store and READ 
----------- Just a simulation!!

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity Input_Mat_Load is

    port (
            clk : std_logic;
--            reset : std_logic;
            enable : in std_logic;
            data_in : in std_logic_vector( 31 downto 0);    -- Data is generated in chunks of 7 bits 
--            addr : in std_logic_vector( 3 downto 0);
            ram_addr : in std_logic_vector(7 downto 0);
            data_out : out std_logic_vector( 31 downto 0)   -- Data is STORED and READ as 14 bit word            
            );
end Input_Mat_Load;

architecture Behavioral of Input_Mat_Load is


component Input_Matrix IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END component;


---Component ends here ---

-- Signals 

signal o_data_buffer : std_logic_vector( 31 downto 0);
signal in_data_buffer1, in_data_buffer : std_logic_vector( 6 downto 0);     -- stores input data 

signal ram_we, not_ram_we : std_logic_vector(0 downto 0);

begin


  ram_we(0 downto 0) <= (others => '1'); 
  not_ram_we <= not (ram_we);
  
  RAM_mem : Input_Matrix
  port map (
    clka => clk,
    ena => enable,
    wea => not_ram_we,
    addra=>ram_addr,
    dina => data_in,
    douta =>data_out
                );
--READ: process( clk, addr, enable )
--begin
--  if rising_edge(clk) then
--    if enable = '1' then
      
--            data_out <= o_data_buffer;
--            else
--            data_out <= (others => '0');
--            end if;
--    end if;
--end process;



end Behavioral;
