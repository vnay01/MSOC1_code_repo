library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;

entity MEM_WITH_RAM is
  Port (
            clk: in std_logic;
            reset : in std_logic;
            enable : in std_logic;       -- enable signal from CONTROLLER
            read_enable_mem : in std_logic;  -- when active, place contents of address into buffer and display
	        write_enable_mem : in std_logic;	
            data_in : in std_logic_vector( 16 downto 0 );
	        data_out : out std_logic_vector( 16 downto 0);
            mem_full_flag : out std_logic        
             );
end MEM_WITH_RAM;

architecture Behavioral of MEM_WITH_RAM is


component MEMORY_CONTROLLER is
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
end component;

component edge_detector is
    port (
	     clk : in std_logic;
	     reset : in std_logic;
	     button_in : in std_logic;
	     button_out : out std_logic
	 );
end component;


-- Interconnections
signal w_clk: std_logic;
signal w_reset : std_logic;
signal w_enable ,w_enable_latched: std_logic;
signal w_read_enable, w_write_enable : std_logic;
signal w_ack, w_ack_detected : std_logic;
signal w_ack_ram0, w_ack_ram1 : std_logic;
signal w_ram_bank_select : std_logic_vector( 1 downto 0 );
signal W_BANK : std_logic;
signal w_address : std_logic_vector( 9 downto 0 );
signal w_write_en : std_logic;
signal w_memory_full : std_logic;
signal w_data_in : std_logic_vector( 16 downto 0 );
signal w_data_out : std_logic_vector( 16 downto 0 ); 


begin
w_clk <= clk;
w_reset <= reset;
w_enable <= enable;
w_read_enable <= read_enable_mem;
w_write_enable <= write_enable_mem;	-- Comes from Main Controller
data_out <= w_data_out;
-- w_ack <= w_ack_ram0;
mem_full_flag <= w_memory_full;


Sample_input:process(clk, w_write_en)
begin
    if rising_edge( clk ) then
        if w_write_en = '1' then
        w_data_in <= data_in;
--        w_data_in(15 downto 8 ) <= x"0000";    -- MSB always set to 0 for now
        end if;
    end if;
end process;


Edge_detect: edge_detector
    port map(
	     clk => w_clk,
	     reset => w_reset,
	     button_in => w_ack,
	     button_out => w_ack_detected
	 );
--
DU_MEMORY_CONTROLLER :entity work.MEMORY_CONTROLLER(Behavioral)
port map (
           clk => w_clk,
           reset => w_reset,
           enable => w_enable,
           read_enable => w_read_enable, 
	       write_enable => w_write_enable,   
           ack => w_ack_detected,
           ram_bank_select => w_ram_bank_select,
           address => w_address,
           memory_full => w_memory_full,
           write_en => w_write_en       
           );


-- W_BANK <= w_ram_bank_select(0) and w_ram_bank_select(1);
W_BANK <= '1';

DU_RAM_BLOCK1: entity work.SRAM_SP_WRAPPER(rtl)
  port map (
    ClkxCI => w_clk,
    CSxSI => W_BANK,  -- CSN of internal RAM Block
    WExSI => w_write_en,            -- '1' for READ and '0' for write
    AddrxDI => w_address,
    RYxSO => w_ack,
    DataxDI => w_data_in,
    DataxDO => w_data_out
    );

-- UNCOMMENT BLOCK BELOW TO INCREASE RAM
--DU_RAM_BLOCK2: entity work.SRAM_SP_WRAPPER(rtl)
--  port map (
--    ClkxCI => w_clk,
--    CSxSI => w_ram_bank_select(1),
--    WExSI => w_write_en,
--    AddrxDI => w_address,
--    RYxSO => w_ack_ram1,
--    DataxDI => w_data_in,
--    DataxDO => w_data_out
--    );
end Behavioral;
