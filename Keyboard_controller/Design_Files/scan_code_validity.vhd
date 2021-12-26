-- This module takes input data from convert scan code block
-- checks for its validity and forwards it 
-- else discards the data

library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity scan_code_validity is
	port (
			clk : in std_logic;
			data_in_scan_code : in std_logic_vector(9 downto 0);
			data_available: in std_logic;
			valid_data: out std_logic;
			valid_data_out : out std_logic_vector(7 downto 0)
			);
	end scan_code_validity;
	
	
	---- architecture 
	
architecture behavioral of scan_code_validity is
	
signal data_in_buffer :unsigned(9 downto 0);
signal valid_data_out_buffer : std_logic_vector(7 downto 0);
signal data_available_buffer : std_logic;


begin
	
	data_in_buffer <=unsigned(data_in_scan_code);			-- stores incoming data bits 
	
	data_available_buffer <= data_available; -- set to HIGH by incoming signal which is active when 10 bits have been stored
	valid_data_out <= valid_data_out_buffer;
	
process(clk, data_in_buffer, data_available)
begin
        if rising_edge(clk) then
        
        if data_available = '1' then
		
		case data_in_buffer is
		
		when ("00")& x"F0" =>
		valid_data <= '1';
		valid_data_out_buffer <= std_logic_vector(data_in_buffer(7 downto 0));
		
		when ("00")& x"16" =>
		valid_data <= '1';
		valid_data_out_buffer <= std_logic_vector(data_in_buffer(7 downto 0));
		
		when ("00")& x"1E" =>
		valid_data <= '1';
		valid_data_out_buffer <= std_logic_vector(data_in_buffer(7 downto 0));
		
		when ("00")& x"26" =>
		valid_data <= '1';
		valid_data_out_buffer <= std_logic_vector(data_in_buffer(7 downto 0));
		
		when ("00")& x"25" =>
		valid_data <= '1';
		valid_data_out_buffer <= std_logic_vector(data_in_buffer(7 downto 0));
		
		when ("00")& x"2E" =>
		valid_data <= '1';
		valid_data_out_buffer <= std_logic_vector(data_in_buffer(7 downto 0));
		
		when ("00")& x"36" =>
		valid_data <= '1';
		valid_data_out_buffer <= std_logic_vector(data_in_buffer(7 downto 0));
		
		when ("00")& x"3D" =>
		valid_data <= '1';
		valid_data_out_buffer <= std_logic_vector(data_in_buffer(7 downto 0));
		
		when ("00")&x"3E" =>
		valid_data <= '1';
		valid_data_out_buffer <= std_logic_vector(data_in_buffer(7 downto 0));
		
		when ("00")& x"46" =>
		valid_data <= '1';
		valid_data_out_buffer <= std_logic_vector(data_in_buffer(7 downto 0));
		
		when ("00")& x"45" =>
		valid_data <= '1';
		valid_data_out_buffer <= std_logic_vector(data_in_buffer(7 downto 0));
		
		when others =>
		valid_data <= '0';
		valid_data_out_buffer <= (others => '0');
		end case;
		
		else 
		valid_data <= '0';
		valid_data_out_buffer <= (others => '0');
		end if;
		end if;
		
		end process;

end behavioral;
	
