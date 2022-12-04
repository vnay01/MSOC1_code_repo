LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
USE std.textio.all;
USE std.standard.all;

-- File Write

entity FILE_WRITE is
	port (
			clk : in std_logic;
			reset : in std_logic;
			read : in std_logic;
			ram_read_data : in std_logic_vector(15 downto 0)
			);

end FILE_WRITE;

architecture beh of FILE_WRITE is

	file outfile : text open write_mode is "C:/Users/vnay0/Desktop/IC_project/EMM_ICP2/EMM_ICP2.srcs/sources_1/imports/EMM_ICP2/write_file.txt" ;        -- create file handle
	signal write_word : integer;                                       -- variable to store each line
	
	begin
	
	write_word <= to_integer(unsigned(ram_read_data));			-- Convert data to integer for humans
	
	write_process: process(clk, reset, read)
	
	variable output_line : line;

	begin
	
	   if reset = '1' then
	        
	       if rising_edge(clk) then
    		write(output_line, write_word);           -- takes input and queues it into a 'FIFO'
		
	       	writeline(outfile, output_line);          -- writes content to file
	       	end if;
	       end if;
	end process;

end beh;
	
	
	
	