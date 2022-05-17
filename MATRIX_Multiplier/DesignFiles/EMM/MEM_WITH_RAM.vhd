library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity MEM_WITH_RAM is
  Port (
            clk: in std_logic;
            reset : in std_logic;
            enable : in std_logic;       -- enable signal from CONTROLLER
           read_enable : in std_logic;  -- when active, place contents of address into buffer and display
           data_in : in std_logic_vector( 15 downto 0 );
           data_out : out std_logic_vector( 31 downto 0)
             );
end MEM_WITH_RAM;

architecture Behavioral of MEM_WITH_RAM is

component SRAM_SP_WRAPPER is
  port (
    ClkxCI  : in  std_logic;            -- Clock
    CSxSI   : in  std_logic;            -- Active Low -- CHIP select
    WExSI   : in  std_logic;            --Active Low --- Write enable
    AddrxDI : in  std_logic_vector (9 downto 0);
    RYxSO   : out std_logic;            -- acknowledge
    DataxDI : in  std_logic_vector (31 downto 0);       -- input data
    DataxDO : out std_logic_vector (31 downto 0)        -- output data
    );
end component;

component MEMORY_CONTROLLER is
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
end component;


-- Interconnections
signal w_clk: std_logic;
signal w_reset : std_logic;
signal w_enable : std_logic;
signal w_read_enable : std_logic;
signal w_ack : std_logic;
signal w_ack_ram0 , w_ack_ram1 : std_logic;
signal w_ram_bank_select : std_logic_vector( 1 downto 0 );
signal w_address : std_logic_vector( 9 downto 0 );
signal w_write_en : std_logic;

signal w_data_in : std_logic_vector( 31 downto 0 );
signal w_data_out : std_logic_vector( 31 downto 0 ); 

begin
w_clk <= clk;
w_reset <= reset;
w_enable <= enable;
w_read_enable <= read_enable;
data_out <= w_data_out;
w_ack <= w_ack_ram0 or w_ack_ram1;


process( clk, w_write_en  )
    begin
        if rising_edge( clk ) then
        if w_write_en = '1' then
        
        w_data_in(15 downto 0) <= data_in;
        w_data_in( 31 downto 16 ) <= w_data_in(15 downto 0);
        end if;
        end if;
    end process;


DU_MEMORY_CONTROLLER :MEMORY_CONTROLLER
port map (
           clk => w_clk,
           reset => w_reset,
           enable => w_enable,
           read_enable => w_read_enable,
           ack => w_ack,
           ram_bank_select => w_ram_bank_select,
           address => w_address,
           write_en => w_write_en       
           );



DU_RAM_BLOCK1: SRAM_SP_WRAPPER
  port map (
    ClkxCI => w_clk,
    CSxSI => w_ram_bank_select(0),
    WExSI => w_write_en,
    AddrxDI => w_address,
    RYxSO => w_ack_ram0,
    DataxDI => w_data_in,
    DataxDO => w_data_out
    );

DU_RAM_BLOCK2: SRAM_SP_WRAPPER
  port map (
    ClkxCI => w_clk,
    CSxSI => w_ram_bank_select(1),
    WExSI => w_write_en,
    AddrxDI => w_address,
    RYxSO => w_ack_ram1,
    DataxDI => w_data_in,
    DataxDO => w_data_out
    );
end Behavioral;
