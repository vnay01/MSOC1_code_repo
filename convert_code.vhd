-- convert scan code Serial to parallel

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

--use ieee.numeric_std.all;

-- entity declarations

entity convert_scancode is
	port (
			clk : in std_logic;
			rst : in std_logic;
			edge_found : in std_logic;
			serial_data : in std_logic;
			valid_scan_code : out std_logic;
			scan_code_out : out std_logic_vector(7 downto 0)
			);
	end convert_scancode;

-- architecture of convert scan code:
-- We will need counters, registers for serial to parallel conversion, logic to check validity of code and logic to 
architecture beh_convert_scan_code of convert_scancode is 
	
	-- signal declarations
	signal shift_data_reg : std_logic_vector(9 downto 0);	-- will be used as intermediate register to store input serial data till counter trigger.
	signal counter_enable : std_logic; -- uses 'edge_found' as trigger for counter
	signal kb_data_parallel : std_logic_vector(7 downto 0);		-- keyboard data after SIPO leaving behind Start, Parity and Stop bit. 
																-- Will be used for checking validity of received data.
	signal counter_valid_check : std_logic;	-- used to enable 'Scan Code validity' check . Becomes High when counter reached 0.
	signal counter, counter_next : std_logic_vector(3 downto 0) ;
	signal counter_load : std_logic_vector( 3 downto 0) := "1011" ;
	begin
-- registers for serial to parallel conversion of keyboard data
		registers: process(clk, rst, edge_found)
		begin
			if rst = '1' then
			kb_data_parallel <= "0000000";	-- reset output of parallel register is x00H;
			counter_load <= "1011";
			elsif edge_found = '1' then
				if rising_edge(clk) then
				shift_data_reg(9) <=serial_data;
				shift_data_reg(8 downto 0) <= shift_data_reg(9 downto 1);
				end if;
			end if;
		end process;
		
		-- counter is required for counting down 11 clock cycles.
		counter_process : process(edge_found, clk, rst)
			begin
				if (rst = '1') then
				counter_load <= "1011"; 
				elsif edge_found = '1' and rising_edge(clk) then
					   counter <= counter_next;
					end if;
					--end if;
			-- next state logic for counter
			
			if (counter = "0000") then
			counter_next <=counter_load;
			else
			counter_next <= counter - 1;
			end if;
			end process;
			
		counter_enable_signal: process(counter)
		                     begin
								case (counter) is
								when "0000" =>
								counter_enable <= '1';
								when others=> 
								counter_enable <= '0';
								end case;
								end process;
		-- scan_code_check
		process( counter_enable, shift_data_reg)
		begin
		if counter_enable = '1' then
			kb_data_parallel <= shift_data_reg( 7 downto 0);
			else
			kb_data_parallel <= "00000000" ;
			end if;
		
		end process;
		end beh_convert_scan_code;
		