-------------- Design Change Ideas
-----------  Can I use the same 8-bit port as Input and later combine these 8-bit 
-----------  port to 8-bit Output port to form a 16-bit output port.



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;
use work.reg_pkg.all;
use work.comp_pkg.all;



entity MATRIX_MULTIPLIER is
 Port ( 
       clk : in std_logic;
       reset : in std_logic;
       start: in std_logic;
       read: in std_logic;
       input_matrix : in std_logic_vector( 7 downto 0 );        -- Can be combined with output port LSB
       status : out std_logic;                              -- controller will update this
       output_matrix : out std_logic_vector( 15 downto 0 )  -- Goes to RAM store controller 
       );
end MATRIX_MULTIPLIER;

architecture Behavioral of MATRIX_MULTIPLIER is

-- CONTROLLER COMPONENT
component CONTROLLER is
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
end component;

-- MEMORY contorller 
component MEM_WITH_RAM is
  Port (
            clk: in std_logic;
            reset : in std_logic;
            enable : in std_logic;       -- enable signal from CONTROLLER
           read_enable : in std_logic;  -- when active, place contents of address into buffer and display
           data_in : in std_logic_vector( 15 downto 0 );
           data_out : out std_logic_vector( 31 downto 0)
             );
end component;

-- SIGNALS
-- CONTROLLER block connections
signal w_init : std_logic;
signal w_ram_read : std_logic;
signal w_busy : std_logic;
signal w_rom_bank_sel : std_logic_vector( 3 downto 0 );
signal w_rom_enable : std_logic;
signal w_rom_address : std_logic_vector( 6 downto 0 );
signal w_compute_en : std_logic;
signal w_compute_clear: std_logic;
signal w_read_enable : std_logic;

-- DATA_HOLDER block connections
signal w_reset : std_logic;
signal w_address : std_logic_vector( 6 downto 0);
signal w_rom_en : std_logic;
signal w_rom_element_sel : std_logic_vector( 2 downto 0 );
signal w_input_data : std_logic_vector( 7 downto 0) ;
signal w_block_select : std_logic_vector( 2 downto 0);
signal w_element_select : std_logic_vector( 2 downto 0);
signal w_out_data_block_1A, w_out_data_block_2A, w_out_data_block_3A, w_out_data_block_4A : rom_out;
signal w_out_data_block_1B, w_out_data_block_2B, w_out_data_block_3B, w_out_data_block_4B : rom_out;
signal w_out_data_block_6, w_out_data_block_7, w_out_data_block_8: rom_out;
signal w_out_data_block_9, w_out_data_block_10, w_out_data_block_11 : rom_out;

-- LOADER Unit connections
signal w_loader_enable : std_logic;
signal w_col_count,w_row_count : unsigned( 3 downto 0 );
signal w_data_block_1A, w_data_block_2A, w_data_block_3A, w_data_block_4A : rom_out;
signal w_data_block_1B, w_data_block_2B, w_data_block_3B, w_data_block_4B : rom_out;
signal w_data_block_6, w_data_block_7, w_data_block_8, w_data_block_9, w_data_block_10, w_data_block_11 : rom_out;
signal w_out_x1, w_out_x2, w_out_x3, w_out_x4 : std_logic_vector( 7 downto 0 );
signal w_out_a1, w_out_a2, w_out_a3, w_out_a4 : std_logic_vector( 7 downto 0 );

-- COMPUTE Unit connections
signal w_clear : std_logic;
signal w_operand_x1, w_operand_x2, w_operand_x3, w_operand_x4 : std_logic_vector( 7 downto 0 );
signal w_operand_a1, w_operand_a2, w_operand_a3, w_operand_a4 : std_logic_vector( 7 downto 0 );
signal w_prod_element : std_logic_vector( 15 downto 0 );

-- RAM CTRL signals
signal w_enable : std_logic;
signal w_prod_element_32 : std_logic_vector( 31 downto 0 ); -- NEEDS fixing

begin

--- GLOBAL Connections
w_ram_read <= read;
w_reset <= reset;
output_matrix <= w_prod_element;
w_input_data <= input_matrix ;
w_init <= start;
status <= w_busy;

--- Design Starts here
DUT_CONTROLLER : CONTROLLER
  Port map( 
        clk => clk,
        reset => w_reset,
        init => w_init,
        ram_read => w_ram_read,
        busy => w_busy,
        block_select => w_block_select,
        element_select => w_element_select,
        rom_bank_sel => w_rom_element_sel,
        rom_enable => w_rom_en,
        rom_address => w_address,
        loader_enable => w_loader_enable,
        col_count => w_col_count,
        row_count => w_row_count,
        compute_en => w_compute_en,
        compute_clear => w_compute_clear,
        ram_enable => w_enable, 
        ram_read_enable => w_read_enable             
        );


DU_DATA_HOLDER : DATA_HOLDER
    port map (
        clk => clk,
        rst => w_reset,
        address => w_address,
        rom_en => w_rom_en,
        rom_element_sel => w_rom_element_sel,
        input_data => w_input_data,
        block_select => w_block_select,
        element_select => w_element_select,
        out_data_block_1A => w_out_data_block_1A,
        out_data_block_2A => w_out_data_block_2A,
        out_data_block_3A => w_out_data_block_3A,
        out_data_block_4A => w_out_data_block_4A,
        out_data_block_1B => w_out_data_block_1B,
        out_data_block_2B => w_out_data_block_2B,
        out_data_block_3B => w_out_data_block_3B,
        out_data_block_4B => w_out_data_block_4B,        
        out_data_block_6 => w_out_data_block_6,
        out_data_block_7 => w_out_data_block_7,
        out_data_block_8 => w_out_data_block_8,
        out_data_block_9 => w_out_data_block_9,
        out_data_block_10 => w_out_data_block_10,
        out_data_block_11 =>  w_out_data_block_11
        );
        
        
w_data_block_1A <= w_out_data_block_1A;
w_data_block_2A <= w_out_data_block_2A;
w_data_block_3A <= w_out_data_block_3A;
w_data_block_4A <= w_out_data_block_4A;
w_data_block_1B <= w_out_data_block_1B;
w_data_block_2B <= w_out_data_block_2B;
w_data_block_3B <= w_out_data_block_3B;
w_data_block_4B <= w_out_data_block_4B;
w_data_block_6 <= w_out_data_block_6;
w_data_block_7 <= w_out_data_block_7;
w_data_block_8 <= w_out_data_block_8;
w_data_block_9 <= w_out_data_block_9;
w_data_block_10 <= w_out_data_block_10;
w_data_block_11 <= w_out_data_block_11;      
        
DU_LOADER_UNIT :LOADER_UNIT           -- Assuming Loader unit has been correctly designed.# Need testing of loader unit to check functionality
  Port map ( 
        clk => clk,
        reset => w_reset,
        enable => w_loader_enable,
        col_count => w_col_count,
        row_count => w_row_count,
        data_block_1A => w_data_block_1A,
        data_block_2A => w_data_block_2A,
        data_block_3A => w_data_block_3A,
        data_block_4A => w_data_block_4A,
        data_block_1B => w_data_block_1B,
        data_block_2B => w_data_block_2B,
        data_block_3B => w_data_block_3B,
        data_block_4B => w_data_block_4B,        
        data_block_6 => w_data_block_6,
        data_block_7 => w_data_block_7,
        data_block_8 => w_data_block_8,
        data_block_9 => w_data_block_9,
        data_block_10 => w_data_block_10,
        data_block_11 => w_data_block_11,
        out_x1 => w_out_x1,
        out_x2 => w_out_x2,
        out_x3 => w_out_x3,
        out_x4 => w_out_x4,
        out_a1 => w_out_a1,
        out_a2 => w_out_a2,
        out_a3 => w_out_a3,
        out_a4 => w_out_a4
        );
        
 w_operand_x1 <= w_out_x1;
 w_operand_x2 <= w_out_x2;
 w_operand_x3 <= w_out_x3;
 w_operand_x4 <= w_out_x4;
 w_operand_a1 <= w_out_a1;
 w_operand_a2 <= w_out_a2;
 w_operand_a3 <= w_out_a3;
 w_operand_a4 <= w_out_a4;
 
 
DU_COMPUTE_UNIT : COMPUTE_UNIT
    port map(
        clk => clk,
        reset => w_reset,
        clear => w_compute_clear,
        enable => w_compute_en,
        operand_x1 => w_operand_x1,
        operand_x2 => w_operand_x2,
        operand_x3 => w_operand_x3,
        operand_x4 => w_operand_x4,
        operand_a1 => w_operand_a1,
        operand_a2 => w_operand_a2,
        operand_a3 => w_operand_a3,
        operand_a4 => w_operand_a4,
        prod_element => w_prod_element
        );
        
-- UNCOMMENT the line below to reconnect output data line. NOT TO BE USED DURING TESTING        

-- output_matrix <= w_prod_element_32( 15 downto 0 );
 
 --------- UNCOMMENT ONLY WHEN TESTING -----------
 output_matrix <= w_prod_element( 15 downto 0 );
 
-------------------------------------------------- 
DU_MEM_WITH_RAM: MEM_WITH_RAM 
  Port map(
           clk => clk,
           reset => w_reset,
           enable => w_enable,
           read_enable => w_read_enable,
           data_in => w_prod_element,
           data_out => w_prod_element_32
             );
end Behavioral;
