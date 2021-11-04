
-- unsigned modulo 3 operation

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

-- entity unsigned modulo 3 

entity mod3 is
	port (
			A : in std_logic_vector(7 downto 0);
			mod3_out: out std_logic_vector(1 downto 0)
				);
end mod3;


architecture beh of mod3 is
	
-- signal definitation

--	signal x1, x2, x3, x4, x5, x6 ,x7, x8 : unsigned(7 downto 0) := (others => '0') ;
constant x1: integer := 192;
constant x2: integer := 96;
constant x3: integer := 48;
constant x4: integer := 24;
constant x5: integer := 12;
constant x6: integer := 6;
constant x7: integer := 3;
constant x8: integer := 0;


	
	
	signal sub, A_internal, intermediate_store1 : unsigned(7 downto 0) := (others => '0') ;
	signal intermediate_store2 : unsigned(7 downto 0);
	signal intermediate_store3 : unsigned(7 downto 0);
	signal intermediate_store4 : unsigned(7 downto 0);
	signal intermediate_store5 : unsigned(7 downto 0);
	signal intermediate_store6 : unsigned(7 downto 0);
	signal intermediate_store7 : unsigned(7 downto 0);
	signal intermediate_store8 : unsigned(7 downto 0);
	
	
	begin
		
		process(A)
			begin
				A_internal <= unsigned(A); 		-- assign A as unsigned
				
				if A_internal > (to_unsigned(x1)) then
					intermediate_store1 <= A_internal - to_unsigned(x1);
					else
					intermediate_store1 <= A_internal;
					end if;	
					
			end process;
		process(intermediate_store1)
			begin
			if intermediate_store1 > (to_unsigned(x2)) then
				intermediate_store2 <= intermediate_store1 - to_unsigned(x2);
				else
				intermediate_store2 <= intermediate_store1;
				end if;
				end process;
				
		process(intermediate_store2)
			begin
			if intermediate_store2 > (to_unsigned(x3)) then
				intermediate_store3 <= intermediate_store2 - to_unsigned(x2);
				else
				intermediate_store3 <= intermediate_store2;
				end if;
				end process;
				
		process(intermediate_store3)
			begin
			if intermediate_store3 > (to_unsigned(x4)) then
				intermediate_store4 <= intermediate_store3 - to_unsigned(x3);
				else
				intermediate_store4 <= intermediate_store3;
				end if;
				end process;

		process(intermediate_store4)
			begin
			if intermediate_store4 > (to_unsigned(x5)) then
				intermediate_store5 <= intermediate_store4 - to_unsigned(x5);
				else
				intermediate_store5 <= intermediate_store4;
				end if;
				end process;

		process(intermediate_store5)
			begin
			if intermediate_store5 > (to_unsigned(x6)) then
				intermediate_store6 <= intermediate_store5 - to_unsigned(x6);
				else
				intermediate_store6 <= intermediate_store5;
				end if;
				end process;	


		process(intermediate_store6)
			begin
			if intermediate_store6 >= (to_unsigned(x7)) then
				intermediate_store7 <= intermediate_store6 - to_unsigned(x7);
				else
				intermediate_store7 <= intermediate_store6;
				end if;
		mod3_out <= intermediate_store7;
				end process;	


				

end beh;
			
			
		
		
		
