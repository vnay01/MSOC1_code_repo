-- convert scan code file
-- takes input serial data of 11 bits and stores them in a right shift
-- register of size 10 bits. This is so as to discard the start bit!

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity convert_scan_code is
	port (
			clk: in std_logic;
			data_in : in std_logic;
			shift_trigger: in std_logic;
			data_out: out std_logic_vector(9 downto 0);
			valid_code : out std_logic
			);
	end convert_scan_code;
	
-- architecture of convert scan code
architecture behavioral of convert_scan_code is
	
-- signal declarations
signal shift_register: std_logic_vector(9 downto 0) :=(others => '0');
signal count : std_logic_vector( 3 downto 0);		-- with 100 MHz system clock, the counter has to count for 11 clock cycles
--signal valid_code_out : std_logic ;
begin
	
	shifting_data: process(clk, data_in, shift_trigger)
	begin
	if shift_trigger = '0' then
	shift_register <= (others =>'0');
	else
	if rising_edge(clk) then
	   if count < 11 then
	shift_register(9)<= data_in;                                   -- incoming bit goes into MSB
	shift_register(8 downto 0) <= shift_register(9 downto 1);      -- shifting towards right
--	shift_register(0) <= data_in;                                  -- incoming bit goes into LSB
--	shift_register(9 downto 1) <= shift_register(8 downto 0) ;     -- shifting towards left
	end if;
	end if;
	end if;
	
	end process;

---- As of now we need to consider only the numbers from the keyboard ----
---- Refer PS2 keyboard make and break code data sheet ----
	valid_code_counter: process(clk)			
	begin
	
--	valid_code <= valid_code_out;
	--- use a counter to sample contents of the shiftregister and later use it for checking the validity of the data!!!
	if (shift_trigger ='0') or (count = 11) then
	count <= (others =>'0');
	elsif rising_edge(clk) then
	count <= count + 1;
	end if;
	end process;
	
	valid_code_output : process(count)
	begin
	if count = 11 then
	valid_code <= '1';
	data_out <= shift_register;                
	else
	valid_code <= '0';
	data_out <= (others => '0');
	end if;
	end process;
	
	
end behavioral;