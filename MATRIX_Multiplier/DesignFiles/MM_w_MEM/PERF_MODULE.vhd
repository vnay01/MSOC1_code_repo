library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity perf_module is
	port 
	(
		x			: in unsigned(31 downto 0);        -- input matrix
	--	a			: in unsigned (7 downto 0);       -- coefficiet elem
		clk			: in std_logic;
		clear		: in std_logic;            -- MM_controller must enable it based on MACC_count
		enable      : in std_logic;            -- MM_controller / datapath_ctrl(3)
		accum_out	: out unsigned (31 downto 0)	-- MEAN Value of diagonal elements
	);
	
end perf_module;

architecture beh of perf_module is


	signal x_reg : unsigned (31 downto 0);
--	signal a_reg : unsigned (7 downto 0);
	signal reg_clear, reg_enable : std_logic;
	signal add_reg, add_reg_next : unsigned (31 downto 0);
	signal adder_out : unsigned (31 downto 0);
	signal mean_val : unsigned(31 downto 0);
	signal old_result : unsigned (31 downto 0);

begin

	
-- add_reg <= x_reg + x;
	
process (clk, old_result)
begin
--adder_out <=(others =>'0');
 if rising_edge(clk) then
			x_reg <= x;
		--	a_reg <= a;
			reg_clear <= clear;
			reg_enable <= enable;
         -- Store accumulation result in a register
			adder_out <= old_result + x_reg;

 end if;
	end process;

process (adder_out, reg_clear)
	begin
	   
--	     if rising_edge(clk) then 
		if (reg_clear = '1') then
			-- Clear accumulater
            old_result <= (others =>'0');
		else
		     old_result <= adder_out;
			end if;
--		end if;
	end process;
	mean_val <= shift_right(adder_out,2);
	accum_out <= mean_val;


end beh;