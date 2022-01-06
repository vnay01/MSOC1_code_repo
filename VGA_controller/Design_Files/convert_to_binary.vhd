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
	     scan_code_in : in unsigned(7 downto 0); 	-- In: 16h (dvs 1)
	     binary_out : out unsigned(3 downto 0)		-- Out: 0001
	 );
end convert_to_binary;

architecture convert_to_binary_arch of convert_to_binary is
begin
	
	comb: process(scan_code_in)
	begin
		case scan_code_in is
			when x"00" =>
				binary_out <= "1110"; -- Not to be interperated as binary output!       -- nOT SURE What it does?
			when x"16" =>
				binary_out <= "0001";
			when x"1E" =>
				binary_out <= "0010";
			when x"26" =>
				binary_out <= "0011";
			when x"25" =>
				binary_out <= "0100";
			when x"2E" =>
				binary_out <= "0101";
			when x"36" =>
				binary_out <= "0110";
			when x"3D" =>
				binary_out <= "0111";
			when x"3E" =>
				binary_out <= "1000";
			when x"46" =>
				binary_out <= "1001";
			when x"45" =>
				binary_out <= "0000";
		    when x"5A" =>
		        binary_out <= "1010";
		    when x"79" =>
		        binary_out <= "1011";
		    when x"78" =>
		        binary_out <= "1100";
		    when x"7C" =>
		        binary_out <= "1101";
		    when x"5D" =>
		        binary_out <= "1111";
			when others =>
				binary_out <= "1110"; -- Error, display E
			end case;

	end process;

-- simple combinational logic using case statements (LUT) 

end convert_to_binary_arch;