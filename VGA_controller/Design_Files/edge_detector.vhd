-- Works too good! Make it worse!
-------------------------------------------------------------------------------
-- Title      : edge_detector.vhd 
-- Project    : Keyboard VLSI Lab
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Description: 
-- 		        Make sure not to use 'EVENT on anyother signals than clk
-- 		        
--
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity edge_detector is
    port (
	     clk : in std_logic;
	     rst : in std_logic;
	     kb_clk_sync : in std_logic;
	     edge_found : out std_logic
	 );
end edge_detector;


architecture edge_detector_arch of edge_detector is

	signal 	first_sample, last_sample : std_logic := '0';
	signal next_edge_found : std_logic;

begin
	edgedetect : process(clk, rst) -- lägg till rst?
		begin
			if rst = '1' then
				--- add what?
				edge_found <= '0';
			elsif rising_edge(clk) then
				-- edge_found	<=	'0';
				first_sample <= kb_clk_sync;	-- One flip-flop
				
				-- last_sample		<= kb_clk_sync;	-- Second flip-flop
				-- if last_sample = '0' AND first_sample = '1' then	
				-- 		-- Fallning edge upptäckt!
				-- 		edge_found	<= '1';
				-- end if;

				edge_found <= next_edge_found;

				-- if first_sample = '1' and kb_clk_sync = '0' then
				-- 	-- Edge detected!
				-- 	edge_found	<=	'1';
				-- end if;
			end if;
			-- TODO RST 
		end process;

	tmp_name : process(first_sample, kb_clk_sync)
	begin
		next_edge_found <= '0';
		if first_sample = '1' and kb_clk_sync = '0' then
			next_edge_found <= '1';
		end if;
	end process;

end edge_detector_arch;