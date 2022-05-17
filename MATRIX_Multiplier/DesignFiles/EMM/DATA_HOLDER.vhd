library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;


entity DATA_HOLDER is
 Port ( 
        clk : in std_logic;
        rst : in std_logic;
        address: in std_logic_vector( 6 downto 0 );                -- address generated from controller
        rom_en : in std_logic;
        rom_element_sel : in std_logic_vector( 3 downto 0 );        -- counts from 0 to 7
        input_data : in std_logic_vector(7 downto 0);
        block_select: in std_logic_vector( 1 downto 0);            -- comes from Controller
        element_select: in std_logic_vector( 3 downto 0);
        out_data_block_1 :out  out_port;   --- output data          -- OBVIOUSLY ALL BLOCKS CAN BE MERGED TO FORM A SINGLE PORT
        out_data_block_2 : out out_port;
        out_data_block_3: out out_port;
        out_data_block_4: out out_port;
        out_data_block_6 : out rom_out;
        out_data_block_7: out rom_out;
        out_data_block_8: out rom_out;
        out_data_block_9: out rom_out;
        out_data_block_10: out rom_out;
        out_data_block_11: out rom_out       
  );
end DATA_HOLDER;

architecture Behavioral of DATA_HOLDER is

component DATA_REGISTER_16B is

Port ( 
        clk : in std_logic;
        reset : in std_logic;
        select_line : in std_logic;
        in_data : in std_logic_vector( 7 downto 0);  -- input matrix data
        element_sel : in std_logic_vector( 3 downto 0); -- internal assignmnet of data
        out_data :out  out_port        --- output data
        );
end component;

component DATA_REGISTER_8B is

Port ( 
        clk : in std_logic;
        reset : in std_logic;
        select_line : in std_logic;
        in_data : in std_logic_vector( 7 downto 0);  -- input matrix data
        element_sel : in std_logic_vector( 3 downto 0); -- internal assignmnet of data
        out_data :out  rom_out        --- output data
        );
end component;

-- ROM access               @ ROM_ACCESS will be replaced with ST_ROMHS_128x20m16_L from STM library
component ROM_ACCESS is
 Port ( 
        clk : in std_logic;
        reset : in std_logic;
        enable : in std_logic;                      -- used here because ST_ROMHS_128x20m16_L has enable pin ( CSN )
        address: in std_logic_vector(6 downto 0);
        dataROM : out std_logic_vector( 19 downto 0)    
        );
end component;

-- SIGNALS
-- block connections wires DATA Register
signal w_clk, w_reset : std_logic;
signal w_select_line : std_logic_vector(3 downto 0);
signal w_in_data: std_logic_vector( 7 downto 0);
signal w_element_Sel : std_logic_vector( 3 downto 0);

-- block connections wires: ROM Register
signal w_rom_en : std_logic;
signal w_address : std_logic_vector( 6 downto 0 );
signal w_rom_element_sel : std_logic_vector( 3 downto 0);
signal w_dataROM : std_logic_vector(19 downto 0);


begin

w_clk <= clk;
w_reset <= rst;
w_in_data <= input_data;
w_element_sel <= element_select;
w_address <= address;
w_rom_en <= rom_en;
w_rom_element_sel <= rom_element_sel;

-- Can use generate statement to make design configurable
BLOCK1: DATA_REGISTER_16B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(0),
        in_data => w_in_data,
        element_sel => w_element_sel,
        out_data => out_data_block_1
        );

BLOCK2: DATA_REGISTER_16B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(1),
        in_data => w_in_data,
        element_sel => w_element_sel,
        out_data => out_data_block_2
        );
BLOCK3: DATA_REGISTER_16B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(2),
        in_data => w_in_data,
        element_sel => w_element_sel,
        out_data => out_data_block_3
        );

BLOCK4: DATA_REGISTER_16B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(3),
        in_data => w_in_data,
        element_sel => w_element_sel,
        out_data => out_data_block_4
        );

BLOCK5: ROM_ACCESS
 Port map( 
        clk => w_clk,
        reset => w_reset,
        enable => w_rom_en,
        address => w_address,
        dataROM => w_dataROM
        );

-- dataROM is 20 bits wide with 0 padding between the two elements {* refer documentation} 
    -- In order to re-use the same design for DATA registers, each word which is read from a ROM address will be stored in 2 separate 8 bit registers



     
BLOCK6: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(0),
        in_data => w_dataROM(19 downto 12),
        element_sel => w_rom_element_sel,
        out_data => out_data_block_6
        );

BLOCK7: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(0),
        in_data => w_dataROM(7 downto 0),
        element_sel => w_rom_element_sel,
        out_data => out_data_block_7
        );
        
BLOCK8: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(1),
        in_data => w_dataROM(19 downto 12),
        element_sel => w_rom_element_sel,
        out_data => out_data_block_8
        );
        
BLOCK9: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(1),
        in_data => w_dataROM(7 downto 0),
        element_sel => w_rom_element_sel,
        out_data => out_data_block_9
        );

BLOCK10: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(2),
        in_data => w_dataROM(19 downto 12),
        element_sel => w_element_sel,
        out_data => out_data_block_10
        );
        
BLOCK11: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(2),
        in_data => w_dataROM(7 downto 0),
        element_sel => w_element_sel,
        out_data => out_data_block_11
        );





process( block_select )         -- controller selects which BLOCK will remain active and when
begin
    case block_select is
    when "00" =>
    w_select_line <= x"1";
    
    when "01" =>
    w_select_line <= x"2";
     
    when "10" =>
    w_select_line <= x"4";

    when "11" =>
    w_select_line <= x"8";    
    
    when others =>                  -- Disable all blocks!
    w_select_line <= x"0";     
    
    end case;
    
end process;

end Behavioral;
