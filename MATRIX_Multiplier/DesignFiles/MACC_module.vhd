library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sig_altmult_accum is
	port 
	(
		x			: in unsigned(7 downto 0);
		a			: in unsigned (6 downto 0);
		clk			: in std_logic;
		sload		: in std_logic;
		done		: out std_logic;	-- gets active when 8 multiply and 7 accumulate are done
		accum_out	: out unsigned (15 downto 0)
	);
	
end entity;

architecture rtl of sig_altmult_accum is

	-- Declare registers for intermediate values
	signal x_reg : signed (7 downto 0);
	signal a_reg : signed (6 downto 0);
	signal sload_reg : std_logic;
	signal mult_reg : signed (15 downto 0);
	signal adder_out : signed (15 downto 0);
	signal old_result : signed (15 downto 0);
	signal count, count_next : unsigned(2 downto 0);
	
begin

	mult_reg <= x_reg * a_reg;
	
	process (adder_out, sload_reg)
	begin
		if (sload_reg = '1') then
			-- Clear the accumulated data
			old_result <= (others => '0');
			count_next <= (others =>'0');
		else
			old_result <= adder_out;
			count_next <= count + 1;
		end if;
	end process;
	
	process(count)
	begin
		if count = 7 then
			done <= '1' ;
			else
			done <= '1';
			end if;
	end process;
	
	process (clk)
	begin
		if (rising_edge(clk)) then
			x_reg <= x;
			a_reg <= x;
			sload_reg <= sload;
			count <= count_next;
			
			-- Store accumulation result in a register
			adder_out <= old_result + mult_reg;
		end if;
	end process;
	
	-- Output accumulation result
	accum_out <= adder_out;
	
end rtl;
