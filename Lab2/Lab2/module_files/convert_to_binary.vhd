-------------------------------------------------------------------------------
-- Title      : convert_to_binary.vhd 
-- Project    : Keyboard VLSI Lab
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Description: 
-- 		        Look-up-Table
-- 		
--
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity convert_to_binary is
    port (
	     scan_code_in : in unsigned(7 downto 0);
	     binary_out : out unsigned(3 downto 0)
	 );
end convert_to_binary;

architecture convert_to_binary_arch of convert_to_binary is
begin

-- simple combinational logic using case statements (LUT) 

end convert_to_binary_arch;
