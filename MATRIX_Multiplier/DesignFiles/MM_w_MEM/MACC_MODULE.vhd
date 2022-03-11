library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MAC is
	port 
	(
		x			: in unsigned(7 downto 0);        -- input matrix
		a			: in unsigned (6 downto 0);       -- coefficiet elem
		clk			: in std_logic;
		clear		: in std_logic;            -- MM_controller must enable it based on MACC_count
		enable      : in std_logic;            -- MM_controller / datapath_ctrl(3)
		accum_out	: out unsigned (15 downto 0)
	);
	
end MAC;

architecture beh of MAC is

	-- Declare registers for intermediate values
	signal x_reg : unsigned (7 downto 0);
	signal a_reg : unsigned (6 downto 0);
	signal reg_clear, reg_enable : std_logic;
	signal mult_reg, mul_reg_next : unsigned (14 downto 0);
	signal adder_out : unsigned (15 downto 0);
	signal old_result : unsigned (15 downto 0);
--	signal count, count_next : unsigned(2 downto 0);
--	signal done_reg : std_logic;
	
begin

	
	mult_reg <= x_reg * a_reg;
	
process (clk, old_result, mult_reg)
begin
--adder_out <=(others =>'0');
 if rising_edge(clk) then
			x_reg <= x;
			a_reg <= a;
			reg_clear <= clear;
			reg_enable <= enable;
         -- Store accumulation result in a register
			adder_out <= old_result + mult_reg;

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

		
	-- Output result
--process(reg_enable, clk)
--begin
--if rising_edge(clk) then
--if reg_enable = '1' then
	accum_out <= adder_out;
--end if;
--end if;	
--end process;

end beh;
