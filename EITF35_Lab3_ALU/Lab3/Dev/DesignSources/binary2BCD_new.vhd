library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

--library work;
--use work.ALU_components_pack.all;

entity binary2bcd is 
	port (
		 i_clock : in std_logic;
		 i_start : in std_logic;
		 i_binary : in std_logic_vector (7 downto 0);
		 o_BCD  : out std_logic_vector(9 downto 0)
	);
end binary2bcd;

-- 8 bit bin 2 bcd

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity binbcd8 is 
port (
		b : in std_logic_vector(7 downto 0);
		p : out std_logic_vector(9 downto 0)
);
end binbcd8;

architecture beh of binbcd8 is

begin
 bcd1: process(B)
 variable z : std_logic_vector(17 downto 0);
 
 begin
	for i in 0 to 17 loop
	z(i) := '0';
	end loop;
	z(10 downto 3) := B;
	 for i in 0 to 4 loop
	 if z(11 downto 8) > 4 then
		z(11 downto 8) := z(11 downto 8) +3;
		end if;
		if z(15 downto 12 ) > 4 then
			z(15 downto 12 ) := z(15 downto 12) +3;
			end if;
			z(17 downto 1) := z(16 downto 0);
			end loop;
			p <= z(17 downto 8);
	end process bcd1;
end beh;	
		
		
