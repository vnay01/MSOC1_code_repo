----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.02.2022 15:10:24
-- Design Name: 
-- Module Name: CL_adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity CL_adder is
generic ( 
         N : integer := 15 
         );
  Port (    
            reset : in std_logic;
            in_A: in std_logic_vector(N-1 downto 0);
            in_B : in std_logic_vector(N-1 downto 0);
            add_en : in std_logic;
            out_sum : out std_logic_vector( N downto 0);
            add_done : out std_logic
            );
end CL_adder;


architecture Behavioral of CL_adder is
-- components

component full_adder is
port (
        in_A : in std_logic;
        in_B : in std_logic;
        in_carry : in std_logic;
        out_sum : out std_logic;
        out_carry : out std_logic
        );
end component;

-- SIGNALS
signal A,B : std_logic_vector(N-1 downto 0);          -- inputs to FA
signal C : std_logic_vector(N downto 0);            -- carry input to 1-bit FA
signal sum : std_logic_vector(N-1 downto 0);
signal G_i, P_i : std_logic_vector(N-1 downto 0);     -- Carry Generate and Carry Propagate signals

begin

-- Use Generate to generate 4 Full Adders
A<= in_A;
B<= in_B;


-- This block produces SUM
gen: for i in 0 to N-1 generate
FA: full_adder
port map(
           in_A => A(i),
           in_B => B(i),
           in_carry => C(i),
           out_sum => sum(i),
           out_carry => open        -- Synthesis tool is smart and will optimize unused port!
            );
end generate gen;

-- Carry LookAhead Generation
-- Carry propagate generation block
gen_P_i: for i in 0 to N-1 generate
P_i(i) <= A(i) xor B(i);
end generate gen_P_i;

-- Carry generate generation block
gen_G_i: for i in 0 to N-1 generate
G_i(i) <= A(i) and B(i);
end generate gen_G_i;

gen_C: for i in 0 to  N-1 generate
C(i+1) <= G_i(i) or (P_i(i) and C(i));
end generate gen_C;

C(0)<= '0'; -- No Carry input

process(add_en, sum, C)
begin
if add_en = '1' then
out_sum <= C(N)&sum;
add_done <= '1';
else
out_sum <= (others => '0');
add_done <= '0';

end if;
end process;

end Behavioral;
