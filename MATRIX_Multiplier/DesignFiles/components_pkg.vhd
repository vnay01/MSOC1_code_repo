library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package components_pkg is

type out_port is array(15 downto 0) of std_logic_vector(7 downto 0);
-- Component Multiplier_Unit
component PE_module is
Port (
        reset : std_logic;
        clk : in std_logic;
        enable : in std_logic_vector(6 downto 0);       -- comes from controller
        in_X_odd, in_X_even : in std_logic_vector( 7 downto 0);
        in_A_odd, in_A_even : in std_logic_vector(6 downto 0);
        out_elem : out std_logic_vector(16 downto 0);   -- output element
        done : out std_logic         -- goes to control path
         );
end component;


component Multiplier_Unit is
  Port (
        reset : in std_logic;
        clk : in std_logic;
        in_mult_en : in std_logic;
        in_X : in std_logic_vector(7 downto 0);
        in_A : in std_logic_vector(6 downto 0);
        prod_elem: out std_logic_vector(15 downto 0) );
end component;


-- Component CL_adder
component CL_adder is
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
end component;

-- Component Full_Adder
component full_adder is
port (
        in_A : in std_logic;
        in_B : in std_logic;
        in_carry : in std_logic;
        out_sum : out std_logic;
        out_carry : out std_logic
        );
 end component;
 
 -- Multiplier
component multiplier is
generic (
            N : integer := 7
            );
  port (
        reset : in std_logic;
        in_X : in std_logic_vector(N downto 0);
        in_A : in std_logic_vector(N-1 downto 0);
        mult_en : in std_logic; -- may be redundant
        mult_done : out std_logic;
        out_P : out std_logic_vector(2*N downto 0)
  );
end component;
 
 
end components_pkg;



package body components_pkg is

end components_pkg;


-- COMPONENT DEFINITIONS
----------------------------------------------------------------------------------
-- Module Name: PE_module - Behavioral
-- Description: 
--             This module produces an individual elements of the product matrix as output
-- Dependencies: 
--              1) Multiplier
--              2) CL_adder
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.components_pkg.all;
use work.ram_control_pkg.all;

entity PE_module is
Port (
        reset : std_logic;
        clk : in std_logic;
        enable : in std_logic_vector(6 downto 0);       -- comes from controller
        in_X_odd, in_X_even : in std_logic_vector( 7 downto 0);
        in_A_odd, in_A_even : in std_logic_vector(6 downto 0);
        out_elem : out std_logic_vector(16 downto 0);   -- output element
        done : out std_logic         -- goes to control path
         );
end PE_module;

architecture Behavioral of PE_module is

signal mult_odd, mult_odd_next, mult_even, mult_even_next: std_logic_vector(14 downto 0);
signal sum_odd, sum_odd_next, sum_even, sum_even_next : std_logic_vector(15 downto 0);

signal sum_2, sum_2_next : std_logic_vector(15 downto 0);
signal enable_next : std_logic_vector(7 downto 0);                      -- gets updated with controller signals
signal A_1, A_1_next, A_2, A_2_next : std_logic_vector(17 downto 0);
signal sum_2_stage : std_logic_vector(18 downto 0);

signal done_status, done_status_next : std_logic_vector(7 downto 0);
signal done_next :std_logic;

begin

-- Multiplier Block
odd_mult: multiplier
generic map(
            N => 7
            )
port map(
        reset => reset,
        in_X => in_X_odd,
        in_A => in_A_odd,
        mult_en => enable_next(1),
        out_P => mult_odd,
        mult_done => done_status(0)         -- Needs to be ammended later
        );

odd_ADD : CL_adder
generic map(
            N => 15
            )
port map(
            reset => reset,
            in_A => mult_odd_next,
            in_B => sum_odd_next(14 downto 0),
            add_en => enable_next(2) ,
            out_sum => sum_odd,
            add_done => done_status(1)
);

even_mult: multiplier
generic map(
            N => 7
            )
port map(
        reset => reset,
        in_X => in_X_even,
        in_A => in_A_even,
        mult_en => enable_next(1),
        out_P => mult_even,
        mult_done => done_status(2)
        );

even_ADD : CL_adder
generic map(
            N => 15
            )
port map(
            reset => reset,
            in_A => mult_even_next,
            in_B => sum_even_next(14 downto 0),
            add_en => enable_next(2) ,
            out_sum => sum_even,
            add_done => done_status(3)
);

-- ADD2 Stage
ADD_2 : CL_adder
generic map(
            N => 18
            )
port map(
            reset => reset,
            in_A => A_1,
            in_B => A_2,
            add_en => enable_next(3) ,
            out_sum => sum_2_stage,
            add_done => done_status(4)
);

-- Control Path Signal
comb_block:process(enable)
    begin
    case enable is

    when "0000001" =>                       -- READ state       -- "0000_0001"
    enable_next <= x"01";   
    
    when "0000010" =>                       -- IDLE state       -- "0000_0010"
    enable_next <= x"02";
    
    when "0000100" =>                       -- LOAD State       -- "0000_0100"
    enable_next <= x"04";
    
    when "0001000" =>                       -- MULT state       -- "0000_1000"
    enable_next <= x"08";
    
    when "0010000" =>                       -- ADD state        -- "0001_0000"
    enable_next <= x"a0";
    
    when "0100000" =>                       -- ADD_2 state      -- "0010_0000"
    enable_next <= x"20";
    
    when "1000000" =>                       -- RAM_STORE state  -- "0100_0000"
    enable_next <= x"40";
    
--    when "111" =>                       -- Default state    -- "0000_0000"
--    enable_next <= x"00";               -- every block is disabled
    
    when others =>                      -- Default state
    enable_next <= (others => '0');     -- every block is disabled
    
    end case;   

end process;


register_update : process(clk, reset, mult_odd)
begin
    if rising_edge(clk) then
     if reset = '1' then
    mult_odd_next <= (others => '0');
    mult_even_next <= (others => '0');
    sum_odd_next <= (others => '0');
    sum_even_next <= (others => '0');
    done_status_next <= (others =>'0');
    A_1 <= (others => '0');
    A_2<= (others => '0');
    done_status_next <=(others => '0');
    else
    mult_odd_next <= mult_odd;
    mult_even_next <= mult_even;
    sum_odd_next <= sum_odd;
    sum_even_next <= sum_even;
    A_1 <= "00" & sum_odd_next ;
    A_2 <= "00" & sum_even_next;
    done_status_next <= done_status;
     end if;
    end if;
end process;

process(done_status_next)
begin
done_next <= (done_status_next(7) or done_status_next(6) or done_status_next(5) or done_status_next(4) or done_status_next(3) or done_status_next(2) or done_status_next(1) or done_status_next(0));
end process;

-- Will be updated later 
out_elem <= sum_2_stage( 16 downto 0);

comb_done: process(done_next)
    begin
    if done_next ='1' then
    done <= '1';
    else
    done <= '0';
    end if;
end process;

end Behavioral;

-- END PE_module
----------------------------------------------------------------


-- Module Name: Multiplier_Unit - Behavioral
-- Dependencies:
--              1) CL_adder
--              2) multiplier
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.components_pkg.all;


entity Multiplier_Unit is
  Port (
        reset : in std_logic;
        clk : in std_logic;
        in_mult_en : in std_logic;
        in_X : in std_logic_vector(7 downto 0);
        in_A : in std_logic_vector(6 downto 0);
        prod_elem: out std_logic_vector(15 downto 0) );
end Multiplier_Unit;

architecture Behavioral of Multiplier_Unit is

-- COMPONENTS -- needs to be made more structured
component multiplier is
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
end component;

-- CL_adder
component CL_adder is
generic ( 
         N : integer := 15 
         );
  Port (    
            reset : in std_logic;
            in_A: in std_logic_vector(N-1 downto 0);
            in_B : in std_logic_vector(N-1 downto 0);
            out_sum : out std_logic_vector( N downto 0)
            );
end component;

-- SIGNALS
signal mult_out : std_logic_vector(14 downto 0);
signal sum_elem, sum_elem_next,sum_elem_next_2,  in_B_reg : std_logic_vector(15 downto 0);
signal mult_en_sig : std_logic;

begin
    
 multiplier_unit : multiplier
 generic map (
            N => 7
            )
  port map(  
            reset => reset,
            in_X => in_X,
            in_A =>in_A,
            mult_en => '1',
            out_P => mult_out
            );


add_unit: CL_adder 
    generic map( 
         N => 15 
         )
  Port map ( 
            reset => reset,
            in_A => mult_out,
            in_B => in_B_reg(14 downto 0),
            out_sum => sum_elem            
            );
            
  mult_en_sig <= in_mult_en;
        
   process(clk, sum_elem,in_B_reg, sum_elem_next ,mult_en_sig, reset)
   begin
   
    
        if reset = '1' then
        sum_elem_next <= (others => '0');
        in_B_reg <= (others => '0');
        elsif rising_edge(clk) then
        
        if mult_en_sig = '1' then
        sum_elem_next <= sum_elem;     -- register to store sum from CLA
        in_B_reg <= sum_elem_next;
        else
        sum_elem_next <= (others => '0');
        in_B_reg <= (others => '0');
        end if;
        end if;
   end process;
   
prod_elem <= sum_elem_next;

end Behavioral;


------------ CLA Definition


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

-- CLA End


--------------------------------
--
--    Full Adder
--   
---------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity full_adder is
port (
        in_A : in std_logic;
        in_B : in std_logic;
        in_carry : in std_logic;
        out_sum : out std_logic;
        out_carry : out std_logic
        );
 end full_adder;
 
 architecture struc of full_adder is
 
 -- SIGNALS
 signal A, B, C_in, SUM, C_out : std_logic;
  
 
 
 begin
 
 A <= in_A;
 B <= in_B;
 C_in <= in_carry;
 
 out_sum <= SUM;
 out_carry <= C_out;
 
 -- Struct for SUM
  SUM <= A xor B xor C_in;
  C_out <= (( A xor B )and C_in) or (A and B);
 
 end struc;
 
 -- Full_Adder end
 
 
 ----- Multipliers
 
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






