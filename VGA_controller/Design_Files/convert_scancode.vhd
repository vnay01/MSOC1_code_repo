-------------------------------------------------------------------------------
-- Title      : convert_scancode.vhd 
-- Project    : Keyboard VLSI Lab
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Description: 
-- 		        Implement a shift register to convert serial to parallel
-- 		        A counter to flag when the valid code is shifted in
--
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity convert_scancode is
    port (
	     clk : in std_logic;
	     rst : in std_logic;
	     edge_found : in std_logic;
	     serial_data : in std_logic;
	     valid_scan_code : out std_logic;
	     scan_code_out : out unsigned(7 downto 0)
	 );
end convert_scancode;

architecture convert_scancode_arch of convert_scancode is

	
	signal shift_register : std_logic_vector(10 downto 0) := (others => '0'); -- Testing 11 bits (including start bit)
	signal next_shift_register : std_logic_vector(10 downto 0) := (others => '0');
	-- signal counter : integer range 0 to 11; -- TODO we're not allowed to use integer. Change this!
	-- signal next_counter : integer range 0 to 11; 	-- TODO we're not allowed to user integer. Change this!
	signal next_counter : unsigned(3 downto 0) := (others => '0');
	signal counter 		: unsigned(3 downto 0) := (others => '0');

	signal next_valid_scan_code : std_logic := '0';
	signal next_scan_code_out : unsigned(7 downto 0);-- := (others => '0');
	signal crnt_scan_code_out : unsigned(7 downto 0);-- := (others => '0');
	
	
begin
	
	registers: process(clk, rst)
		begin
			if	rst = '1' then
				counter <= "0000";
				valid_scan_code <= '0';
				shift_register <= "00000000000";
				-- crnt_scan_code_out <= x"00";
				crnt_scan_code_out <= x"00";

			elsif rising_edge(clk) then
				counter <= next_counter;
				valid_scan_code <= next_valid_scan_code;

				crnt_scan_code_out <= next_scan_code_out;
				
				shift_register <= next_shift_register;

				-- scan_code_out <= next_scan_code_out;
				-- scan_code_out <= x"ff";
			end if;
			
		end process;


	
	comb_counter: process(edge_found, serial_data, counter, shift_register, crnt_scan_code_out)
		begin
			
			next_valid_scan_code <= '0'; 	-- Default value
			next_scan_code_out <= crnt_scan_code_out; -- Default value, so that scan_code_out doesn't change unless it should!

			next_shift_register <= shift_register;
			next_counter <= counter;

			if edge_found = '1' then

				next_counter <= counter + "0001";
				next_shift_register <= serial_data & shift_register(10 downto 1); -- Shifts data from right (for 11 bits) 

				-- if counter = "1011" then 
				-- 	next_counter <= "0001";
	
				-- if counter = "1011" then 	-- USE WITH OLD COUNTER
				if counter = "1010" then 	-- USE WITH NEW COUNTER
					-- next_counter <= "0001";	-- USE WITH OLD COUNTER
					next_counter <= "0000";	-- USE WITH NEW COUNTER

					-- if (next_shift_register(1) xor next_shift_register(2) xor next_shift_register(3) xor next_shift_register(4) xor next_shift_register(5) xor next_shift_register(6) xor next_shift_register(7) xor next_shift_register(8) xor next_shift_register(9)) = '1' then

						-- BELOW FOR OLD COUNTER
					-- if (shift_register(1) xor shift_register(2) xor shift_register(3) xor shift_register(4) xor shift_register(5) xor shift_register(6) xor shift_register(7) xor shift_register(8) xor shift_register(9)) = '1' and shift_register(0) = '0' then

						--BELOW FOR NEW COUNTER
						if (shift_register(10) xor shift_register(2) xor shift_register(3) xor shift_register(4) xor shift_register(5) xor shift_register(6) xor shift_register(7) xor shift_register(8) xor shift_register(9)) = '1' then
						-- Set scan_code_out 
						-- next_scan_code_out <= unsigned(shift_register(8 downto 1));	-- USE WITH OLD COUNTER
						next_scan_code_out <= unsigned(shift_register(9 downto 2)); -- USE WITH NEW COUNTER (COUNT TO 10 START FROM 1/0????)
						
						--	Check if scan_code is valid. Valid if scancode is F0 (break), 16h (1), 1Eh (2), 26h (3), 25h (4), 2Eh (5), 36h (6), 3Dh (7), 3Eh (8), 46h (9), 45h (0)
						
						-- case unsigned(shift_register(8 downto 1)) is  -- USE WITH OLD COUNTER
						case unsigned(shift_register(9 downto 2)) is	-- USE WITH NEW COUNTER
						-- when 16#16# =>	--	1
						when x"16" =>	--	1
							next_valid_scan_code <= '1';
						-- when 16#1E# =>	--	2
						when x"1E" =>	--	2
							next_valid_scan_code <= '1';
						-- when 16#26# =>	--	3
						when x"26" =>	--	3
							next_valid_scan_code <= '1';
						-- when 16#25# =>	--	4
						when x"25" =>	--	4
							next_valid_scan_code <= '1';
						-- when 16#2E# =>	--	5
						when x"2E" =>	--	5
							next_valid_scan_code <= '1';
						-- when 16#36# =>	--	6
						when x"36" =>	--	6
							next_valid_scan_code <= '1';
						-- when 16#3D# =>	--	7
						when x"3D" =>	--	7
							next_valid_scan_code <= '1';
						-- when 16#3E# =>	--	8
						when x"3E" =>	--	8
							next_valid_scan_code <= '1';
						-- when 16#46# =>	--	9
						when x"46" =>	--	9
							next_valid_scan_code <= '1';
						-- when 16#45# =>	--	0
						when x"45" =>	--	0
							next_valid_scan_code <= '1';	
						-- when 16#F0# =>	--	Break prefix
						when x"5A" =>                         -- added scan code for ENTER key
						  next_valid_scan_code <= '1';
						when x"79" =>                         --  +
						  next_valid_scan_code <= '1';
						when x"78"=>                          -- ' - '    
						next_valid_scan_code <= '1';
						when x"7C"=>                          -- multiply
						next_valid_scan_code <= '1';
						when x"5D" =>                         -- mod3
						next_valid_scan_code <= '1';
						
						when x"F0" =>	--	Break prefix
							next_valid_scan_code <= '1';
						when others =>
							next_valid_scan_code <= '0';
						end case;
					end if;
				end if;
			end if;
	end process;

	scan_code_out <= crnt_scan_code_out;

end convert_scancode_arch;
