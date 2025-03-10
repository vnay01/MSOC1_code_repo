library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;


package reg_pkg is

-- ROM_ACCESS component.... Replaced with ST_ROMHS_128x20m16_L when synthesized 
component ROM_ACCESS is
 Port ( 
        clk : in std_logic;
        reset : in std_logic;
        enable : in std_logic;                   
        address: in std_logic_vector(6 downto 0);
        dataROM : out std_logic_vector( 19 downto 0)    
        );
end component;

-- 8 byte Register
component DATA_REGISTER_8B is
Port ( 
        clk : in std_logic;
        reset : in std_logic;
        select_line : in std_logic;
        in_data : in std_logic_vector( 7 downto 0);  -- input matrix data
        element_sel : in std_logic_vector( 2 downto 0); -- internal assignmnet of data
        out_data :out  rom_out        --- output data
        );
end component;

-- 16 byte Register

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


---- DATA HOLDER component
component DATA_HOLDER is
 Port ( 
        clk : in std_logic;
        rst : in std_logic;
        enable: in std_logic;        
        address: in std_logic_vector( 6 downto 0 );                -- address generated from controller
        rom_en : in std_logic;
        rom_element_sel : in std_logic_vector( 2 downto 0 );        -- counts from 0 to 7
        input_data : in std_logic_vector(7 downto 0);
        block_select: in std_logic_vector( 3 downto 0);            -- comes from Controller
        element_select: in std_logic_vector( 2 downto 0);          -- cycles through 8 locations of register bank
        out_data_block_1A :out  rom_out;   --- output data          -- OBVIOUSLY ALL BLOCKS CAN BE MERGED TO FORM A SINGLE PORT
        out_data_block_2A : out rom_out;
        out_data_block_3A: out rom_out;
        out_data_block_4A: out rom_out;
        out_data_block_1B :out  rom_out;   --- output data          -- OBVIOUSLY ALL BLOCKS CAN BE MERGED TO FORM A SINGLE PORT
        out_data_block_2B : out rom_out;
        out_data_block_3B: out rom_out;
        out_data_block_4B: out rom_out;        
        out_data_block_6 : out rom_out;
        out_data_block_7: out rom_out;
        out_data_block_8: out rom_out;
        out_data_block_9: out rom_out;
        out_data_block_10: out rom_out;
        out_data_block_11: out rom_out       
  );
end component;


end reg_pkg;


package body reg_pkg is

end reg_pkg;


----------------------------------------------------------------------------------
--------------- 8 Byte register STARTS here --------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Block saves input matrix in registers
-- We are using 16x4 as size of input matrix : i.e. 64 elements

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;

entity DATA_REGISTER_8B is

Port ( 
        clk : in std_logic;
        reset : in std_logic;
        select_line : in std_logic;
        in_data : in std_logic_vector( 7 downto 0);  -- input matrix data
        element_sel : in std_logic_vector( 2 downto 0); -- internal assignmnet of data
        out_data :out  rom_out        --- output data
        );
end DATA_REGISTER_8B;

architecture Behavioral of DATA_REGISTER_8B is

signal input_buffer : std_logic_vector( 7 downto 0 );
signal element_matrix  : rom_out;
signal element_count : unsigned(2 downto 0);


begin

element_count <= unsigned( element_sel(2 downto 0) );       -- Discard MSB

input_buffer <= in_data;
process(clk, reset, element_count, input_buffer )
begin
--if rising_edge(clk) then
    if reset = '1' then
--    input_buffer <= ( others => '0');
    element_matrix <= (others =>(others => '0'));
    elsif rising_edge(clk ) then
        if select_line = '1' then
--            input_buffer <= in_data;        -- sample input data at each clock

        case element_count is
            when o"0" =>
            element_matrix(0) <= input_buffer;
            when o"1" =>
            element_matrix(1) <= input_buffer; 
            when o"2" =>
            element_matrix(2) <= input_buffer;
            when o"3" =>
            element_matrix(3) <= input_buffer;
            when o"4" =>
            element_matrix(4) <= input_buffer;     
            when o"5" =>
            element_matrix(5) <= input_buffer;
            when o"6" =>
            element_matrix(6) <= input_buffer; 
            when o"7" =>
            element_matrix(7) <= input_buffer;
            when others =>
            element_matrix <= (others =>(others => '0'));
            end case;
            end if;
        end if;
--        end if;
end process;

out_data <= element_matrix;     --- data is valid only when all read is complete.

end Behavioral;
------------------------------------------------------
--------------- 8 Byte register ENDS here ------------
------------------------------------------------------



------------------------------------------------------
--------------- 16 Byte register STARTS here ------------
------------------------------------------------------

----------------------------------------------------------------------------------
-- Block saves input matrix in registers
-- We are using 16x4 as size of input matrix : i.e. 64 elements

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;

entity DATA_REGISTER_16B is

Port ( 
        clk : in std_logic;
        reset : in std_logic;
        select_line : in std_logic;
        in_data : in std_logic_vector( 7 downto 0);  -- input matrix data
        element_sel : in std_logic_vector( 3 downto 0); -- internal assignmnet of data
        out_data :out  out_port        --- output data
        );
end DATA_REGISTER_16B;

architecture Behavioral of DATA_REGISTER_16B is

signal input_buffer : std_logic_vector( 7 downto 0 );
signal element_matrix  : out_port;
signal element_count : unsigned(3 downto 0);


begin

element_count <= unsigned( element_sel );


process(clk, element_count )
begin
if reset = '1' then
    input_buffer <= ( others => '0');
    element_matrix <= (others =>(others => '0'));
    elsif rising_edge(clk ) then
        if select_line = '1' then
            input_buffer <= in_data;        -- sample input data at each clock

        case element_count is
            when x"0" =>
            element_matrix(0) <= input_buffer;
            when x"1" =>
            element_matrix(1) <= input_buffer; 
            when x"2" =>
            element_matrix(2) <= input_buffer;
            when x"3" =>
            element_matrix(3) <= input_buffer;
            when x"4" =>
            element_matrix(4) <= input_buffer;     
            when x"5" =>
            element_matrix(5) <= input_buffer;
            when x"6" =>
            element_matrix(6) <= input_buffer; 
            when x"7" =>
            element_matrix(7) <= input_buffer;
            when x"8" =>
            element_matrix(8) <= input_buffer;
            when x"9" =>
            element_matrix(9) <= input_buffer;                   
            when x"a" =>
            element_matrix(10) <= input_buffer;
            when x"b" =>
            element_matrix(11) <= input_buffer; 
            when x"c" =>
            element_matrix(12) <= input_buffer;
            when x"d" =>
            element_matrix(13) <= input_buffer;
            when x"e" =>
            element_matrix(14) <= input_buffer;     
            when x"f" =>
            element_matrix(15) <= input_buffer;  
            when others =>
            element_matrix <= (others =>(others => '0'));
            end case;
            end if;
        end if;
end process;

out_data <= element_matrix;     --- data is valid only when all read is complete.

end Behavioral;

------------------------------------------------------
--------------- 16 Byte register ENDS here ------------
------------------------------------------------------

---------------------------------------------------------------
-----------------ROM ACCESS STARTS HERE -----------------------
---------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;

entity ROM_ACCESS is
 Port ( 
        clk : in std_logic;
        reset : in std_logic;
        enable : in std_logic;                      -- used here because ST_ROMHS_128x20m16_L has enable pin ( CSN )
        address: in std_logic_vector( 6 downto 0 );
        dataROM : out std_logic_vector( 19 downto 0 )    
        );
end ROM_ACCESS;

architecture Behavioral of ROM_ACCESS is
signal reg_address, reg_address_next: std_logic_vector(6 downto 0);
signal reg_enable, reg_enable_next : std_logic;
signal read_data: std_logic_vector( 19 downto 0); 
signal read_data_MSB, read_data_LSB : std_logic_vector(7 downto 0);
signal read_delay_2:std_logic_vector( 19 downto 0);
--signal reg_address : std_logic_vector(6 downto 0);

begin


reg_address <= address;

Register_Update_ROM_Read : process( clk, reset, enable )
    begin
        if reset = '1' then
        dataROM <= ( others => '0');
        read_delay_2 <= read_data;

    elsif rising_edge(clk) then
        if enable = '1' then 
        read_delay_2 <= read_data;          -- assignment at next rising clock
        dataROM <= read_delay_2;            -- Total delayed by 2 clock cycles
    end if;

  end if;     
    end process;

read_data <= read_data_MSB & x"0" & read_data_LSB;

-- Emulate data stored in ROM
HARD_CODED_ROM_DATA: process( address )
	begin
	
	case address is

        when "0000000" =>
        read_data_MSB <= x"03";
        read_data_LSB <= x"01";
        
        when "0000001" =>
        read_data_MSB <= x"02";
        read_data_LSB <= x"01";
        
        when "0000010" =>
        read_data_MSB <= x"08";
        read_data_LSB <= x"04";
        
        when "0000011" =>
        read_data_MSB <= x"02";
        read_data_LSB <= x"01";
        
        when "0000100" =>
        read_data_MSB <= x"12";
        read_data_LSB <= x"02";
        
        when "0000101" =>
        read_data_MSB <= x"02";
        read_data_LSB <= x"01";
        
        when "0000110" =>
        read_data_MSB <= x"01";
        read_data_LSB <= x"00";
        
        when "0000111" =>
        read_data_MSB <= x"02";
        read_data_LSB <= x"01";
         
        when "0001000" =>
        read_data_MSB <= x"16";
        read_data_LSB <= x"08";
        
        when "0001001" =>
        read_data_MSB <= x"FF";
        read_data_LSB <= x"38"; -- 56
         
        when "0001010" =>
        read_data_MSB <= x"0F"; --15
        read_data_LSB <= x"0C";     -- 12
        
        when "0001011" =>
        read_data_MSB <= x"4C";     -- 76
        read_data_LSB <= x"4E";     -- 78
         
        when "0001100" =>
        read_data_MSB <= x"28"; -- 40
        read_data_LSB <= x"10"; -- 16
        
        when "0001101" =>
        read_data_MSB <= x"5A"; -- 90
        read_data_LSB <= x"5C"; -- 92
         
        when "0001110" =>
        read_data_MSB <= x"0A";
        read_data_LSB <= x"02";
        
        when "0001111" =>
        read_data_MSB <= x"5B";
        read_data_LSB <= x"2B";
         
        when "0010000" =>          
        read_data_MSB <= x"0B";
        read_data_LSB <= x"03";
        
        when "0010001" =>
        read_data_MSB <= x"6D";
        read_data_LSB <= x"09";
        
        when "0010010" =>          
        read_data_MSB <= x"02";
        read_data_LSB <= x"06";
        
        when "0010011" =>
        read_data_MSB <= x"D5";
        read_data_LSB <= x"0A";
        
        when "0010100" =>
        read_data_MSB <= x"03";
        read_data_LSB <= x"09";
         
        when "0010101" =>          
        read_data_MSB <= x"6F";
        read_data_LSB <= x"43";
        
        when "0010110" =>
        read_data_MSB <= x"04";
        read_data_LSB <= x"0C";
        
        when "0010111" =>          
        read_data_MSB <= x"2E";
        read_data_LSB <= x"62";

        when others=>
        read_data_MSB <= (others => '1');
        read_data_LSB <= (others => '1');
        --NULL;
end case;

end process;


end Behavioral;
---------------------------------------------------------------
-----------------ROM ACCESS ENDS HERE -----------------------
---------------------------------------------------------------



---------------------------------------------------------------
--------------- DATA HOLDER REGISTER STARTS here --------------
---------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.pkg.all;


entity DATA_HOLDER is
 Port ( 
        clk : in std_logic;
        rst : in std_logic;
        enable: in std_logic;
        address: in std_logic_vector( 6 downto 0 );                -- address generated from controller
        rom_en : in std_logic;
        rom_element_sel : in std_logic_vector( 2 downto 0 );        -- counts from 0 to 7
        input_data : in std_logic_vector(7 downto 0);
        block_select: in std_logic_vector( 3 downto 0);            -- comes from Controller
        element_select: in std_logic_vector( 2 downto 0);          -- cycles through 8 locations of register bank
        en_rom_block : in std_logic_vector( 2 downto 0);  
        out_data_block_1A :out  rom_out;   --- output data          -- OBVIOUSLY ALL BLOCKS CAN BE MERGED TO FORM A SINGLE PORT
        out_data_block_2A : out rom_out;
        out_data_block_3A: out rom_out;
        out_data_block_4A: out rom_out;
        out_data_block_1B :out  rom_out;   --- output data          -- OBVIOUSLY ALL BLOCKS CAN BE MERGED TO FORM A SINGLE PORT
        out_data_block_2B : out rom_out;
        out_data_block_3B: out rom_out;
        out_data_block_4B: out rom_out;        
        out_data_block_6 : out rom_out;
        out_data_block_7: out rom_out;
        out_data_block_8: out rom_out;
        out_data_block_9: out rom_out;
        out_data_block_10: out rom_out;
        out_data_block_11: out rom_out       
  );
end DATA_HOLDER;

architecture Behavioral of DATA_HOLDER is

component DATA_REGISTER_8B is

Port ( 
        clk : in std_logic;
        reset : in std_logic;
        select_line : in std_logic;
        in_data : in std_logic_vector( 7 downto 0);  -- input matrix data
        element_sel : in std_logic_vector( 2 downto 0); -- internal assignmnet of data
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
signal w_select_line : std_logic_vector(7 downto 0);
signal w_in_data: std_logic_vector( 7 downto 0);
signal w_element_Sel : std_logic_vector( 2 downto 0);

type arr_delay_reg is array (0 to 6) of std_logic_vector(7 downto 0);
signal delay_reg : arr_delay_reg;

-- block connections wires: ROM Register
signal w_rom_en : std_logic;
signal w_address : std_logic_vector( 6 downto 0 );
signal w_rom_element_sel : std_logic_vector( 2 downto 0);
signal w_dataROM : std_logic_vector(19 downto 0);
signal w_en_rom_block : std_logic_vector( 2 downto 0);

begin

w_clk <= clk;
w_reset <= rst;
--w_in_data <= input_data;            -- Should I put this within a a register with enable
w_element_sel <= element_select;
w_address <= address;
w_rom_en <= rom_en;
w_rom_element_sel <= rom_element_sel;
w_en_rom_block <= en_rom_block;

--Sample_Input:process(clk, enable, input_data)
Sample_Input:process(clk)
    begin
    
    if rising_edge(clk) then
--    w_in_data <= input_data;
        delay_reg(0) <= input_data;
        if enable = '1' then
        for i in 1 to 6 loop
        delay_reg(i) <= delay_reg(i-1);
        end loop; 
        w_in_data <= delay_reg(6);
        end if;
    end if;
    end process;

-- Can use generate statement to make design configurable
BLOCK1A: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(0),
        in_data => w_in_data,
        element_sel => w_element_sel,
        out_data => out_data_block_1A
        );

BLOCK2A: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(1),
        in_data => w_in_data,
        element_sel => w_element_sel,
        out_data => out_data_block_2A
        );
BLOCK3A: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(2),
        in_data => w_in_data,
        element_sel => w_element_sel,
        out_data => out_data_block_3A
        );

BLOCK4A: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(3),
        in_data => w_in_data,
        element_sel => w_element_sel,
        out_data => out_data_block_4A
        );
BLOCK1B: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(4),
        in_data => w_in_data,
        element_sel => w_element_sel,
        out_data => out_data_block_1B
        );

BLOCK2B: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(5),
        in_data => w_in_data,
        element_sel => w_element_sel,
        out_data => out_data_block_2B
        );
BLOCK3B: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(6),
        in_data => w_in_data,
        element_sel => w_element_sel,
        out_data => out_data_block_3B
        );

BLOCK4B: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_select_line(7),
        in_data => w_in_data,
        element_sel => w_element_sel,
        out_data => out_data_block_4B
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

--w_en_rom_block_67 <= w_select_line(0) xor w_select_line(1);
--w_en_rom_block_89 <= w_select_line(2) xor w_select_line(3);
--w_en_rom_block_1011 <= w_select_line(4) xor w_select_line(5);
     
BLOCK6: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_en_rom_block(0),
        in_data => w_dataROM(7 downto 0),
        element_sel => w_rom_element_sel,
        out_data => out_data_block_6
        );

BLOCK7: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_en_rom_block(0),
        in_data => w_dataROM(19 downto 12),
        element_sel => w_rom_element_sel,
        out_data => out_data_block_7
        );
        
BLOCK8: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_en_rom_block(1),
        in_data =>  w_dataROM(7 downto 0),
        element_sel => w_rom_element_sel,
        out_data => out_data_block_8
        );
        
BLOCK9: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_en_rom_block(1),
        in_data => w_dataROM(19 downto 12),
        element_sel => w_rom_element_sel,
        out_data => out_data_block_9
        );

BLOCK10: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line => w_en_rom_block(2),
        in_data =>  w_dataROM(7 downto 0),
        element_sel => w_rom_element_sel,
        out_data => out_data_block_10
        );
        
BLOCK11: DATA_REGISTER_8B
Port map( 
        clk => w_clk,
        reset => w_reset,
        select_line =>w_en_rom_block(2),
        in_data => w_dataROM(19 downto 12),
        element_sel => w_rom_element_sel,
        out_data => out_data_block_11
        );





process( block_select )         -- controller selects which BLOCK will remain active and when
begin
--if rising_edge(clk) then
    case block_select is
   
    when x"0" =>                    -- 1
    w_select_line <= x"01";
     
    when x"1" =>                    -- 2
    w_select_line <= x"02";

    when x"2" =>                    -- 4
    w_select_line <= x"04";    

    when x"3" =>                    -- 8
    w_select_line <= x"08";
    
    when x"4" =>                    -- 16
    w_select_line <= x"10";
     
    when x"5" =>                    -- 32
    w_select_line <= x"20";

    when x"6" =>                    -- 64
    w_select_line <= x"40";        
    
    when x"7" =>                     -- 128
    w_select_line <= x"80";
    
    when others =>                  -- Disable all blocks!
    w_select_line <= x"00";     
    
    end case;
--end if;
    
end process;

end Behavioral;


---------------------------------------------------------------
--------------- DATA HOLDER REGISTER ENDS here --------------
---------------------------------------------------------------
