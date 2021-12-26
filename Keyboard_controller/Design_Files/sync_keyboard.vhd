-------------------------------------------------------------------------------
-- Title      : sync_keyboard.vhd 
-- Project    : Keyboard VLSI Lab
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity sync_keyboard is
    port (
	     clk : in std_logic; 
	     kb_clk : in std_logic;
	     kb_data : in std_logic;
	     kb_clk_sync : out std_logic;
	     kb_data_sync : out std_logic
	 );
end sync_keyboard;

	
architecture sync_keyboard_arch of sync_keyboard is

	-- signal metastable_data, stable_data : std_logic := '0'; 
	-- signal metastable_clk, stable_clk : std_logic := '0'; 
	signal metastable_data : std_logic; 
	signal metastable_clk : std_logic; 
	

begin
	registers: process(clk) -- Lägga till n_rst? Den måste ju finnas som port då också änna?
	begin
		
		if rising_edge(clk) then
			metastable_data <= kb_data;
			metastable_clk	<= kb_clk;

			-- stable_data 	<= metastable_data;
			-- stable_clk		<= metastable_clk;

			-- kb_clk_sync		<= stable_clk;
			-- kb_data_sync	<= stable_data;
			
			kb_clk_sync		<= metastable_clk;
			kb_data_sync	<= metastable_data;
		end if;
	end process;

end sync_keyboard_arch;
