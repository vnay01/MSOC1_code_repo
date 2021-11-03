library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.ALU_components_pack.all;

entity binary2BCD is
   generic ( WIDTH : integer := 8   -- 8 bit binary to BCD
           );
   port ( 
            binary_in : in  std_logic_vector(WIDTH-1 downto 0);  -- binary input width
            BCD_out   : out std_logic_vector(9 downto 0)        -- BCD output, 10 bits [2|4|4] to display a 3 digit BCD value when input has length 8
        );
end binary2BCD;

--architecture
-- 8 bit bin 2 bcd

architecture beh of binary2BCD is

begin
 bcd1: process(binary_in)
 variable z : std_logic_vector(17 downto 0);
 
 begin
	for i in 0 to 17 loop
	z(i) := '0';
	end loop;
	z(10 downto 3) := binary_in;
	 for i in 0 to 4 loop
	 if z(11 downto 8) > 4 then
		z(11 downto 8) := z(11 downto 8) +3;
		end if;
		if z(15 downto 12 ) > 4 then
			z(15 downto 12 ) := z(15 downto 12) +3;
			end if;
			z(17 downto 1) := z(16 downto 0);
			end loop;
			BCD_out <= z(17 downto 8);
	end process bcd1;
end beh;