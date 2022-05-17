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


process(clk, element_count )
begin
if reset = '1' then
    input_buffer <= ( others => '0');
    element_matrix <= (others =>(others => '0'));
    elsif rising_edge(clk ) then
        if select_line = '1' then
            input_buffer <= in_data;        -- sample input data at each clock

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
end process;

out_data <= element_matrix;     --- data is valid only when all read is complete.

end Behavioral;
