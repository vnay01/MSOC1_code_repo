-------------------------------------------------------------------------------
-- Title      : binary_to_sg.vhd 
-- Project    : Keyboard VLSI Lab
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Description: 
-- 	            Simple Look-Up-Table	
-- 		
--
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity binary_to_sg is
    port (
	     binary_in : in unsigned(3 downto 0);
--	     sev_seg   : out unsigned(7 downto 0)      -- 8-bit sized !!!
	     sev_seg   : out unsigned(6 downto 0)      -- uncomment
	 );
end binary_to_sg;

architecture binary_to_sg_arch of binary_to_sg is

	-- signal stable_binary_in : unsigned(3 downto 0) := (others => '0'); -- Should not be needed, this will just be a signal..
begin

	process(binary_in)
	begin
		-- sev_seg <= "11000000";
		-- stable_binary_in <= binary_in;
		-- case stable_binary_in is	

		case binary_in is
			when "0000" => 
				sev_seg <= "1000000";
			when "0001" => 
				sev_seg <= "1111001";
			when "0010" => 
				sev_seg <= "0100100";
			when "0011" => 
				sev_seg <= "0110000";
			when "0100" => 
				sev_seg <= "0011001";
			when "0101" => 
				sev_seg <= "0010010";
			when "0110" => 
				sev_seg <= "0000010";
			when "0111" => 
				sev_seg <= "1111000";
			when "1000" => 
				sev_seg <= "0000000";
			when "1001" => 
				sev_seg <= "0011000";
			when "1111" => -- Error
				sev_seg <= "0000110";
			when "1110" => -- To be interperated as empty!
				sev_seg <= "1111111"; -- should be 111...1. Using others for testing
			when others =>
				sev_seg <= "0000110";
		end case;

		----------- test---------
		-- sev_seg <= "0000" & binary_in;
				
	end process;



end binary_to_sg_arch;
