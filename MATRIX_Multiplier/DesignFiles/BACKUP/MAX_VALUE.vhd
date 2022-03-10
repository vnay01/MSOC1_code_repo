-- Maximum Value calculation

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity max_value is
	port (
			clk : in std_logic;
			reset : in std_logic;
			enable : in std_logic;
			d_in : in std_logic_vector(31 downto 0);
			max_val_out : out std_logic_vector(31 downto 0)
			);
end entity;

architecture beh of max_value is

	signal enable_reg : std_logic;
	signal d_in_reg, comparator : unsigned( 31 downto 0);
	
begin
	
	process(clk, d_in, reset, enable )
		begin
			if reset = '1' then
				d_in_reg <= (others =>'0');
				comparator <= (others => '0');
				else
					if rising_edge(clk) then
					 if enable = '1' then
						d_in_reg <= unsigned(d_in);
						end if;
						
						if d_in_reg >= unsigned(d_in) then
							comparator <= d_in_reg;
							else
							comparator<= unsigned( d_in );
							end if;
				end if;
		end if;
		end process;
		
max_val_out <= std_logic_vector(comparator);

end beh;		