----------------------------------------------------------------------------------
-- Engineer: Vinay Singh
-- 
-- Create Date: 05.02.2022 18:03:41
-- Design Name: Shift - ADD multiplier 
-- Module Name: multiplier - Behavioral
-- Project Name: IC Project
-- Revision: v0.1
-- Revision 0.01 - File Created
-- Additional Comments:
-- generic multiplier with one clock cycle output architecture -- AREA inefficient
-- To save area.. I will change the architecture to SHIFT - ADD or 
-- other more efficient architectures
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity multiplier is
generic (
            N : integer := 7
            );
  port (
        reset : in std_logic;
        in_X : in std_logic_vector(N downto 0);
        in_A : in std_logic_vector(N-1 downto 0);
        mult_en : in std_logic; -- may be redundant
        out_P : out std_logic_vector(2*N downto 0);
        mult_done : out std_logic
        
  );
end multiplier;

architecture Behavioral of multiplier is
signal  au,bv0, bv1, bv2, bv3, bv4, bv5, bv6 : unsigned(N downto 0);
signal  pp0, pp1, pp2, pp3, pp4, pp5, pp6: unsigned(2*N downto 0);
signal prod : unsigned( 2*N downto 0);
signal prod_int, X, A : integer;

begin

-- Testing for multiplication functionality

au <= unsigned(in_X);
bv0 <= "0" & unsigned(in_A);
X <= to_integer(au);
A <= to_integer(bv0);
prod_int <= X*A;
prod <= to_unsigned(prod_int,15);

prod <= to_unsigned(prod_int,15);

process(reset, mult_en)
begin
if reset = '1' or mult_en =  '0' then
out_P <= (others => '0');
mult_done <= '0';
elsif mult_en = '1' then
out_P <= std_logic_vector(prod);
mult_done <= '1';
end if;
end process;
--au <= unsigned(in_X);       -- input Matrix element
--bv0 <= (others => in_A(0));
--bv1 <= (others => in_A(1));
--bv2 <= (others => in_A(2));
--bv3 <= (others => in_A(3));
--bv4 <= (others => in_A(4));
--bv5 <= (others => in_A(5));
--bv6 <= (others => in_A(6));


--pp0 <= "0000000" & (au and bv0);
--pp1 <= "000000" &(au and bv1) & "0";
--pp2 <= "00000" & (au and bv2) & "00";
--pp3 <= "0000" & ( au and bv3 ) & "000";
--pp4 <= "000" & (au and bv4) & "0000";
--pp5 <= "00" & ( au and bv5) & "00000";
--pp6 <= "0" & ( au and bv6 ) & "000000";

--prod <= (( pp6) + (pp5 + pp4) + (pp3 + pp2) + (pp1 + pp0));

--out_P <= std_logic_vector(prod);  -- Look into it

----process(reset)
----begin
----if reset = '1' then
----out_P <= (others => '0');
----else
----out_P <= std_logic_vector(prod);
----end if;
----end process;
end Behavioral;