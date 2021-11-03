library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity edge_detector is
    port (
	     clk : in std_logic;
	     reset : in std_logic;
	     button_in : in std_logic;
	     button_out : out std_logic
	 );
end edge_detector;


architecture edge_detector_arch of edge_detector is
	-- signal declarations: 
	signal first_sample, final_sample : std_logic :='0';	-- Is default value required?
		
begin
	registers : process(clk,reset)
		begin
			if reset = '1' then
			first_sample <= '0';
			final_sample <= '0';
			elsif rising_edge (clk) then
				first_sample <= button_in;
				final_sample <= first_sample;
			end if;
		end process;
	combinational : process(first_sample, final_sample)
		begin
			button_out <= (not first_sample) and ( final_sample);
		end process;
end edge_detector_arch;
