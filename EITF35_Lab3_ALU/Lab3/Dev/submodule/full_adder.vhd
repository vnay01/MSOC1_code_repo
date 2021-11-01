-- Design of Full Adder

library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port(
			A : in std_logic;
			B : in std_logic;
			carry_in : in std_logic;
			sum : out std_logic;
			carry_out : out std_logic
			);
	end full_adder;

-- architecture for full_adder
architecture structural of full_adder is

-- signals used in Full_adder 
	s_int, p_ab, carry_int : std_logic := '0';
	
-- structure of sum:
	s_int <= A xor B ;
	sum <= s_int xor carry_in ;
	
-- structure of carry out:
	p_ab <= A and B;
	c_int <= s_int and carry_in ;
	carry_out <= p_ab or carry_int ;

end structural;
